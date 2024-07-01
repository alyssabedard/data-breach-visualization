import { Application } from "@hotwired/stimulus"
// import "./find_organisation.js"
// import "find_organisation"
const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
