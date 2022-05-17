// author: Christopher Pollin 
// 2022
// 6

/*
  * DataTable() and id
  * we need a fixed width for our datatable. therefore we need to determine the maximum width (number of variables) and use that to generate the cells. 
*/
const BASE_URL = "https://gams.uni-graz.at";
const QUERY = "/archive/objects/query:szd.fulltext/methods/sdef:Query/getJSON?params=";
const PARAM_1 = encodeURIComponent("$1|Angst;");
const PARAM_2 = encodeURIComponent("$2|de");

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
    
   
    // create new array with all length of all objects of all arrays (=grouped result)
    let length_array = [];
    let variable_array = [];
    for(element in data)
    {
        length_array.push(Object.keys(data[element][1]).length);
        variable_array.push(Object.keys(data[element][1]));
    }
    //todo: get the one array with the max length
    const variable_names = variable_array[1];
    const max_table_width = Math.max(...length_array);
    console.log(variable_names);

    ////////////////////////
    // build table header
    let thead = document.createElement("thead");
    let headRow = document.createElement("tr");

    for(let count = 0; count<= max_table_width; count++)
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
        const grouped_result_array = data[grouped_result][1];
        const row = document.createElement("tr");

        for(let count = 0; count<= max_table_width; count++)
        {
            const cell = document.createElement("td");
            cell.textContent = Object.values(grouped_result_array)[count] ? Object.values(grouped_result_array)[count] : " ";
            row.appendChild(cell);
        }
        tbody.appendChild(row);
    }

    // this must be defined somewhere after the id was added to <table> 
    $(document).ready(function() {
        $('#data_table').DataTable();
    } );

    return table;
}