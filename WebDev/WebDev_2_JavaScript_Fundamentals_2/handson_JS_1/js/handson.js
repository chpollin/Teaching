// JS Fundamentals 1
// Christopher Pollin


//////////////////////
// Variables and Scope

// Global Scope

const name = "Monique";

function sayHi() {
  console.log(`Hi ${name}`);
}

sayHi();
// Hi Monique

// redeclaration of const name

//name = "Chistopher";



// Local Scope
// et and const are local to the block. 
// Inside of a loop, the code before and after the loop cannot “see” it.
let x = 10;
if (true) {
  let y = 20;
  var z = 30;
  console.log(x + y + z);
  // → 60
}
// y is not visible here
console.log(x + z);
//console.log(x + y);

// Block Scope
// https://www.w3schools.com/js/js_function_definition.asp
// JavaScript functions can be used as values:
// `hello ${}` https://developer.mozilla.org/de/docs/Web/JavaScript/Reference/Template_literals
/*
const hummus = function(factor) 
{
  const ingredient = function(amount, unit, name) 
  {
    let ingredientAmount = amount * factor;
    if (ingredientAmount > 1) 
    {
      unit += "s";
    }
    console.log(`${ingredientAmount} ${unit} ${name}`);
  };
  ingredient(1, "can", "chickpeas");
  ingredient(0.25, "cup", "tahini");
  ingredient(0.25, "cup", "lemon juice");
  ingredient(1, "clove", "garlic");
  ingredient(2, "tablespoon", "olive oil");
  ingredient(0.5, "teaspoon", "cumin");
};
//
//hummus(1);
hummus();


function myFunction(p1, p2) {
  p1 = 1;
  return p1 * p2;
}
console.log(myFunction(4, 3));
*/

// was passiert hier?



//Declaration notation



console.log("The future says:", future());

function future() {
    
  return "You'll never have flying cars";
}


// Arrow functions
// error here
// console.log("2^3 is ", power(2,3));
const power = (base, exponent) => {
  let result = 1;
  for (let count = 0; count < exponent; count++) {
    result *= base;
  }
  return result;
};

console.log("2^3 is ", power(2,3));

/*

const square1 = (x) => { return x * x; };
// equal to
const square2 = x => x * x;
console.log(square1(2));
console.log(square2(2));

// without paramete and withput return
const horn = () => {console.log("Toot");};

*/

