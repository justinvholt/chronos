// CLAUSE EDIT SELECTION AND BUTTONS
///////////////////////////////////////////////////////////////

// Add event listner to toggle buttons
let addEventListeners = () => {
  const toggleButtons = document.querySelectorAll("#edit-button");

  for (var i = 0; i < toggleButtons.length; i++) {
    toggleButtons[i].addEventListener("click", checkEditStatus, false);
  }
};

// Remove disabled status if form is in edit mode
let checkEditStatus = () => {
  if (document.querySelector("#edit-button").classList.contains("on")) {
    console.log("turned on");
    document.querySelector("#fixture_clause_group_id").disabled = false;
    console.log(document.querySelector("#fixture_clause_group_id"));

    const clauseEditButtons = document.querySelectorAll("#btnGroupDrop1");
    for (var i = 0; i < clauseEditButtons.length; i++) {
      clauseEditButtons[i].hidden = false;
    }
  }
};

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

export { fixtureInit, addEventListeners, checkEditStatus };

///////////////////////////////////////////////////////////////
