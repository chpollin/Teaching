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
        row.appendChild(cell);
      });
      table.appendChild(row);
    });
  
    return table;
  }
  
  document.querySelector("#fruits").appendChild(buildTable(FRUITS));
  