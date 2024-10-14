import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["menu"];

  connect() {
    // Close the dropdown when clicking outside
    document.addEventListener("click", this.closeDropdown.bind(this));
  }

  disconnect() {
    document.removeEventListener("click", this.closeDropdown.bind(this));
  }

  toggle(event) {
    event.stopPropagation();
    if (this.menuTarget.classList.contains("invisible")) {
      this.show();
    } else {
      this.hide();
    }
  }

  show() {
    this.menuTarget.classList.remove("invisible", "opacity-0", "scale-95");
    this.menuTarget.classList.add("opacity-100", "scale-100");
  }

  hide() {
    this.menuTarget.classList.remove("opacity-100", "scale-100");
    this.menuTarget.classList.add("opacity-0", "scale-95");
    // Wait for the transition to finish before adding the 'invisible' class
    setTimeout(() => {
      this.menuTarget.classList.add("invisible");
    }, 300);
  }

  closeDropdown(event) {
    if (
      !this.element.contains(event.target) &&
      !this.menuTarget.classList.contains("invisible")
    ) {
      this.hide();
    }
  }
}
