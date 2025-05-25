// // Import and register all your controllers from the importmap via controllers/**/*_controller
// import { application } from "./application"
// import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
// eagerLoadControllersFrom("controllers", application)

// Stimulus 3.x + Webpack での正しい書き方
import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers"

const application = Application.start()

// コントローラーを自動読み込み
const context = require.context(".", true, /_controller\.js$/)
application.load(definitionsFromContext(context))