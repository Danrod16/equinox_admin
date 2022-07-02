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
        // this.outputTarget.classList.add = "text-success"
      } else {
        this.outputTarget.innerText = "Company does not found"
        this.submitTarget.disabled = true
        // this.outputTarget.classList.add = "text-danger"
      }
    })
  }

  // goToSubdomain(event) {
  //   event.preventDefault();
  //   const subdomain = this.searchCompany()
  //   const url = `${subdomain}.${this.element.action}`
  //   console.log(url)
  // }
}
