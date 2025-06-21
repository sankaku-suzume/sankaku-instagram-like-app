// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "../controllers"

import 'core-js/stable'
import 'regenerator-runtime/runtime'

import $ from 'jquery'
import axios from 'modules/axios'

// document.addEventListener('turbo:load', () => {
//   $('.profilePage_header_account').on('click', () => {
//     axios.get('/')
//       .then((response) => {
//         console.log(response)
//       })
//   })
// })

