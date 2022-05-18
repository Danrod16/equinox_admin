import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "salesChart", "salesData" ]

  connect() {
    this.#salesChart()
  }

  #salesChart() {
    Chart.defaults.global.legend.display = false;
    console.log(this.salesDataTarget.innerText.replace("=>", ":"))
    const data = JSON.parse(this.salesDataTarget.innerText.replaceAll("=>", ":"))
    const salesKey = Object.keys(data)
    const salesValue = Object.values(data)
    console.log(salesKey)
    console.log(salesValue)
    const salesLabel = salesKey;

    const salesData = {
      labels: salesLabel,
      datasets: [
        {
          backgroundColor: "rgba(0, 0, 0, 0)",
          borderColor: ["#32A287"],
          data: salesValue,
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
