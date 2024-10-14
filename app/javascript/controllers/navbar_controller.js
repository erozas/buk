import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["menu", "openIcon", "closeIcon", "overlay"];

  connect() {
    this.toggleClass = "translate-x-0";
    this.visibleClass = "block";
    this.invisibleClass = "hidden";
  }

  toggleMenu() {
    this.menuTarget.classList.toggle(this.toggleClass);
    this.overlayTarget.classList.toggle(this.visibleClass);
    this.overlayTarget.classList.toggle(this.invisibleClass);
    this.openIconTarget.classList.toggle(this.visibleClass);
    this.openIconTarget.classList.toggle(this.invisibleClass);
    this.closeIconTarget.classList.toggle(this.visibleClass);
    this.closeIconTarget.classList.toggle(this.invisibleClass);
  }
}
