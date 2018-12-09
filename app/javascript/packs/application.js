//=require bootstrap
import $ from 'jquery';
window.jQuery = $;
window.$ = $;

import {
  createNewCargoItemForm,
  editCargoItemForm,
  flip_dialog
} from "../views/fixture_cargo_add";

createNewCargoItemForm();
editCargoItemForm();

// import modal_wide from "modal_wide";

// modal_wide();

// import {
//   flip_dialog
// } from "../views/fixture_cargo_add";

// $(function() {
//   $('#flip1').click(function() {
//       flip_dialog();
//   });

//   $('#flip2').click(function() {
//       flip_dialog();
//   });

// });

// home page sign-in/forgot password flip modal flip (STILL TINKERING

let homeModalTransitionTime = 500;

let $homeModal = $('.home-modal')
let switching = false

$('#flip').click(flipCard)

function flipCard () {
   if (switching) {
      return false
   }
   switching = true

   $homeModal.toggleClass('is-switched')
   window.setTimeout(function () {
      $homeModal.children().children().toggleClass('is-active')
      switching = false
   }, homeModalTransitionTime / 2)
}

// edit/update toggle

$(function() {
    $('.toggle').on('click', function() {
      if ($(this).hasClass('on')) {
        $(this).removeClass('on');
        $(".edit-input").prop('readonly', true);
        $("form#update_fixture").trigger("submit.rails");
      } else {
        $(this).addClass('on');
        $(".edit-input").prop('readonly', false);
      }
    });
  });

// Dropdown menu selection

$(function(){
  $(".dropdown-menu a").click(function(){
  $("#selected").text($(this).text());
  });
});

// modal-wide

$(".modal-wide").on("show.bs.modal", function() {
  var height = $(window).height() - 200;
  $(this).find(".modal-content").css("max-height", height);
});

// choose/upload file button

$(document).ready( function() {
    $(':file').on('fileselect', function(event, numFiles, label) {
        console.log(numFiles);
        console.log(label);
    });
});

// disable field counters

$(document).ready( function() {
  // Disable scroll when focused on a number input.
  $('form').on('focus', 'input[type=number]', function(e) {
      $(this).on('wheel', function(e) {
          e.preventDefault();
      });
  });

  // Restore scroll on number inputs.
  $('form').on('blur', 'input[type=number]', function(e) {
      $(this).off('wheel');
  });

  // Disable up and down keys.
  $('form').on('keydown', 'input[type=number]', function(e) {
      if ( e.which == 38 || e.which == 40 )
          e.preventDefault();
  });
});
