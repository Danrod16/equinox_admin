import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "output" ]


  searchCompany(event) {
    console.log(event.currentTarget.value)
    const url = `${this.element.action}?name=${event.currentTarget.value}`
    console.log(url)
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })
  }
}
