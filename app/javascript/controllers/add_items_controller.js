import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-items"
export default class extends Controller {
  static targets = [ "items", "modal" ]
  static values = { time: Number }

  // Connects to data-action="click->add-items#add"
  select(event) {
    event.currentTarget.classList.toggle('minimalist-button-active')
    console.log(event.currentTarget)
  }
  // Connects to data-action="click->add-items#add"
  add() {
    const itemsSelected = this.itemsTarget.querySelectorAll('.minimalist-button-active')
    const itemsSelectedArray = Array.from(itemsSelected)
    const modal = this.modalTarget
    itemsSelectedArray.forEach((item) => {
      const itemText = item.textContent
      const itemTime = Number(item.dataset.addItemsValue)
      const itemHTML = `<div class="cart-item">${itemText}</div>`
      modal.insertAdjacentHTML('beforeend', itemHTML)
      item.classList.remove('minimalist-button-active')
    })

  }
}
