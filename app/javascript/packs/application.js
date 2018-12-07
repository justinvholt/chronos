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

// $('.toggle.on').click(function() {

// });
