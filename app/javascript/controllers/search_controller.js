import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "output" ]

  searchCompany(event) {
    const url = `${this.element.action}?name=${event.currentTarget.value}`
    fetch(url)
    .then(response => response.json())
    .then((data) => {
      console.log(data)
      if (data !== null) {
        this.outputTarget.innerText = "Company found ✅"
        // this.outputTarget.classList.add = "text-success"
      } else {
        this.outputTarget.innerText = "Company does not found"
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
