import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="turbo-modal"
export default class extends Controller {
  hideModal() {
    this.element.parentElement.removeAttribute("src") 
    this.element.remove()
  }

  submitEnd(e) {
    if (e.detail.success) {
      this.hideModal()
    }
  }

  closeWithKeyboard(e){
    if (e.code == "Escape") {
      this.hideModal()
    }
  }

  closeBackground(e){
    if (e && this.modalTarget.contains(e.target)) {
      return
    }
    this.hideModal()
  }
}
