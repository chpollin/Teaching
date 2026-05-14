#!/usr/bin/env node
// build.mjs — static-site generator for the DH Developer Skriptum.
// Reads chapters/, knowledge/, site/, writes docs/.
// See knowledge/architecture.md for the pipeline specification.

import fs from "node:fs/promises";
import path from "node:path";
import { fileURLToPath } from "node:url";
import matter from "gray-matter";
import { marked } from "marked";
import lunr from "lunr";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const ROOT = __dirname;
const CHAPTERS_DIR = path.join(ROOT, "chapters");
const SITE_DIR = path.join(ROOT, "site");
const DOCS_DIR = path.join(ROOT, "docs");

const REQUIRED_FRONTMATTER = [
  "title", "slug", "chapter_id", "block", "block_title", "order",
  "status", "ct_markers", "paths",
];

const VALID_STATUS = ["stub", "draft", "review", "published"];
const VALID_CT = ["decomposition", "pattern-recognition", "abstraction", "algorithm-design"];

const LENGTH_ENVELOPE = {
  short: { min: 400, max: 700 },
  long: { min: 1500, max: 3500 },
};

const args = process.argv.slice(2);
const validateOnly = args.includes("--validate-only");

const errors = [];
const warnings = [];

function logError(file, message) {
  errors.push(`[ERROR] ${file}: ${message}`);
}

function logWarning(file, message) {
  warnings.push(`[WARN ] ${file}: ${message}`);
}

async function exists(p) {
  try {
    await fs.access(p);
    return true;
  } catch {
    return false;
  }
}

async function readText(p) {
  return fs.readFile(p, "utf8");
}

async function writeText(p, content) {
  await fs.mkdir(path.dirname(p), { recursive: true });
  await fs.writeFile(p, content, "utf8");
}

async function copyFile(src, dst) {
  await fs.mkdir(path.dirname(dst), { recursive: true });
  await fs.copyFile(src, dst);
}

async function copyDir(src, dst) {
  if (!(await exists(src))) return;
  const entries = await fs.readdir(src, { withFileTypes: true });
  for (const entry of entries) {
    const srcPath = path.join(src, entry.name);
    const dstPath = path.join(dst, entry.name);
    if (entry.isDirectory()) {
      await copyDir(srcPath, dstPath);
    } else {
      await copyFile(srcPath, dstPath);
    }
  }
}

function countWords(text) {
  return text.split(/\s+/).filter(Boolean).length;
}

function validateFrontmatter(fm, filePath) {
  for (const field of REQUIRED_FRONTMATTER) {
    if (fm[field] === undefined || fm[field] === null) {
      logError(filePath, `missing required field "${field}"`);
    }
  }
  if (fm.chapter_id && !/^\d{2}-\d{2}$/.test(fm.chapter_id)) {
    logError(filePath, `chapter_id must match /^\\d{2}-\\d{2}$/, got "${fm.chapter_id}"`);
  }
  if (fm.order !== undefined && !Number.isInteger(fm.order)) {
    logError(filePath, `order must be an integer, got ${typeof fm.order}`);
  }
  if (fm.status && !VALID_STATUS.includes(fm.status)) {
    logError(filePath, `status must be one of ${VALID_STATUS.join(", ")}, got "${fm.status}"`);
  }
  if (fm.ct_markers && fm.ct_markers.primary && !VALID_CT.includes(fm.ct_markers.primary)) {
    logError(filePath, `ct_markers.primary must be one of ${VALID_CT.join(", ")}, got "${fm.ct_markers.primary}"`);
  }
  if (fm.paths) {
    if (typeof fm.paths.short !== "boolean") logError(filePath, `paths.short must be boolean`);
    if (typeof fm.paths.long !== "boolean") logError(filePath, `paths.long must be boolean`);
  }
  if (Array.isArray(fm.vault_backing)) {
    for (const entry of fm.vault_backing) {
      if (typeof entry !== "object" || !entry.path || !entry.read_on) {
        logError(filePath, `vault_backing entries must have {path, read_on}`);
      }
    }
  }
}

function splitBothPaths(body) {
  const shortMarker = "## Short Synthesis";
  const longMarker = "## Long Form";
  const sharedMarkers = ["## Exercises", "## Further Reading", "## Glossary"];

  const shortIdx = body.indexOf(shortMarker);
  const longIdx = body.indexOf(longMarker);

  let sharedIdx = body.length;
  for (const marker of sharedMarkers) {
    const idx = body.indexOf(marker);
    if (idx >= 0 && idx < sharedIdx) sharedIdx = idx;
  }

  const ctMarkerMatch = body.match(/^>\s*\*\*CT in focus:\*\*[^\n]+/m);
  const ctMarkerText = ctMarkerMatch ? ctMarkerMatch[0] : null;

  const result = { ctMarker: ctMarkerText, short: null, long: null, shared: null };

  if (shortIdx >= 0) {
    const end = longIdx >= 0 ? longIdx : sharedIdx;
    result.short = body.slice(shortIdx + shortMarker.length, end).trim();
  }
  if (longIdx >= 0) {
    const end = sharedIdx;
    result.long = body.slice(longIdx + longMarker.length, end).trim();
  }
  if (sharedIdx < body.length) {
    result.shared = body.slice(sharedIdx).trim();
  }

  return result;
}

async function walkChapters() {
  if (!(await exists(CHAPTERS_DIR))) return [];

  const chapters = [];
  const blocks = await fs.readdir(CHAPTERS_DIR, { withFileTypes: true });

  for (const block of blocks) {
    if (!block.isDirectory()) continue;
    const blockDir = path.join(CHAPTERS_DIR, block.name);
    const entries = await fs.readdir(blockDir, { withFileTypes: true });

    for (const entry of entries) {
      if (!entry.isDirectory()) continue;
      const chapterDir = path.join(blockDir, entry.name);
      const indexPath = path.join(chapterDir, "index.md");
      if (!(await exists(indexPath))) continue;

      const raw = await readText(indexPath);
      const parsed = matter(raw);
      validateFrontmatter(parsed.data, indexPath);

      chapters.push({
        path: indexPath,
        relPath: path.relative(ROOT, indexPath),
        block: block.name,
        slug: entry.name,
        frontmatter: parsed.data,
        body: parsed.content,
      });
    }
  }

  return chapters;
}

async function walkBlocks() {
  if (!(await exists(CHAPTERS_DIR))) return [];

  const blocks = [];
  const entries = await fs.readdir(CHAPTERS_DIR, { withFileTypes: true });

  for (const entry of entries) {
    if (!entry.isDirectory()) continue;
    const blockMd = path.join(CHAPTERS_DIR, entry.name, "_block.md");
    if (!(await exists(blockMd))) continue;
    const raw = await readText(blockMd);
    const parsed = matter(raw);
    blocks.push({
      id: entry.name,
      frontmatter: parsed.data,
      body: parsed.content,
    });
  }

  return blocks;
}

function chapterUrl(chapter) {
  return `/Teaching/chapters/${chapter.block}/${chapter.slug}/`;
}

function blockUrl(blockId) {
  return `/Teaching/chapters/${blockId}/`;
}

function substituteTemplate(tpl, vars) {
  return tpl.replace(/\{\{(\w+)\}\}/g, (_, key) => {
    return vars[key] !== undefined && vars[key] !== null ? String(vars[key]) : "";
  });
}

async function renderChapter(chapter, chapterTpl) {
  const fm = chapter.frontmatter;
  const parts = splitBothPaths(chapter.body);

  const shortHtml = parts.short ? marked.parse(parts.short) : "<p><em>Short Synthesis pending.</em></p>";
  const longHtml = parts.long ? marked.parse(parts.long) : "<p><em>Long Form pending.</em></p>";
  const sharedHtml = parts.shared ? marked.parse(parts.shared) : "";

  if (fm.paths && fm.paths.short && parts.short) {
    const wc = countWords(parts.short);
    if (wc < LENGTH_ENVELOPE.short.min || wc > LENGTH_ENVELOPE.short.max) {
      logWarning(chapter.relPath, `Short word count ${wc} outside envelope ${LENGTH_ENVELOPE.short.min}-${LENGTH_ENVELOPE.short.max}`);
    }
  }
  if (fm.paths && fm.paths.long && parts.long) {
    const wc = countWords(parts.long);
    if (wc < LENGTH_ENVELOPE.long.min || wc > LENGTH_ENVELOPE.long.max) {
      logWarning(chapter.relPath, `Long word count ${wc} outside envelope ${LENGTH_ENVELOPE.long.min}-${LENGTH_ENVELOPE.long.max}`);
    }
  }

  const ctPrimary = fm.ct_markers ? fm.ct_markers.primary : "";
  const ctQuestion = parts.ctMarker ? parts.ctMarker.replace(/^>\s*\*\*CT in focus:\*\*\s*[^—]+—\s*/, "").trim() : "";

  const cite = `${fm.authors ? fm.authors.join(", ") : "Pollin, C."} (${(fm.created || "").slice(0,4)}). ${fm.title}. DH Developer Skriptum, chapter ${fm.chapter_id}. ${fm.project ? fm.project.repository : ""}`;

  const html = substituteTemplate(chapterTpl, {
    title: fm.title || "",
    lead: fm.lead || "",
    chapter_id: fm.chapter_id || "",
    license: fm.license || "CC-BY-4.0",
    canonical_url: `https://chpollin.github.io${chapterUrl(chapter)}`,
    block_url: blockUrl(chapter.block),
    block_title: fm.block_title || "",
    status: fm.status || "stub",
    ct_primary: ctPrimary,
    ct_question: ctQuestion,
    short: shortHtml,
    long: longHtml,
    exercises: "",
    further_reading: "",
    glossary: "",
    cite,
    prev_url: "",
    prev_title: "",
    next_url: "",
    next_title: "",
  });

  const outPath = path.join(DOCS_DIR, "chapters", chapter.block, chapter.slug, "index.html");
  await writeText(outPath, html);
}

async function renderBlock(block, chapters, blockTpl) {
  const fm = block.frontmatter;
  const blockChapters = chapters
    .filter((c) => c.block === block.id)
    .sort((a, b) => (a.frontmatter.order || 0) - (b.frontmatter.order || 0));

  const cardsHtml = blockChapters.length === 0
    ? "<li><em>No chapters yet. This block is being scaffolded in Phase 1.</em></li>"
    : blockChapters.map((c) => {
        return `<li>
          <a href="${chapterUrl(c)}">
            <span class="chapter-id">${c.frontmatter.chapter_id}</span>
            <strong>${c.frontmatter.title}</strong>
            <span class="chapter-status status-${c.frontmatter.status}">${c.frontmatter.status}</span>
          </a>
        </li>`;
      }).join("");

  const overviewHtml = marked.parse(block.body);

  const html = substituteTemplate(blockTpl, {
    block_id: block.id.split("_")[0],
    block_title: fm.title || block.id,
    canonical_url: `https://chpollin.github.io${blockUrl(block.id)}`,
    overview_html: overviewHtml,
    chapter_cards: cardsHtml,
  });

  const outPath = path.join(DOCS_DIR, "chapters", block.id, "index.html");
  await writeText(outPath, html);
}

async function renderHome(blocks, chapters, indexTpl) {
  const tilesHtml = blocks.length === 0
    ? "<p><em>Blocks loading. The build skeleton has no rendered tiles yet.</em></p>"
    : "";

  const html = substituteTemplate(indexTpl, {
    block_tiles: tilesHtml,
  });

  await writeText(path.join(DOCS_DIR, "index.html"), html);
}

async function generateChaptersJson(chapters) {
  const records = chapters.map((c) => ({
    chapter_id: c.frontmatter.chapter_id,
    title: c.frontmatter.title,
    slug: c.slug,
    block: c.block,
    block_title: c.frontmatter.block_title,
    order: c.frontmatter.order,
    status: c.frontmatter.status,
    ct_primary: c.frontmatter.ct_markers ? c.frontmatter.ct_markers.primary : null,
    url: chapterUrl(c),
    block_url: blockUrl(c.block),
  }));

  await writeText(path.join(DOCS_DIR, "data", "chapters.json"), JSON.stringify(records, null, 2));
}

async function generateSearchJson(chapters) {
  const records = chapters.map((c, i) => {
    const parts = splitBothPaths(c.body);
    return {
      id: i,
      chapter_id: c.frontmatter.chapter_id,
      title: c.frontmatter.title,
      block: c.block,
      block_title: c.frontmatter.block_title,
      url: chapterUrl(c),
      short: parts.short || "",
      long: parts.long || "",
    };
  });

  const index = lunr(function () {
    this.ref("id");
    this.field("title", { boost: 10 });
    this.field("chapter_id", { boost: 5 });
    this.field("short");
    this.field("long");
    records.forEach((rec) => this.add(rec));
  });

  await writeText(
    path.join(DOCS_DIR, "data", "search.json"),
    JSON.stringify({ index: index.toJSON(), records }, null, 2)
  );
}

async function copyStaticAssets() {
  const siteAssets = path.join(SITE_DIR, "assets");
  const docsAssets = path.join(DOCS_DIR, "assets");
  await copyDir(siteAssets, docsAssets);

  const site404 = path.join(SITE_DIR, "404.html");
  if (await exists(site404)) {
    await copyFile(site404, path.join(DOCS_DIR, "404.html"));
  }

  await writeText(path.join(DOCS_DIR, ".nojekyll"), "");
}

async function generateSitemap(chapters, blocks) {
  const urls = [
    "https://chpollin.github.io/Teaching/",
    ...blocks.map((b) => `https://chpollin.github.io${blockUrl(b.id)}`),
    ...chapters.map((c) => `https://chpollin.github.io${chapterUrl(c)}`),
  ];
  const xml = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
${urls.map((u) => `  <url><loc>${u}</loc></url>`).join("\n")}
</urlset>
`;
  await writeText(path.join(DOCS_DIR, "sitemap.xml"), xml);
}

async function generateRobots() {
  await writeText(path.join(DOCS_DIR, "robots.txt"), "User-agent: *\nAllow: /\nSitemap: https://chpollin.github.io/Teaching/sitemap.xml\n");
}

async function main() {
  console.log("Building DH Developer Skriptum site");
  console.log(`Root: ${ROOT}`);

  const chapters = await walkChapters();
  const blocks = await walkBlocks();

  console.log(`Found ${blocks.length} blocks, ${chapters.length} chapters`);

  if (errors.length > 0) {
    console.error("\nValidation errors:");
    errors.forEach((e) => console.error(e));
    process.exit(1);
  }

  if (validateOnly) {
    console.log("\nValidation passed");
    return;
  }

  const indexTpl = await readText(path.join(SITE_DIR, "index.html"));
  const chapterTpl = await readText(path.join(SITE_DIR, "chapter.html"));
  const blockTpl = await readText(path.join(SITE_DIR, "block.html"));

  await fs.mkdir(DOCS_DIR, { recursive: true });

  for (const chapter of chapters) {
    await renderChapter(chapter, chapterTpl);
  }
  for (const block of blocks) {
    await renderBlock(block, chapters, blockTpl);
  }

  await renderHome(blocks, chapters, indexTpl);
  await generateChaptersJson(chapters);
  await generateSearchJson(chapters);
  await copyStaticAssets();
  await generateSitemap(chapters, blocks);
  await generateRobots();

  if (warnings.length > 0) {
    console.warn("\nWarnings:");
    warnings.forEach((w) => console.warn(w));
  }

  console.log(`\nBuild complete. Output in ${DOCS_DIR}`);
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
