// author: Christopher Pollin 
// 2022
// 4 - fetching json and print it in a table via buildTable()

/*
  * buildTable()
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
       // add object to list for given key's value
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
    return table;
}