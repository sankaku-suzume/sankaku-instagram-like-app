import $ from 'jquery'
import axios from 'modules/axios'



const listenFollowEvent = (accountId) => {
  $('#profilePage-follow-btn.active').on('click', () => {
    axios.post(`/accounts/${accountId}/follows`)
      .then((response) => {
        if (response.data.status === 'ok') {
          $('.active#profilePage-follow-btn').removeClass('active')

          let currentFollowersCount = parseInt($('#profilePage_followersCount').text())
          let newFollowersCount = currentFollowersCount + 1
          $('#profilePage_followersCount').text(newFollowersCount)
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
  })
}

// const listenActiveHeartEvent = (articleID) => {
//   $('#heart-active_' + articleID).on('click', () => {
//     axios.delete(`/articles/${articleID}/like`)
//       .then((response) => {
//         if (response.data.status === 'ok') {
//           $('#heart-active_' + articleID).addClass('hidden')
//           $('#heart-inactive_' + articleID).removeClass('hidden')
//         }
//       })
//       .catch((e) => {
//         window.alert('Error')
//         console.log(e)
//       })
//   })
// }

export {
  listenFollowEvent
  // listenActiveHeartEvent
}