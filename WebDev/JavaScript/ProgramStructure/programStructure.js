// Program Structure
// https://eloquentjavascript.net/02_program_structure.html
// Christopher Pollin, Web-Entwicklung, 2020


////////////////////
////////////////////
//Looping a triangle

let count = 0;
let hash = "#";

for(count; count <= 6; count++)
{
    console.log(hash);
    hash = hash + "#";
}

////////////////////
//Haverbeke’s Lösung

/*
for (let line = "#"; line.length < 8; line += "#")
    console.log(line);*/
////////////////////

////////////////////
//FizzBuzz

/*
let count = 1;

for(count; count <= 100; count++)
{
    if((count % 3 == 0) && (count % 5 == 0))
    {
        console.log('FIZZBUZZ');
    }
    else if(count % 3 == 0)
    {
        console.log("FIZZ");
    }
    else if((count % 5 == 0) && !(count % 3 == 0))
    {
        console.log("BUZZ");
    }
    else
    {
        console.log(count);
    }
}*/

////////////////////
//Haverbeke’s Lösung
/*
for (var n = 1; n <= 100; n++) 
{
    var output = "";
    if (n % 3 == 0)
    output += "Fizz";
    if (n % 5 == 0)
    output += "Buzz";
    console.log(output || n);
}*/


////////////////////
//Chessboard