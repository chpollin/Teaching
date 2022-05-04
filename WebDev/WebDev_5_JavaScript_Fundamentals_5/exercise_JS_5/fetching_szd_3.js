// author: Christopher Pollin 
// 2022
// 3

/*
  * grouping with  reduce   https://www.tutorialspoint.com/most-efficient-method-to-groupby-on-an-array-of-objects-in-javascript
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
        
        const groupedData = groupBy(data, 're');
        console.log(groupedData)

        for (element in groupedData)
        {
            const p = document.createElement("p");
            p.textContent = groupedData[element][1].re + " - " + groupedData[element][1].t;
            container.appendChild(p)
        }
	})
	.catch(function(error) 
	{
		console.log('Request failed', error)  
	});  



//////////////////////////////////////
// FUNCTIONS
//////////////////////////////////////
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