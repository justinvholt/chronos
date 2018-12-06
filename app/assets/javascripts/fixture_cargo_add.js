$(".new-fixture__add-cargos").on("cocoon:after-insert", function(
  e,
  insertedItem
) {
  // Get new cargo elements added to DOM
  var newCargoLoadingEntry = insertedItem[0];
  var newCargoDischargeEntry = insertedItem[2];

  // Ammend new elemets to their correct headers
  var loadingHeader = document.querySelector(".fixture-view__loading");
  loadingHeader.appendChild(newCargoLoadingEntry);

  var dischargeHeader = document.querySelector(".fixture-view__discharge");
  dischargeHeader.appendChild(newCargoDischargeEntry);
});
