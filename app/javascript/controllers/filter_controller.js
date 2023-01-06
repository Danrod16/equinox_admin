import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "form", "view", "header", "filters" ]

  connect() {
    console.log('hello from filter stimulus');
    this.formTarget.reset();
    console.log('reseting form');
    console.dir(this.formTarget);
  }

  showFilters() {
    console.log('inside stimuluss');
    this.headerTarget.classList.toggle('small-row')
    this.headerTarget.classList.toggle('remove-border')
    this.filtersTarget.classList.toggle('d-none')
  }

  filterRecords() {
    let url = `${this.formTarget.action}?`

    for (let i = 1; i < this.formTarget.length; i++) {
      const id = this.formTarget[i].id.split('_')[1]
      const value = this.formTarget[i].value
      url = url + `${id}=${value}&`
    }

    console.log(url);

    fetch(url, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        this.viewTarget.innerHTML = data
      })
  }
}
