// import "@hotwired/turbo-rails"
// import "../controllers"

// import 'core-js/stable'
// import 'regenerator-runtime/runtime'


import $ from 'jquery'
import axios from "axios"
window.axios = axios

import Rails from "@rails/ujs"
axios.defaults.headers.common['X-CSRF-Token'] = Rails.csrfToken()


$('.profilePage_user_image.btn').on('click', () => {
  $('#profile_avatar').trigger('click')
  $('#avatar').trigger('click')
})

$('#profile_avatar').on('change', () => {
  $('#submit-avatar-btn').trigger('click')
})

$('#avatar').on('change', () => {
  $('#submit-avatar-btn').trigger('click')
})

