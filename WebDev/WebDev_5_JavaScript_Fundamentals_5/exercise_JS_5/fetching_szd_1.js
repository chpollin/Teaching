// author: Christopher Pollin 
// 2022
// 1

// fetching a SPARQL JSON result and throw it in a div
/*
  * fetch():            https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch
  * var, let, const:    https://www.freecodecamp.org/news/var-let-and-const-whats-the-difference/
  * then():             https://developer.mozilla.org/de/docs/Web/JavaScript/Reference/Global_Objects/Promise/then 
  * Arrow Function =>:  https://developer.mozilla.org/de/docs/Web/JavaScript/Reference/Global_Objects/Promise/then
*/
fetch("https://gams.uni-graz.at/archive/objects/query:szd.fulltext/methods/sdef:Query/getJSON?params=%241|Angst%3B%242|de", {method: 'get'})
	.then((response) => response.text())
	.then(function(data)
	{
		console.log(data);
    	const container = document.getElementById('container');
    	container.textContent = data;
	})
	.catch(function(error) 
	{
		console.log('Request failed', error)  
	});  

