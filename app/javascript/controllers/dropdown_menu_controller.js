import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown-menu"
export default class extends Controller {
  static targets = [ "dropdownMenu" ]

  toggle() {
    if (this.dropdownMenuTarget.classList.contains("show")) {
      this.close()
    } else {
      this.open()
    }
  }

  open() {
    this.dropdownMenuTarget.classList.add("show")
    this.dropdownMenuTarget.classList.remove("hide")
  }

  close() {
    this.dropdownMenuTarget.classList.remove("show")
    this.dropdownMenuTarget.classList.add("hide")
  }
}
