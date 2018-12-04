// Add event listener for DOM entries from cocoon nested form
// and append them onto the correct header

$(".new-fixture__add-cargos").on("cocoon:after-insert", function(
  e,
  insertedItem
) {
  // Get new cargo elements added to DOM
  const newCargoLoadingEntry = insertedItem[0];
  const newCargoDischargeEntry = insertedItem[2];

  // Ammend new elemets to their correct headers
  const loadingHeader = document.querySelector(".fixture-view__loading");
  loadingHeader.appendChild(newCargoLoadingEntry);

  const dischargeHeader = document.querySelector(".fixture-view__discharge");
  dischargeHeader.appendChild(newCargoDischargeEntry);
});
