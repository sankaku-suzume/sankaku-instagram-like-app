import $ from 'jquery'
import axios from 'modules/axios'



const listenFollowEvent = (accountId) => {
  $('#profilePage-follow-btn').on('click', () => {
    axios.post(`/accounts/${accountId}/follows`)
      .then((response) => {
        if (response.data.status === 'ok') {
          $('#profilePage-follow-btn').addClass('hidden')
          $('#profilePage-unfollow-btn').removeClass('hidden')

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

const listenUnfollowEvent = (accountId) => {
  $('#profilePage-unfollow-btn').on('click', () => {
    axios.post(`/accounts/${accountId}/unfollows`)
      .then((response) => {
        if (response.data.status === 'ok') {
          $('#profilePage-unfollow-btn').addClass('hidden')
          $('#profilePage-follow-btn').removeClass('hidden')

          let currentFollowersCount = parseInt($('#profilePage_followersCount').text())
          let newFollowersCount = currentFollowersCount -1
          $('#profilePage_followersCount').text(newFollowersCount)
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
  })
}

export {
  listenFollowEvent,
  listenUnfollowEvent
}