// // Add event listener for DOM entries from cocoon nested form
// // and append them onto the correct header.

// // Create new form
// function createNewCargoItemForm() {
//   $(".new-fixture__add-cargos").on("cocoon:after-insert", function(
//     e,
//     insertedItem
//   ) {
//     // Get new cargo elements added to DOM
//     const newCargoLoadingEntry = insertedItem[0];
//     const newCargoDischargeEntry = insertedItem[2];

//     // Ammend new elemets to their correct headers
//     const loadingHeader = document.querySelector(".fixture-view__loading");
//     loadingHeader.appendChild(newCargoLoadingEntry);

//     const dischargeHeader = document.querySelector(".fixture-view__discharge");
//     dischargeHeader.appendChild(newCargoDischargeEntry);
//   });
// }

// // Edit form

// function editCargoItemForm() {
//   // Get all cargo entries
//   const cargoEntries = document.querySelector(".new-fixture__add-cargos").children;

//   // Loop through cargo entires and ammend entries to their correct headers
//   // based on the ID of the entry row.
//   for (let element of cargoEntries) {
//     const loadingHeader = document.querySelector(".fixture-view__loading");
//     const dischargeHeader = document.querySelector(".fixture-view__discharge");

//     if (element.id == "loading") {
//       loadingHeader.appendChild(element);
//     }
//     if (element.id == "discharging") {
//       dischargeHeader.appendChild(element);
//     }
//   }
// }

// export { createNewCargoItemForm, editCargoItemForm };

// // modal flip

// function flip_dialog(message, html) {

//  // fix backstyle
//  $('.flip-container .back').height($('.flip-container .front').height());

//  // scroll to top
//  $(window).scrollTop(0)

//  if(html)
//     $('.flip-container .back p').html(message);
//   else
//     $('.flip-container .back p').text(message);


//  // then flip that side
//  $('.flip-container').addClass('hover');
//  $('.flip-container .back button').click(function(){
//      $('.flip-container').removeClass('hover');
//   });

// }

// export { flip_dialog };
