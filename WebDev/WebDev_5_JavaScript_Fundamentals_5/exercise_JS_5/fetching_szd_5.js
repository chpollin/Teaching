// author: Christopher Pollin 
// 2022
// 5 - not yet a datatable 

/*
  * DataTable() and id
  * we need a fixed width for our datatable. therefore we need to determine the maximum width (number of variables) and use that to generate the cells. 
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
    table.className = "table";
    table.id = "data_table";
    
    ////////////////////////
    // build table header
    let thead = document.createElement("thead");
    let headRow = document.createElement("tr");

    for(let count = 0; count<= 14; count++)
    {
        let headCell = document.createElement("th");
        headCell.textContent = "header" + count;
        headRow.appendChild(headCell);
    }
    thead.appendChild(headRow);
    table.appendChild(thead);
    
    ////////////////////////
    // build table body
    const tbody = document.createElement("tbody");
    table.appendChild(tbody)
    
    for (grouped_result in data)
    {
        // the current array containing all grouped results
        const grouped_result_array = data[grouped_result];
        const row = document.createElement("tr");
        // ?re, ?s, ?f from a result
        let fields = Object.values(grouped_result_array[1]);

        // iteration over all variables of the grouped array
        fields.forEach(function(field) {
            const cell = document.createElement("td");
            cell.textContent = field;
            row.appendChild(cell);
        });
        tbody.appendChild(row);
    }

    // this must be defined somewhere after the id was added to <table> 
    $(document).ready(function() {
        $('#data_table').DataTable();
    } );

    return table;
}