// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"
import "bootstrap"

$(function () {
  $('a[data-toggle="tab"]').on('click', function (e) {
    window.localStorage.setItem('activeTab', $(e.target).attr('href'));
  });
  var activeTab = window.localStorage.getItem('activeTab');
  if (activeTab) {
    $('#myTab a[href="' + activeTab + '"]').tab('show');
    window.localStorage.removeItem("activeTab");
  }
});

window.addEventListener('load', (event) => {
  document.querySelector("body").classList.remove("preload");

  if (document.querySelector(".card-proposal-status.accept")) {
    document.querySelector(".card-proposal-status.accept").addEventListener("click", (event) => {
      console.log(event.currentTarget);
      event.stopPropagation();
    });
  }
});
