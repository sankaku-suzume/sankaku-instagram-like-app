// import "@hotwired/turbo-rails"
// import "../controllers"

// import 'core-js/stable'
// import 'regenerator-runtime/runtime'


import $ from 'jquery'
import axios from "axios"
window.axios = axios

import Rails from "@rails/ujs"
axios.defaults.headers.common['X-CSRF-Token'] = Rails.csrfToken()

import {
  listenFollowEvent,
  listenUnfollowEvent
} from 'modules/follow'


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

document.addEventListener( 'turbo:load', () => {
  const dataset = $('#profile-show').data()
  const accountId = dataset.userId
  const followerId = dataset.followerID

  axios.get(`/accounts/${accountId}/follows/${followerId}`)
    .then((response) => {
      const hasFollowed = response.data.hasFollowed
      handleFollowDisplay(hasFollowed)
    })

  listenFollowEvent(accountId)
  listenUnfollowEvent(accountId)
})

const handleFollowDisplay = (hasFollowed) => {
  if (hasFollowed) {
    $('#profilePage-unfollow-btn').removeClass('hidden')
  } else {
    $('#profilePage-follow-btn').removeClass('hidden')
  }
}

