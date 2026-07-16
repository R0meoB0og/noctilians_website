// ============================================================
// Noctilians — main.js
// Three independent, small features. Each works on its own,
// so removing one doesn't break the others.
// ============================================================

const prefersReducedMotion = window.matchMedia("(prefers-reduced-motion: reduce)").matches;

/* -------------------------------------------------------------
   1. Scroll-driven effects (one shared listener)
   a) Moon progress indicator — --scroll-progress (0→1) across
      the whole page, used to slide the moon's shadow across.
   b) Fixed hero PNG — --hero-decor-progress (0→1), scoped to
      exactly the distance between the top of the page and the
      top of #videos. Past that point the element is hard-hidden
      via .is-past-hero so it doesn't linger over later sections.
   Both live in one rAF-throttled handler rather than two
   separate scroll listeners.
------------------------------------------------------------- */
function initScrollEffects() {
  const heroEl = document.getElementById("hero");
  const videosEl = document.getElementById("videos");
  const decorEl = document.querySelector(".hero-decor-fixed");
  let ticking = false;

  function update() {
    const scrollTop = window.scrollY;

    // a) whole-page progress, for the moon indicator
    const pageMax = document.documentElement.scrollHeight - window.innerHeight;
    const pageProgress = pageMax > 0 ? scrollTop / pageMax : 0;
    document.documentElement.style.setProperty("--scroll-progress", pageProgress.toFixed(4));

    // b) hero-only progress, for the fixed decorative PNG
    if (heroEl && videosEl && decorEl) {
      const start = heroEl.offsetTop;
      const end = videosEl.offsetTop;
      const raw = (scrollTop - start) / (end - start);
      const heroProgress = Math.min(Math.max(raw, 0), 1);
      document.documentElement.style.setProperty("--hero-decor-progress", heroProgress.toFixed(4));
      decorEl.classList.toggle("is-past-hero", scrollTop >= end);
    }

    ticking = false;
  }

  window.addEventListener("scroll", () => {
    if (!ticking) {
      requestAnimationFrame(update);
      ticking = true;
    }
  }, { passive: true });

  window.addEventListener("resize", update);
  update();
}

/* -------------------------------------------------------------
   2. Video switcher
   Clicking a thumbnail button swaps the iframe's src instead
   of relying on a named-target hack.
------------------------------------------------------------- */
function initVideoSwitcher() {
  const frame = document.getElementById("video-frame");
  const buttons = document.querySelectorAll(".video-list__item");
  if (!frame || !buttons.length) return;

  buttons.forEach((btn) => {
    btn.addEventListener("click", () => {
      const id = btn.dataset.video;
      frame.src = `https://www.youtube.com/embed/${id}`;

      buttons.forEach((b) => {
        b.classList.remove("is-active");
        b.setAttribute("aria-selected", "false");
      });
      btn.classList.add("is-active");
      btn.setAttribute("aria-selected", "true");
    });
  });
}


/* -------------------------------------------------------------
   3. Carousel controls
   Each [data-carousel] gets working prev/next buttons that
   scroll by one item width. Native scroll-snap + touch
   scrolling on the track handles everything else.
------------------------------------------------------------- */
function initCarousels() {
  document.querySelectorAll("[data-carousel]").forEach((carousel) => {
    const track = carousel.querySelector("[data-carousel-track]");
    const prevBtn = carousel.querySelector("[data-carousel-prev]");
    const nextBtn = carousel.querySelector("[data-carousel-next]");
    if (!track) return;
 
    function step() {
      const item = track.querySelector(".carousel-item");
      if (!item) return track.clientWidth * 0.8;
      const styles = getComputedStyle(track);
      const gap = parseFloat(styles.columnGap || styles.gap || "0");
      return item.getBoundingClientRect().width + gap;
    }
 
    prevBtn?.addEventListener("click", () => {
      track.scrollBy({ left: -step(), behavior: "smooth" });
    });
    nextBtn?.addEventListener("click", () => {
      track.scrollBy({ left: step(), behavior: "smooth" });
    });
  });
}
 
/* -------------------------------------------------------------
   4. Scroll reveal for decorative PNGs
   Elements with class="reveal" fade/slide in when they enter the
   viewport, and reverse — fade/slide back to their start position
   — when they leave, so the cycle replays every time you scroll
   past. Respects prefers-reduced-motion.
------------------------------------------------------------- */
function initRevealOnScroll() {
  const items = document.querySelectorAll(".reveal");
  if (!items.length) return;
 
  if (prefersReducedMotion) {
    items.forEach((el) => el.classList.add("is-visible"));
    return;
  }
 
  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        entry.target.classList.toggle("is-visible", entry.isIntersecting);
      });
    },
    { threshold: 0.2 }
  );
 
  items.forEach((el) => observer.observe(el));
}
 
/* -------------------------------------------------------------
   5. Carousel drag-to-scroll
   Lets a mouse (not just touch) grab and drag the track — the
   thing a narrow, non-touch browser window actually needs.
------------------------------------------------------------- */
function initCarouselDrag() {
  document.querySelectorAll(".carousel-track").forEach((track) => {
    let isDown = false;
    let startX = 0;
    let startScroll = 0;
    let moved = 0; // how far the pointer actually travelled this gesture
 
    track.addEventListener("pointerdown", (e) => {
      isDown = true;
      moved = 0;
      startX = e.clientX;
      startScroll = track.scrollLeft;
      track.classList.add("is-dragging");
      // deliberately NOT calling setPointerCapture here — capturing the
      // pointer retargets the click that follows to the track itself,
      // which is what was swallowing clicks on links/buttons inside
      // carousel items.
    });
 
    track.addEventListener("pointermove", (e) => {
      if (!isDown) return;
      const dx = e.clientX - startX;
      moved = Math.max(moved, Math.abs(dx));
      track.scrollLeft = startScroll - dx;
    });
 
    function stopDrag() {
      isDown = false;
      track.classList.remove("is-dragging");
    }
    track.addEventListener("pointerup", stopDrag);
    track.addEventListener("pointercancel", stopDrag);
    track.addEventListener("pointerleave", stopDrag);
 
    // If the pointer travelled more than a few px, this was a drag, not a
    // click — swallow the click so swiping past a link doesn't accidentally
    // navigate. A genuine tap/click (moved ~0px) passes through untouched.
    track.addEventListener("click", (e) => {
      if (moved > 6) {
        e.preventDefault();
        e.stopPropagation();
      }
    }, true);
  });
}
 
initScrollEffects();
initVideoSwitcher();
initCarousels();
initCarouselDrag();
initRevealOnScroll();

