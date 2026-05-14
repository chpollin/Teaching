// nav.js — sidebar builder.

export function buildSidebar(container, chapters) {
  const currentPath = window.location.pathname;

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
      const chapterLinks = block.chapters
        .sort((a, b) => a.order - b.order)
        .map((chapter) => {
          const isActive = currentPath.includes(chapter.url) ? ' aria-current="page"' : "";
          return `<a class="sidebar-chapter" href="${chapter.url}"${isActive}>${chapter.chapter_id} ${chapter.title}</a>`;
        })
        .join("");
      return `
        <div class="sidebar-block">
          <p class="sidebar-block-title">${block.id.split("_")[0]} ${block.title}</p>
          ${chapterLinks}
        </div>
      `;
    })
    .join("");

  container.innerHTML = html;
}
