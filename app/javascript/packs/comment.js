import $, { data, error } from 'jquery'
import axios from '../modules/axios'

const escapeHtml = (text) => {
  const div = document.createElement('div');
  div.textContent = text;
  return div.innerHTML;
}

const appendNewComment = (comment) => {
  let avatar_image = '/assets/default-avatar.png'
  if (comment.user.avatar_image !== 'default-avatar.png') {
    avatar_image = comment.user.avatar_image
  }
  $('.comment_main').append(
    ` <div class="comment_comment">
        <div class="comment_commentUserImage">
            <img src="${avatar_image}" alt="User Avatar">
        </div>
        <div class="comment_commentContentWrapper">
            <div class="comment_commentUserAccount">${escapeHtml(comment.user.account)}</div>
            <div class="comment_commentContent">${escapeHtml(comment.content)}</div>
        </div>
      </div>`
  )
}

document.addEventListener( 'turbo:load', () => {
  const dataset = $('#comment-index').data()
  const articleId = dataset.articleId
  
  $('#comment_submit').on('click', () => {
    const content = $('#comment_content').val()
    if (!content) {
      window.alert('Please enter your comment')
    } else {
      axios.post(`/articles/${articleId}/comments`, {
        comment: {content: content}
      })
        .then((res) => {
          console.log('Raw response:', res.data.comment.content)
          const comment = res.data.comment
          appendNewComment(comment)
          $('#comment_content').val('')
          $('#comment_submit').addClass('hidden')
        })
    }
  })

})


$('#comment_content').on('input', () => {
  const content = $('#comment_content').val()
  if (!content) {
    $('#comment_submit').addClass('hidden')
  } else {
    $('#comment_submit').removeClass('hidden')
  }
})