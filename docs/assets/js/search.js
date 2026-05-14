// search.js — search overlay backed by a pre-built Lunr index.

let lunrReady = null;
let searchIndex = null;
let searchData = null;

async function loadLunr() {
  if (!lunrReady) {
    lunrReady = import("https://cdn.jsdelivr.net/npm/lunr@2.3.9/lunr.min.js")
      .then((mod) => mod.default || window.lunr)
      .catch(() => window.lunr);
  }
  return lunrReady;
}

async function loadIndex() {
  if (searchIndex) return;
  const response = await fetch("/Teaching/data/search.json");
  if (!response.ok) return;
  const payload = await response.json();
  const lunr = await loadLunr();
  if (!lunr) return;
  searchIndex = lunr.Index.load(payload.index);
  searchData = payload.records;
}

function ensureOverlay() {
  let overlay = document.querySelector(".search-overlay");
  if (overlay) return overlay;

  overlay = document.createElement("div");
  overlay.className = "search-overlay";
  overlay.innerHTML = `
    <div class="search-modal" role="dialog" aria-label="Search">
      <input type="search" class="search-input" placeholder="Search chapters" autocomplete="off">
      <div class="search-results" role="list"></div>
    </div>
  `;
  document.body.appendChild(overlay);

  const input = overlay.querySelector(".search-input");
  const results = overlay.querySelector(".search-results");

  input.addEventListener("input", () => runSearch(input.value, results));

  overlay.addEventListener("click", (event) => {
    if (event.target === overlay) closeOverlay();
  });

  document.addEventListener("keydown", (event) => {
    if (event.key === "Escape" && overlay.hasAttribute("open")) closeOverlay();
  });

  return overlay;
}

function runSearch(query, container) {
  if (!query || !searchIndex) {
    container.innerHTML = "";
    return;
  }
  let hits;
  try {
    hits = searchIndex.search(query);
  } catch {
    return;
  }
  container.innerHTML = hits
    .slice(0, 20)
    .map((hit) => {
      const record = searchData[hit.ref];
      if (!record) return "";
      return `
        <div class="search-result" role="listitem">
          <a href="${record.url}">
            <strong>${record.chapter_id} ${record.title}</strong>
            <div>${record.block_title}</div>
          </a>
        </div>
      `;
    })
    .join("");
}

async function openOverlay() {
  await loadIndex();
  const overlay = ensureOverlay();
  overlay.setAttribute("open", "");
  const input = overlay.querySelector(".search-input");
  if (input) input.focus();
}

function closeOverlay() {
  const overlay = document.querySelector(".search-overlay");
  if (overlay) overlay.removeAttribute("open");
}

export function initSearch() {
  const triggers = document.querySelectorAll(".search-trigger");
  triggers.forEach((trigger) => trigger.addEventListener("click", openOverlay));
  document.addEventListener("dhskriptum:search-open", openOverlay);
}
