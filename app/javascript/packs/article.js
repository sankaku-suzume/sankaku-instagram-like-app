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

document.addEventListener( 'turbo:load', () => {
  const dataset = $('#article-index').data()
  const articleIds = dataset.articleIds
  articleIds.forEach((articleId) => {
    axios.get(`/articles/${articleId}/like`)
      .then((response) => {
        const hasLiked = response.data.hasLiked
        handleHeartDisplay(hasLiked, articleId)
      })
      listenInactiveHeartEvent(articleId)
      listenActiveHeartEvent(articleId)
  })
})

const handleHeartDisplay = (hasLiked, articleID) => {
  if (hasLiked) {
    $('#heart-active_' + articleID).removeClass('hidden')
  } else {
    $('#heart-inactive_' + articleID).removeClass('hidden')
  }
}

const listenInactiveHeartEvent = (articleID) => {
  $('#heart-inactive_' + articleID).on('click', () => {
    axios.post(`/articles/${articleID}/like`)
      .then((response) => {
        if (response.data.status === 'ok') {
          $('#heart-active_' + articleID).removeClass('hidden')
          $('#heart-inactive_' + articleID).addClass('hidden')
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
  })
}

const listenActiveHeartEvent = (articleID) => {
  $('#heart-active_' + articleID).on('click', () => {
    axios.delete(`/articles/${articleID}/like`)
      .then((response) => {
        if (response.data.status === 'ok') {
          $('#heart-active_' + articleID).addClass('hidden')
          $('#heart-inactive_' + articleID).removeClass('hidden')
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
  })
}