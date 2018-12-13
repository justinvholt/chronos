//=require bootstrap
import $ from "jquery";
window.jQuery = $;
window.$ = $;

import {
  createNewCargoItemForm,
  editCargoItemForm
} from "../views/fixture_cargo_add";

import {
  fixtureInit,
  addEventListeners,
  checkEditStatus
} from "../views/fixture_clause_edit";

// createNewCargoItemForm();
// editCargoItemForm();

// import modal_wide from "modal_wide";

// home page sign-in/forgot password flip modal flip (STILL TINKERING)

let homeModalTransitionTime = 500;

let $homeModal = $(".home-modal");
let switching = false;

$("#flip").click(flipCard);

function flipCard() {
  if (switching) {
    return false;
  }
  switching = true;

  $homeModal.toggleClass("is-switched");
  window.setTimeout(function() {
    $homeModal
      .children()
      .children()
      .toggleClass("is-active");
    switching = false;
  }, homeModalTransitionTime / 2);
}

// edit/update toggle

$(function() {
  $(".toggle").on("click", function() {
    const form = $(".toggle").closest("form");
    if ($(this).hasClass("on")) {
      $(".toggle").removeClass("on");
      $(".edit-input").prop("readonly", true);
      form.addClass("super-edit-power");
      console.log($(".edit-input"));
      form.trigger("submit.rails");
    } else {
      $(".toggle").addClass("on");
      console.log($(".edit-input"));
      form.removeClass("super-edit-power");
      $(".edit-input").prop("readonly", false);
    }
  });
});

// cargo edit/show

$(".toggle").on("click", function() {
  $(".big-edit").toggle();
});

// make all toggles on page work simultaneously

// $(".toggle").click(function(){
//   $(this).addClass('on');
// });

// Dropdown menu selection

$(function() {
  $(".dropdown-menu a").click(function() {
    $("#selected").text($(this).text());
  });
});

// modal-wide

$(".modal-wide").on("show.bs.modal", function() {
  var height = $(window).height() - 200;
  $(this)
    .find(".modal-content")
    .css("max-height", height);
});

// choose/upload file button

$(document).ready(function() {
  $(":file").on("fileselect", function(event, numFiles, label) {
    console.log(numFiles);
    console.log(label);
  });
});

// disable field counters

$(document).ready(function() {
  // Disable scroll when focused on a number input.
  $("form").on("focus", "input[type=number]", function(e) {
    $(this).on("wheel", function(e) {
      e.preventDefault();
    });
  });

  // Restore scroll on number inputs.

  $("form").on("blur", "input[type=number]", function(e) {
    $(this).off("wheel");
  });

  // Disable up and down keys.

  $("form").on("keydown", "input[type=number]", function(e) {
    if (e.which == 38 || e.which == 40) e.preventDefault();
  });
});

// make fixtures index rows into links for individual fixtures

$("tr[data-link]").click(function() {
  window.location = $(this).data("link");
});

// render clauses immediately

$("#fastload").click(function() {
  $.ajax({
    url: "<%= @fixture.id %>",
    success: function(result) {
      $(".clauses-container").html(result);
    }
  });
});

// timed alert window

window.setTimeout(function() {
  $(".alert")
    .fadeTo(500, 0)
    .slideUp(500, function() {
      $(this).remove();
    });
}, 2000);

window.setTimeout(function() {
  $(".notice")
    .fadeTo(500, 0)
    .slideUp(500, function() {
      $(this).remove();
    });
}, 2000);

//

$("#modalManualBtn").click(function() {
  $(".modal-hidden").fadeIn(1200, function() {});
});

// CLAUSE EDIT SELECTION AND BUTTONS
///////////////////////////////////////////////////////////////

// Add event listner to toggle buttons
const toggleButtons = document.querySelectorAll("#edit-button");

for (var i = 0; i < toggleButtons.length; i++) {
  toggleButtons[i].addEventListener("click", checkEditStatus, false);
}

// Remove disabled status if form is in edit mode
function checkEditStatus() {
  if (document.querySelector("#edit-button").classList.contains("on")) {
    console.log("turned on");
    document.querySelector("#fixture_clause_group_id").disabled = false;
    console.log(document.querySelector("#fixture_clause_group_id"));

    const clauseEditButtons = document.querySelectorAll("#btnGroupDrop1");
    for (var i = 0; i < clauseEditButtons.length; i++) {
      clauseEditButtons[i].hidden = false;
    }
  }
}

// On fixture view load, disable clause dropdown and hide clause edit buttons
let fixtureInit = () => {
  document
    .querySelector("#fixture_clause_group_id")
    .setAttribute("disabled", "disabled");

  const clauseEditButtons = document.querySelectorAll("#btnGroupDrop1");
  for (var i = 0; i < clauseEditButtons.length; i++) {
    clauseEditButtons[i].setAttribute("hidden", "true");
  }
};

fixtureInit();
addEventListeners();
checkEditStatus();
