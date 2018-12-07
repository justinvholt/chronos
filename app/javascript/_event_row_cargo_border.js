let cells = document.getElemensByClassName("obl")

function markCargoCell(cell) {
  if (cell.innerHTML != "") { borderCells(cell); }
};

function aboveObl(cell) {
  let roof_obl = cell.parentNode.previousSibling.childNodes[1];
};

function belowObl(cell) {
  let below_obl = cell.parentNode.nextSibling.childNodes[1];
};

function borderCells(cell) {
  drawborder(cell.nextSibling);
  drawborder(cell);
  drawborder(cell.nextSibling.nextSibling);
  drawborder(cell.previousSibling);
};

function drawBorder(cell) {
  if (roof_obl.innerHTML != "") { cell.className += "td-top-border"; }
  if (below_obl.innerHTML != "") { cell.className += "td-bottom-border"; }
}

cells.forEach(markCargoCell)
