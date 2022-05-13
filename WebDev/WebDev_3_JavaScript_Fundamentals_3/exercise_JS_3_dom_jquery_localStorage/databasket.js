// JS Fundamentasl 3, Webdevelopment
// author: Christopher Pollin 
// 2022




/*
  * input onclick="getData(this)"   https://developer.mozilla.org/de/docs/Web/API/GlobalEventHandlers/onclick
  * this und console.log(input);    https://developer.mozilla.org/de/docs/Web/JavaScript/Reference/Operators/this
  * data- property                  https://developer.mozilla.org/en-US/docs/Learn/HTML/Howto/Use_data_attributes
  * classList                       https://developer.mozilla.org/de/docs/Web/API/Element/classList
*/
////////////////////////////
// getData() 1

function getData(input) 
{
    console.log(input);
    // add a data- to <input>
    input.setAttribute("data-check", "checked");

    //add a mark as a class to the parent div
    input.parentElement.classList.add("mark");
}


/*
  * remove .mark
*/
////////////////////////////
// getData() 2
/*
function getData(input) 
{
    let isChecked = input.hasAttribute('data-check');
    if(!isChecked)
    {
        input.setAttribute("data-check", "checked");
        input.parentElement.classList.add("mark");
    }
    else
    {
        input.removeAttribute(input);
        input.parentElement.classList.remove("mark");
    }

}
*/

////////////////////////////
// jquery way to do it
/*
$('input:checkbox').change(function(){
    if($(this).is(":checked")) {
        console.log("jQuery: ");
        $(this).parent('div').addClass("mark");
        // select all cells of the ancestor row;
        const td_elements_of_tr = $(this).parents("tr").children();
        const article = td_elements_of_tr[1].textContent;
        const author = td_elements_of_tr[2].textContent;
        const words = td_elements_of_tr[3].textContent;
        const share = td_elements_of_tr[4].textContent;
        addItem(this.id, article, author, words, share);
    } else {
        $(this).parent('div').removeClass("mark");
    }
});
*/


////////////////////////////
// addItem()
//adds the data from the data property attributs to the entry
function addItem(id, article, author, words, shares) 
{
  let datenkorbArray = JSON.parse(localStorage.getItem('databasket_js_3')) || []; 
  var newItem = 
  { 
	"id" : id, 
	"article": article,
	"author": author, 	
	"words": words, 
	"shares": shares
  } 
  
  //pushs item on a array
  datenkorbArray.push(newItem);
  //saves entry in the localStorage
  localStorage.setItem('databasket_js_3', JSON.stringify(datenkorbArray));
};


