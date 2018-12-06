//=require bootstrap
import $ from 'jquery';

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
