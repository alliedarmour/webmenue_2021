require("@rails/ujs").start()
require("@rails/activestorage").start()
require("@hotwired/turbo-rails")
require("channels")

require.context('../images', true)

import "controllers"
import "bootstrap"
import "../stylesheets/application"

document.addEventListener("turbo:load", function() {
    console.log("turbo!")
})