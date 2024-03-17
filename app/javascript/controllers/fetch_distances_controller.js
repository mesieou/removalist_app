import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="fetch-distances"
export default class extends Controller {
  static values = { matrix: Array }
  connect() {
    this.matrixValue.forEach( day => {
      console.log(day)
      const days = Object.values(day)[0]
      days.forEach( pair => {
        if (typeof pair === 'object' && !Array.isArray(pair)) {
          console.log(pair)
        } else {
          pair.forEach( request => {
            console.log(request)
          });
        }
      });
    });
  }
}
