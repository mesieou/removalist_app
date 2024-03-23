import { Controller } from "@hotwired/stimulus"
import { Loader } from '@googlemaps/js-api-loader';


// Connects to data-controller="fetch-distances"
export default class extends Controller {
  static values = { matrix: Array,
                    api: String }

    async connect() {
      console.log(this.matrixValue);
      const daysResult = [];

      await this.processDays(daysResult);

      console.log(daysResult);
    }

    async processDays(daysResult) {
      await Promise.all(this.matrixValue.map(async (day, index) => {
        const days = Object.values(day)[0];
        const booking_options = [];

        await this.processPairs(days, booking_options);

        daysResult.push({ [`Day ${index}`]: booking_options });
      }));
    }

    async processPairs(days, booking_options) {
      await Promise.all(days.map(async (pair, index) => {
        if (typeof pair === 'object' && !Array.isArray(pair)) {
          const response = await this.fetchDistances(pair);
          booking_options.push(response);
        } else {
          const options = [];

          await Promise.all(pair.map(async (request) => {
            const response = await this.fetchDistances(request);
            options.push(response);
          }));
          booking_options.push(options);
        }
      }));
  }

  getLoader() {
    const loader = new Loader({
      apiKey: this.apiValue,
      version: "quarterly",
      libraries: ["places", "routes", "geocoding", "marker", "elevation"]
    });
    return loader
  }

  async fetchDistances(request) {
    const google = await this.getLoader().load();
    const service = new google.maps.DistanceMatrixService();

    return new Promise((resolve, reject) => {
      service.getDistanceMatrix(request, (response, status) => {
        if (status == 'OK') {
          resolve(response);
        } else {
          reject(status);
        }
      });
    });
  }
}
