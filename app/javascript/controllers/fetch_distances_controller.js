import { Controller } from "@hotwired/stimulus"
import { Loader } from '@googlemaps/js-api-loader';


// Connects to data-controller="fetch-distances"
export default class extends Controller {
  static values = { matrix: Array,
                    api: String }

  connect() {
    this.matrixValue.forEach( day => {
      console.log(day)
      const daysResult = []
      const days = Object.values(day)[0]

      days.forEach( (pair, index) => {
        const booking_options = []

        if (typeof pair === 'object' && !Array.isArray(pair)) {
          booking_options.push(this.fetchDistances(pair))
        } else {
          const options = []
          pair.forEach( request => {
            options.push(this.fetchDistances(request))
          });
          booking_options.push(options)
        }
        daysResult.push({ [`Day ${index}`]: booking_options })
      });
    });
    console.log(booking_options)
  }

  getLoader() {
    const loader = new Loader({
      apiKey: this.apiValue,
      version: "quarterly",
      libraries: ["places", "routes", "geocoding", "marker", "elevation"]
    });
    return loader
  }

  fetchDistances(request) {
    const loader = this.getLoader()
    loader
      .load()
      .then((google) => {
        var service = new google.maps.DistanceMatrixService();
        service.getDistanceMatrix(request, callback);
        raise
      })
      .catch((e) => {
        console.log("error loading gmaps")
      })

    function callback(response, status) {
      if (status == 'OK') {
        console.log(response)
      }
    }
  }

}
