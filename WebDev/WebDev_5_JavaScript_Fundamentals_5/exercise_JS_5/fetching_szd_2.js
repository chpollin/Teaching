// author: Christopher Pollin 
// 2022
// 2

/*
  * encodeURIComponent()        https://developer.mozilla.org/de/docs/Web/JavaScript/Reference/Global_Objects/encodeURIComponent
  * response.json()             https://developer.mozilla.org/en-US/docs/Web/API/Response/json
  * for ... in                  https://developer.mozilla.org/de/docs/Web/JavaScript/Reference/Statements/for...in 
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
        //const container = document.querySelector('#container');
        const container = document.getElementById('container');
        console.log(data)
        for (element in data)
        {
          const p = document.createElement("p");
          // re is a variable in the sparql
          p.textContent = data[element].re + " - " + data[element].t;
          container.appendChild(p)
        }
	})
	.catch(function(error) 
	{
		console.log('Request failed', error)  
	});  
