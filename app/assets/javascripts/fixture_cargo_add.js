// Add event listener for DOM entries from cocoon nested form
// and append them onto the correct header.

// Create new form
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

// Edit form

// Get all cargo entries
cargoEntries = document.querySelector(".new-fixture__add-cargos").children;

// Loop through cargo entires and ammend entries to their correct headers
// based on the ID of the entry row.
for (let element of cargoEntries) {
  const loadingHeader = document.querySelector(".fixture-view__loading");
  const dischargeHeader = document.querySelector(".fixture-view__discharge");

  if (element.id == "loading") {
    loadingHeader.appendChild(element);
  }
  if (element.id == "discharging") {
    dischargeHeader.appendChild(element);
  }
}
