// Edit form
// Get all cargo entries
const cargoEntries = document.querySelector(".new-fixture__add-cargos")
  .children;

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

export { editCargoItemForm };
