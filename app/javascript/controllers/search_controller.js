import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "output", "submit" ]

  searchCompany(event) {
    console.log(this.element.action)
    const url = `${this.element.action}?name=${event.currentTarget.value}`
    fetch(url)
    .then(response => response.json())
    .then((data) => {
      console.log(data)
      if (data !== null) {
        this.outputTarget.innerText = "Company found ✅"
        this.submitTarget.disabled = false
      } else {
        this.outputTarget.innerText = "Company does not found"
        this.submitTarget.disabled = true
      }
    })
  }
}
