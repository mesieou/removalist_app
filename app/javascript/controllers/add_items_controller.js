import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-items"
export default class extends Controller {
  static targets = [ 'item']
  connect() {
    console.log("Hello, Stimulus!")
  }
  // Connects to data-action="click->add-items#add"
  add(event) {
    console.log(event.currentTarget)
  }
}
