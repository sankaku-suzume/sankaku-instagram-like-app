import $ from 'jquery'
import axios from 'modules/axios'
import {
  listenInactiveHeartEvent,
  listenActiveHeartEvent
} from 'modules/handle_heart'


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
  const dataset = $('#article-index, #article-show').data()
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
