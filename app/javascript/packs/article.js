import $ from 'jquery'
import axios from "axios"
window.axios = axios

import Rails from "@rails/ujs"
axios.defaults.headers.common['X-CSRF-Token'] = Rails.csrfToken()

$('#articlePost-post-btn').on('click', () => {
  if ($('#articlePost-post-btn').hasClass('active')) {
    $('#articlePost-submit-btn').trigger('click')
  }
})

$('#articlePost-input-images').on('change', () => {
  if ($('#articlePost-input-images').val() !== ""){
    $('#articlePost-post-btn').addClass('active')
  }else{
    $('#articlePost-post-btn').removeClass('active')
  }
})
