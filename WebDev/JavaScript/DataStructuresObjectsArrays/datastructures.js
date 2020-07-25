// Functions
// https://eloquentjavascript.net/03_functions.html
// Christopher Pollin, Web-Entwicklung, 2020


////////////////////
////////////////////
//The sum of a range


function range(start, end, step = start < end ? 1 : -1)
{
    let numbers = [];
    
    if(step > 0)
    {
       for(let count = start; count <=end; count += step)
        {
            numbers.push(count);
        } 
    } else 
    {
        for(let count = start; count >=end; count += step)
        {
            numbers.push(count);
        } 
    }
    return numbers;
}

function sum(numbers){
    let total = 0;
    
    for(let value of numbers)
    {
        total = total + value;
    }
    
    return total;
  
}


console.log(range(1, 10));
// → [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
console.log(range(10, 2, -2));
// → [5, 4, 3, 2]
console.log(sum(range(1, 5)));
// → 55



