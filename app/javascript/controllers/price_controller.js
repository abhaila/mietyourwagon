import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'datapoint', 'startDate', 'endDate' ];

  calculate(event){

    // I need to get start_date and end_date in the form
    if(this.startDateTarget.value && this.endDateTarget.value ) {
      let start = new Date(this.startDateTarget.value);
      let end = new Date(this.endDateTarget.value);
      let total = end - start

      fetch(`/cars/${event.target.dataset.id}`, { headers: { accept: "application/json" } })
        .then(response => response.json())
        .then((data) => {
          let price = data.car.price
          let estimated = (Math.round(total/60000000)) * price
          this.datapointTarget.innerText = estimated;
        });
    };
  }
}
