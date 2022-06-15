import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "salesChart" ]
  static values = {
    sales: Object
  }

  connect() {
    this.#salesChart()
  }

  #salesChart() {
    Chart.defaults.global.legend.display = false;
    const data = this.salesValue
    const ctx = this.salesChartTarget.getContext('2d');
    const gradient = ctx.createLinearGradient(0, 0, 0, 400);
    gradient.addColorStop(.7, 'rgba(50, 162, 135, 0)');
    gradient.addColorStop(0, 'rgba(50, 162, 135, .1)');

    // ["#32A287"]
    const salesData = {
      labels: Object.keys(data),
      datasets: [
        {
          backgroundColor: gradient,
          borderColor: "rgba(50, 162, 135, 1)",
          pointBackgroundColor: "rgba(0, 0, 0, 0)",
          pointBorderColor: "rgba(0, 0, 0, 0)",
          data: Object.values(data),
        },
      ],
    };

    const salesConfig = {
      type: "line",
      data: salesData,
      options: {
        scales: {
          yAxes: [{
            gridLines: {
              display: false,
              color: "rgba(0, 0, 0, 0)"
            },
            ticks: {
              display: false
            }
          }],
          xAxes: [{
            gridLines: {
              display: false,
              color: "rgba(0, 0, 0, 0)"
            },
            ticks: {
              display: false
            }
          }],
        }
      },
    };

    new Chart(this.salesChartTarget, salesConfig);
  }
}
