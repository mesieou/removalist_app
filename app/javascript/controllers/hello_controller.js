import { Controller } from "@hotwired/stimulus"
import { Loader } from '@googlemaps/js-api-loader';


export default class extends Controller {
  static targets = ["pick_up", "drop_off"]
  static values = { api: String}

  connect() {
    const loader = new Loader({
      apiKey: this.apiValue,
      version: "quarterly",
      libraries: ["places", "routes", "geocoding", "marker", "elevation"]
    });


    loader
      .load()
      .then((google) => {
        // this.pickupAutocomplete = new google.maps.places.Autocomplete(this.pick_upTarget);
        // this.dropoffAutocomplete = new google.maps.places.Autocomplete(this.drop_offTarget);
      })
      .catch((e) => {
        console.log("error loading gmaps")
      })
  }

  distance () {
    const pickUp = this.pick_upTarget.value;
    const dropOff = this.drop_offTarget.value;
    var directionsService = new google.maps.DirectionsService();
    let request = {
      origin: pickUp,
      destination: dropOff,
      travelMode: 'DRIVING'
    }

    directionsService.route(request, function(result, status){
      if (status == 'OK') {
        console.log(result.routes[0].legs[0].distance.text)
        console.log(result.routes[0].legs[0].duration.text)
      }
    });
  }
}
