import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-items"
export default class extends Controller {
  connect() {
    console.log("Hello, Stimulus!")
  }
  // Connects to data-action="click->add-items#add"
  add(event) {
    event.currentTarget.classList.toggle('minimalist-button-active')
    console.log(event.currentTarget)

  }
}
