import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "salesChart", "salesData" ]

  connect() {
    this.#salesChart()
  }

  #salesChart() {
    const data = JSON.parse(this.salesDataTarget.innerText.replace("=>", ":"))
    const salesKey = Object.keys(data)
    const salesValue = Object.values(data)

    const salesLabel = salesKey;

    const salesData = {
      labels: salesLabel,
      datasets: [
        {
          label: "Sales",
          backgroundColor: ["#32A287"],
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
          y: {
            beginAtZero: true,
            ticks: {
              stepSize: 1,
            },
            grid: {
              drawBorder: false,
              color: "#0023660a",
            },
            title: {
              display: false,
              text: "Number of Sales",
            },
          },
          x: {
            grid: {
              drawBorder: false,
              color: "#0023660a",
            },
          },
        },
        plugins: {
          legend: {
            display: false,
          },
          title: {
            display: false,
            text: "Sales per date",
            color: "#002366",
            font: {
              family: "Montserrat",
              size: 16,
              lineHeight: 1.2,
            },
            padding: { top: 0, left: 0, right: 0, bottom: 25 },
          },
        },
      },
    };

    const dateChart = new Chart(this.salesChartTarget, salesConfig);
  }
}
