import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['step', 'category', 'create', 'join', 'next']

  connect() {
    const invalidClass = document.getElementsByClassName('invalid-feedback')
    if (invalidClass.length > 0) {
      const nextStep = this.nextTarget.dataset.nextStep - 1;
      const actualStep = this.nextTarget.dataset.nextStep;

      this.stepTargets[nextStep].classList.add("d-none");
      this.stepTargets[actualStep].classList.remove("d-none");
      this.joinTarget.classList.add("d-none")
    }
  }

  goToNext(event) {
    const nextStep = event.target.dataset.nextStep - 1;
    const actualStep = event.target.dataset.nextStep;

    this.stepTargets[nextStep].classList.add("d-none");
    this.stepTargets[actualStep].classList.remove("d-none");

    if(this.categoryTarget.checked) {
      this.joinTarget.classList.add("d-none")
      this.createTarget.classList.remove("d-none")
    } else {
      this.createTarget.classList.add("d-none")
      this.joinTarget.classList.remove("d-none")
    }
  }

  goToPrevious(event) {
    const previousStep = event.target.dataset.previousStep - 1;
    const actualStep = event.target.dataset.previousStep;

    this.stepTargets[actualStep].classList.add("d-none");
    this.stepTargets[previousStep].classList.remove("d-none");
  }
}