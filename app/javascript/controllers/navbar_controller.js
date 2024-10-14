import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["menu", "overlay", "openIcon", "closeIcon"];

  connect() {
    // Store the initial padding of the body
    this.initialBodyPadding = window.getComputedStyle(
      document.body
    ).paddingRight;
  }

  toggleMenu() {
    this.menuTarget.classList.toggle("translate-x-full");
    this.overlayTarget.classList.toggle("hidden");
    this.openIconTarget.classList.toggle("hidden");
    this.closeIconTarget.classList.toggle("hidden");

    const isOpen = !this.menuTarget.classList.contains("translate-x-full");

    if (isOpen) {
      this.disableBodyScroll();
    } else {
      this.enableBodyScroll();
    }
  }

  disableBodyScroll() {
    const scrollbarWidth =
      window.innerWidth - document.documentElement.clientWidth;
    document.body.style.overflow = "hidden";
    document.body.style.paddingRight = `${scrollbarWidth}px`;
    document.body.classList.add("menu-open");
  }

  enableBodyScroll() {
    document.body.style.overflow = "";
    document.body.style.paddingRight = this.initialBodyPadding;
    document.body.classList.remove("menu-open");
  }
}
