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
        if (event.currentTarget.value.length >= 3) {
          if (data !== null) {
            this.outputTarget.innerText = "Company found ✅"
            // this.outputTarget.classList.add = "text-success"
          } else {
            this.outputTarget.innerText = "Company does not found"
            // this.outputTarget.classList.add = "text-danger"
          }
        }
      })
  }
}
