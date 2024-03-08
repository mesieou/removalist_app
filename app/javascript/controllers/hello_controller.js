import { Controller } from "@hotwired/stimulus"
import { Loader } from '@googlemaps/js-api-loader';

export default class extends Controller {
  static targets = ["pick_up", "drop_off"]

  connect() {
    const loader = new Loader({
      apiKey: "AIzaSyBjnDVa3YG0-AM18N-ujtJ-jrMoxsuhJkI",
      version: "quarterly",
      libraries: ["places", "routes", "geocoding", "marker", "elevation"]
    });


    loader
      .load()
      .then((google) => {
        console.log(this.pick_upTarget)
        console.log(this.drop_offTarget);

        this.pickupAutocomplete = new google.maps.places.Autocomplete(this.pick_upTarget);
        this.dropoffAutocomplete = new google.maps.places.Autocomplete(this.drop_offTarget);
        console.log(this.autocomplete)
      })
      .catch((e) => {
        console.log("error loading gmaps")
      })
  }
}
