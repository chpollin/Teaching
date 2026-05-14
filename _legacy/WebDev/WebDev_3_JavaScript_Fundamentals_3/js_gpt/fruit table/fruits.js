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
    console.log(fields);
    const headRow = document.createElement("tr");
    
    fields.forEach(function(field) {
      const headCell = document.createElement("th");
      headCell.textContent = field;
      headRow.appendChild(headCell);
    });
    
    table.appendChild(headRow);
  
    data.forEach(function(hudriwu) {
      let row = document.createElement("tr");
      fields.forEach(function(field) {
        let cell = document.createElement("td");
        cell.textContent = hudriwu[field];
        row.appendChild(cell);
      });
      table.appendChild(row);
    });
  
    return table;
  }
  
  // JavaScript Function Chaining: https://medium.com/technofunnel/javascript-function-chaining-8b2fbef76f7f
  document.querySelector("#fruits").appendChild(buildTable(FRUITS));
  