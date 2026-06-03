import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["icon", "hideable"]

  // connect() {
  //   console.log("Hello from toggle_controller.js")
  //   console.log(this.iconTargets)
  //   console.log(this.hideableTarget)
  // }

  call(event) {
    event.preventDefault()
    // console.log("toggle!")

    this.hideableTarget.classList.toggle("d-none")

    this.iconTargets.forEach(icon => {
      icon.classList.toggle("d-none")
    })
  }
}
