import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "form", "view" ]

  connect() {
    console.log('inside stimuluss');
  }

  filterRecords() {
    console.log(this.viewTarget);
    const url = `${this.formTarget.action}?user=${this.formTarget[1].value}&flat=${this.formTarget[2].value}&tenant=${this.formTarget[3].value}&deposit=${this.formTarget[4].value}&status=${this.formTarget[5].value}`

    fetch(url, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        this.viewTarget.innerHTML = data
        console.log(data);
      })
  }
}
