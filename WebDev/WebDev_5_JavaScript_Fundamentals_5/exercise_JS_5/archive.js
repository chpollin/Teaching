

/*

//////////////////////////////////////
function buildTable(data) {
  let table = document.createElement("table");

  let fields = Object.keys(data[0]);
  let headRow = document.createElement("tr");
  fields.forEach(function(field) {
  if(field != "wiki")
    {
        let headCell = document.createElement("th");
        headCell.textContent = field;
        headRow.appendChild(headCell);
    }
  });
  checkBox_headCell = document.createElement("th");
  checkBox_headCell.textContent= "Checkbox";
  headRow.appendChild(checkBox_headCell);

  table.appendChild(headRow);
  //für jedes object im JSON
  data.forEach(function(object) {
    let row = document.createElement("tr");
    
    //für jede Spalte
    fields.forEach(function(field) {
        //überspringe die wiki spalte
        if(field != "wiki")
        {
        let cell = document.createElement("td");

        //wenn du in der Spalte supherhero bist
        if (field == "superhero") {
            cell.style.textAlign = "center";
            cell.style.fontWeight = "bold";
            row.setAttribute("id", "superhero_" + object[field]);
            // wenn ein wiki key im JSON exisitiert erzeuge einen link
            if(object["wiki"]){
              let a = document.createElement('a');
              a.setAttribute("target", "_blank"); 
              a.textContent = object[field];
              a.setAttribute("href", object["wiki"]);
              cell.appendChild(a);
            }
            //sonst befülle nur die cell
            else{
            cell.textContent = object[field];
            }  
          }
          else
          {
            cell.textContent = object[field];
          }
          row.appendChild(cell);


          row.setAttribute("class", "hero_row");
        }


	
    });
	checkBox_Cell = document.createElement("td");
	checkBox_Cell_input = document.createElement("input");
	checkBox_Cell_input.type = "checkbox";
	checkBox_Cell_input.setAttribute("onclick", "addTolocalStorage(this.closest('tr'))");
	checkBox_Cell.appendChild(checkBox_Cell_input);
	row.appendChild(checkBox_Cell);
    table.appendChild(row);
    table.setAttribute("border", "1px solid black");
  });
  return table;
}

//////////////////////////////////////
function getTable() {
	//https://gist.githubusercontent.com/mariodev12/a923f2b651a005ca3ca7f851141efcbc/raw/39b06a32e4a58fc1fe63c7478a97edccd21138f1/superheroes.json
	//https://raw.githubusercontent.com/LearnWebCode/json-example/master/animals-1.json
  const URL = "https://raw.githubusercontent.com/LearnWebCode/json-example/master/animals-1.json";
  
	// call the fetch function passing the url of the API as a parameter
	fetch(URL, {method: 'get'})
	// transform the data into text
	.then((response) => response.text())
	.then(function(data)
	{
		document.getElementById("superheros").appendChild(buildTable(JSON.parse(data)));
	})
	.catch(function(error) 
	{
		console.log('Request failed', error)  
	});  
}

//////////////////////////////////////
function destroyTable() {
  var list = document.getElementById("superheros");
  if (superheros.hasChildNodes()) {
    superheros.removeChild(superheros.childNodes[0]);
  } else {
    console.log("Error: table is already destroyed");
  }
}

//////////////////////////////////////////////////////////
function addTolocalStorage(data){
	superhero_name = {"superhero" : data.children.item(0).textContent};
    // the "|| []" replaces possible null from localStorage with empty array
    let storage = JSON.parse(localStorage.getItem("localStorage_ID")) || [];
    storage.push(superhero_name);
    localStorage.setItem("localStorage_ID", JSON.stringify(storage));
}

*/