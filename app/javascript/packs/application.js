// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "../controllers"

import $ from 'jquery'


document.addEventListener('DOMContentLoaded', () => {
  $('.profilePage_header_account').on('click', () => {
    window.alert('clicked')
  })
})