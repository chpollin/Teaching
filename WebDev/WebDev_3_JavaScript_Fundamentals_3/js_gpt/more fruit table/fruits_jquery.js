const FRUITS = [
  { name: "Apple", color: "Red", origin: "Central Asia" },
  { name: "Banana", color: "Yellow", origin: "Southeast Asia" },
  { name: "Cherry", color: "Red", origin: "Europe/Asia" },
  { name: "Grape", color: "Purple", origin: "Near East" },
  { name: "Lemon", color: "Yellow", origin: "South Asia" },
  { name: "Mango", color: "Orange", origin: "South Asia" },
  { name: "Pineapple", color: "Brown", origin: "South America" }
];

function buildTable(data) {
  let table = $("<table></table>");
  let fields = Object.keys(data[0]);
  let headRow = $("<tr></tr>");
  
  fields.forEach(function(field) {
    let headCell = $("<th></th>").text(field);
    headRow.append(headCell);
  });
  
  table.append(headRow);

  data.forEach(function(object) {
    let row = $("<tr></tr>");
    fields.forEach(function(field) {
      let cell = $("<td></td>").text(object[field]);
      row.append(cell);
    });
    row.on("click", function() {
      alert("You clicked on " + object.name + "!");
    });
    table.append(row);
  });

  return table;
}

$("#fruits").append(buildTable(FRUITS));
