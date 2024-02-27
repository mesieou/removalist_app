import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-items"
export default class extends Controller {
  static targets = [ "items", "modal" ]
  static values = { time: Number, cart: Number }
  itemsSelected = []

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
    const cart = Number(this.cartValue)
    itemsSelectedArray.forEach((item) => {
      const itemText = item.textContent.trim()
      const itemTime = Number(item.dataset.addItemsTimeValue)
      const itemHTML = `<div class="cart-item">${itemText}</div>`
      modal.insertAdjacentHTML('beforeend', itemHTML)
      item.classList.remove('minimalist-button-active')
      this.itemsSelected.push({ name: itemText, estimated_total_loading_time: itemTime, kart_id: cart })
    });
  }

  save() {
    this.itemsSelected.forEach((item)=> {
      const formData = new FormData();
      formData.append('item[name]', item.name);
      formData.append('item[estimated_total_loading_time]', item.estimated_total_loading_time);
      formData.append('item[kart_id]', item.kart_id);

      fetch('items/', {
        method:  'POST',
        headers: { "Accept": "application/json" },
        body: formData
      })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })
    })
  }
}
