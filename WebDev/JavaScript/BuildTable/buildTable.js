// Functions
// https://eloquentjavascript.net/03_functions.html
// Christopher Pollin, Web-Entwicklung, 2020


////////////////////
////////////////////
// Build Table


  const MOUNTAINS = [
    {name: "Kilimanjaro", height: 5895, place: "Tanzania", continent: "Africa"},
    {name: "Everest", height: 8848, place: "Nepal"},
    {name: "Mount Fuji", height: 3776, place: "Japan"},
    {name: "Vaalserberg", height: 323, place: "Netherlands"},
    {name: "Denali", height: 6168, place: "United States"},
    {name: "Popocatepetl", height: 5465, place: "Mexico"},
    {name: "Mont Blanc", height: 4808, place: "Italy/France"}
  ];
  
  function buildTable(data) {
    let table = document.createElement("table");
  
    let fields = Object.keys(data[0]);


    let headRow = document.createElement("tr");
    
    
    fields.forEach(function(field) {
      let headCell = document.createElement("th");
      headCell.textContent = field;
      headRow.appendChild(headCell);
    });
    table.appendChild(headRow);

    data.forEach(function(object) {
      let row = document.createElement("tr");
      fields.forEach(function(field) {
        let cell = document.createElement("td");
        cell.textContent = object[field];
        if (typeof object[field] == "number") {
          cell.style.textAlign = "right";
        }
        row.appendChild(cell);
      });
      table.appendChild(row);
    });
  return table;
  }
  document.querySelector("#mountains").appendChild(buildTable(MOUNTAINS));






