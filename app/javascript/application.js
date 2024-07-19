// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery
//= require rails-ujs
//= require_tree .
//= require turbolinks

import "@hotwired/turbo-rails";
import "controllers";
import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

Rails.start();
Turbolinks.start();
document.addEventListener('turbolinks:load', function() {
    Rails.start();
});
ActiveStorage.start();

