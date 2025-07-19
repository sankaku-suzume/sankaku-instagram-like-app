import $ from 'jquery'
import axios from 'modules/axios'



const listenInactiveHeartEvent = (articleID) => {
  $('#heart-inactive_' + articleID).on('click', () => {
    axios.post(`/api/articles/${articleID}/like`)
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
    axios.delete(`/api/articles/${articleID}/like`)
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

export {
  listenInactiveHeartEvent,
  listenActiveHeartEvent
}