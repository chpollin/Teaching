// author: Christopher Pollin 
// 2022
// 4

/*
  * 
*/
const BASE_URL = "https://gams.uni-graz.at"
const QUERY = "/archive/objects/query:szd.fulltext/methods/sdef:Query/getJSON?params="
const PARAM_1 = encodeURIComponent("$1|Angst;")
const PARAM_2 = encodeURIComponent("$2|de")

fetch(BASE_URL + QUERY + PARAM_1 + PARAM_2, {method: 'get'})
	.then((response) => response.json())
	.then(function(data)
	{
        const container = document.getElementById('container');

        container.appendChild(buildTable( groupBy(data, 're') ));

	})
	.catch(function(error) 
	{
		console.log('Request failed', error)  
	});  



//////////////////////////////////////
// FUNCTIONS
//////////////////////////////////////

//////////////////////////////////////
//
//
function groupBy(objectArray, property) {
    return objectArray.reduce((acc, obj) => {
       const key = obj[property];
       if (!acc[key]) {
          acc[key] = [];
       }
       // Add object to list for given key's value
       acc[key].push(obj);
       return acc;
    }, {});
 }

//////////////////////////////////////
//
//
function buildTable(data) {
    const table = document.createElement("table");
    
    for (element in data)
    {
        // the current array containing all grouped results
        const array = data[element];
        const row = document.createElement("tr");
        // ?re, ?s, ?f from a result
        let fields = Object.values(array[1]);
        for (field in fields)
        {
            const cell = document.createElement("cell");
            cell.textContent = field;
            row.appendChild(cell);
        }
        
    
    
        
 
        table.appendChild(row);

    }

/*


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

*/

return table;
}