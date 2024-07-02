import { Application } from "@hotwired/stimulus"
// import "./find_org.js"
// import "find_org"
const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
