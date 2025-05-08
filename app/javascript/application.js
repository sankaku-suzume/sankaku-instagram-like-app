// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"


document.addEventListener("turbo:load", () => {
  window.alert('DOM LOADED')
})