// Functions
// https://eloquentjavascript.net/03_functions.html
// Christopher Pollin, Web-Entwicklung, 2020


////////////////////
////////////////////
//Bean counting


//console.log(countBs("BBBBbC"));

console.log(countChar("kakkerlakkk", "k"));
console.log(countChar("SDDD", "S"));


function countChar(string, character){
    let string_length = string.length;
    let countChar = 0;
    
    for(let count = 0; count < string_length; count++)
    {
        if(string[count] == character)
        {
            countChar++; 
        } 
        
    }
    
    return countChar;
    
}


function countBs(string){
    let string_length = string.length;
    let countBs = 0;
    
    for(let count = 0; count < string_length; count++)
    {
        if(string[count] == "B")
        {
            countBs++; 
        } 
        
    }
    return countBs;
}


