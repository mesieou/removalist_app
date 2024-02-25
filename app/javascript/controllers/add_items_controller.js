import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-items"
export default class extends Controller {
  static targets = [ "items" ]

  // Connects to data-action="click->add-items#add"
  select(event) {
    event.currentTarget.classList.toggle('minimalist-button-active')
    console.log(event.currentTarget)
  }
  // Connects to data-action="click->add-items#add"
  add() {
    const itemsSelected = this.itemsTarget.querySelectorAll('.minimalist-button-active')
    const itemsSelectedArray = Array.from(itemsSelected)
    itemsSelectedArray.forEach((item) => {
      debugger;
      console.log(item.textContent)
      // find the item in the database
      // create the cart if it doesn't exist
      // add the item to the cart
      // show the cart
    })
  }
}
