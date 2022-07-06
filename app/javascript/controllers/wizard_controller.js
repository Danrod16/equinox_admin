import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['step', 'category', 'create', 'join', 'next', 'bullet']

  connect() {
    const invalidClass = document.getElementsByClassName('invalid-feedback')
    if (invalidClass.length > 0) {
      const nextStep = this.nextTarget.dataset.nextStep - 1;
      const actualStep = this.nextTarget.dataset.nextStep;
      const bullets = this.bulletTargets;

      this.stepTargets[nextStep].classList.add("d-none");
      this.stepTargets[actualStep].classList.remove("d-none");
      this.joinTarget.classList.add("d-none")
      bullets[actualStep - 1].classList.add('completed');
    }
  }

  goToNext(event) {
    const nextStep = event.target.dataset.nextStep - 1;
    const actualStep = event.target.dataset.nextStep;
    const bullets = this.bulletTargets;

    this.stepTargets[nextStep].classList.add("d-none");
    this.stepTargets[actualStep].classList.remove("d-none");

    if(this.categoryTarget.checked) {
      this.joinTarget.classList.add("d-none")
      this.createTarget.classList.remove("d-none")
    } else {
      this.createTarget.classList.add("d-none")
      this.joinTarget.classList.remove("d-none")
    }

    bullets[actualStep - 1].classList.add('completed');
  }

  goToPrevious(event) {
    const previousStep = event.target.dataset.previousStep - 1;
    const actualStep = event.target.dataset.previousStep;
    const bullets = this.bulletTargets;

    this.stepTargets[actualStep].classList.add("d-none");
    this.stepTargets[previousStep].classList.remove("d-none");

    bullets[previousStep].classList.remove('completed');
  }
}
