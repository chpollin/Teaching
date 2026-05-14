// app.js — bootstrap for the DH Developer Skriptum site.
// Loads navigation, attaches keyboard handlers, hydrates the path tab switcher.

import { buildSidebar } from "./nav.js";
import { initSearch } from "./search.js";

const STORAGE_KEY = "dhskriptum.path";

function initPathTabs() {
  const tabs = document.querySelectorAll(".path-tab");
  if (tabs.length === 0) return;

  const stored = localStorage.getItem(STORAGE_KEY);
  const initial = stored === "short" || stored === "long" ? stored : "long";

  function selectPath(path) {
    tabs.forEach((tab) => {
      const isActive = tab.dataset.path === path;
      tab.setAttribute("aria-selected", String(isActive));
    });
    document.querySelectorAll(".path-panel").forEach((panel) => {
      const isActive = panel.classList.contains(`path-${path}`);
      panel.setAttribute("aria-selected", String(isActive));
    });
    localStorage.setItem(STORAGE_KEY, path);
  }

  tabs.forEach((tab) => {
    tab.addEventListener("click", () => selectPath(tab.dataset.path));
  });

  selectPath(initial);
}

function initKeyboardShortcuts() {
  document.addEventListener("keydown", (event) => {
    if ((event.ctrlKey || event.metaKey) && event.key === "k") {
      event.preventDefault();
      document.dispatchEvent(new CustomEvent("dhskriptum:search-open"));
    }
    if (event.key === "1" && !event.target.closest("input, textarea")) {
      const shortTab = document.querySelector('.path-tab[data-path="short"]');
      if (shortTab) shortTab.click();
    }
    if (event.key === "2" && !event.target.closest("input, textarea")) {
      const longTab = document.querySelector('.path-tab[data-path="long"]');
      if (longTab) longTab.click();
    }
  });
}

async function loadChapters() {
  try {
    const response = await fetch("/Teaching/data/chapters.json");
    if (!response.ok) return null;
    return await response.json();
  } catch {
    return null;
  }
}

async function init() {
  const chapters = await loadChapters();

  if (chapters) {
    const sidebarEl = document.getElementById("sidebar");
    if (sidebarEl) buildSidebar(sidebarEl, chapters);

    const blockTilesEl = document.getElementById("block-tiles");
    if (blockTilesEl) renderBlockTiles(blockTilesEl, chapters);
  }

  initPathTabs();
  initKeyboardShortcuts();
  initSearch();
}

function renderBlockTiles(container, chapters) {
  const blocks = new Map();
  for (const chapter of chapters) {
    if (!blocks.has(chapter.block)) {
      blocks.set(chapter.block, {
        id: chapter.block,
        title: chapter.block_title,
        chapters: [],
      });
    }
    blocks.get(chapter.block).chapters.push(chapter);
  }

  const html = Array.from(blocks.values())
    .sort((a, b) => a.id.localeCompare(b.id))
    .map((block) => {
      const stubCount = block.chapters.filter((c) => c.status === "stub").length;
      const draftCount = block.chapters.filter((c) => c.status === "draft" || c.status === "review").length;
      const publishedCount = block.chapters.filter((c) => c.status === "published").length;
      const total = block.chapters.length;
      return `
        <a class="block-tile" href="/Teaching/chapters/${block.id}/">
          <p class="block-tile-id">${block.id.split("_")[0]}</p>
          <h3 class="block-tile-title">${block.title}</h3>
          <p class="block-tile-meta">${total} chapters · ${publishedCount} published, ${draftCount} in progress, ${stubCount} stub</p>
        </a>
      `;
    })
    .join("");

  container.innerHTML = html;
}

if (document.readyState === "loading") {
  document.addEventListener("DOMContentLoaded", init);
} else {
  init();
}
