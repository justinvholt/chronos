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

// import {
//   flip_dialog
// } from "../views/fixture_cargo_add";

$(function() {
  $('#flip1').click(function() {
      flip_dialog();
  });

  $('#flip2').click(function() {
      flip_dialog();
  });

});

// Update toggle-lock button

$( function() {
  $( "#dialog-confirm" ).dialog({
    resizable: false,
    height: "auto",
    width: 400,
    modal: true,
    buttons: {
      "Yes, please save": function() {
        $( this ).dialog( "close" );
      },
      "No, go back": function() {
        $( this ).dialog( "close" );
      }
    }
  });
  } );

$(function() {
    $('.toggle').on('click', function() {
      if ($(this).hasClass('on')) {
        $(this).removeClass('on');
        $(".edit-input").prop('readonly', true);

        // $('#show_fixture_modal').modal

        if (confirm("Is all your updated data correct?")) {
          text = "Yes, please save";
          $("form#update_fixture").trigger("submit.rails");
        } else {
          text = "No, go back";
          $(this).addClass('on');
          $(".edit-input").prop('readonly', false);
        }
      } else {
        $(this).addClass('on');
        $(".edit-input").prop('readonly', false);
      }
    });
  });

// $('.toggle.on').click(function() {

// });
