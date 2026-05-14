// JS Fundamentals 2
// Christopher Pollin

///////////////
// Chessboard
// https://eloquentjavascript.net/code/#2.3
console.log("################Chessboard");

let size = 8;
let board = "";

for (let outer_count = 0; outer_count < size; outer_count++) {
  for (let inner_count = 0; inner_count < size; inner_count++) {
    if ((inner_count + outer_count) % 2 == 0) {
      board += " ";
    } else {
      board += "#";
    }
  }
  board += "\n";
}

/* um gerade|ungerade zahlen im feld sicherzustellen.
[0][0], [0][1], [0][2], [0][3]
[1][0], [1][1], [1][2], [1][3]
...
[7][0], [7][1], [7][2], [7][3]

*/

console.log(board);

/* Output:
 # # # #\n
# # # # \n
 # # # #\n
# # # # \n
 # # # #\n
# # # # \n
 # # # #\n
# # # # \n
*/

/*

function chessBoard(size)
{
    let board = "";

    for (let outer_count = 0; outer_count < size; outer_count++) 
    {
      for (let inner_count = 0; inner_count < size; inner_count++) 
      {
        if ((inner_count + outer_count) % 2 == 0) {
          board += " ";
        } else {
          board += "#";
        }
      }
      board += "\n";
    }
    
    return board;
}

console.log("################Reversing an array");
console.log(chessBoard(6));
console.log(chessBoard(4));
*/



///////////////
// Reversing an array
//https://eloquentjavascript.net/code/#4.2
console.log("################Reversing an array");

function reverseArray(array) {
  let output = [];
  // array.length https://developer.mozilla.org/de/docs/Web/JavaScript/Reference/Global_Objects/Array/length
  console.log(array.length )
  for (let count = array.length - 1; count >= 0; count--) {
      // .push() https://developer.mozilla.org/de/docs/Web/JavaScript/Reference/Global_Objects/Array/push
      // array[count] https://developer.mozilla.org/de/docs/Web/JavaScript/Reference/Global_Objects/Array
    output.push(array[count]);
  }
  return output;
}


/*
hier wird ein NEUES Array befüllt.
Programmablauf (pseudocode):

output.push(array[2]) - array[2] == C
    output["C"]
output.push(array[1]) - array[1] == B
    output["C", "B"]
output.push(array[2]) - array[2] == A
    output["C", "B", "A"]
*/



function reverseArrayInPlace(array) {
  // Math.floor = abrunden; wenn Array 5 Elemente hat, 5/2 = 2.5 Math.floor(2.5) = 2
  // warum array.length / 2 --> weil wir nur von hinten bis zu Hälfte gehen brauchen.
  //console.log(Math.floor(array.length / 2))
  for (let count = 0; count < Math.floor(array.length / 2); count++) {
    let old = array[count];
    //console.log("Old: " + old);
    //console.log("Index " + String(array.length - 1 - count) + " mit dem Inhalt " + array[array.length - 1 - count])
    array[count] = array[array.length - 1 - count];
    array[array.length - 1 - count] = old;
  }
  return array;
}

/*
hier wird das vorhandene Array neu angeordnet.
Programmablauf (pseudocode):

old = "'ere the other side he see"
array[array.length - 1 - count] = "Bridgekeeper:" - speichere das an der stelle array[count]
und speichere was in old ist (index 0) an der stelle index 0

#1
[0]                             [1]                                      [2]                                     [3]       [4]
", 'ere the other side he see", "Must answer me these questions three", "who would cross the Bridge of Death\n", "Stop, ", "Bridgekeeper:\n"
old: ""

#2
[0]                             [1]                                      [2]                                     [3]       [4]
", 'ere the other side he see", "Must answer me these questions three", "who would cross the Bridge of Death\n", "Stop, ", "Bridgekeeper:\n"
old: ", 'ere the other side he see"

#3
[0]                             [1]                                      [2]                        [3]       [4]
"Bridgekeeper:\n", "Must answer me these questions three", "who would cross the Bridge of Death\n", "Stop, ", ", 'ere the other side he see"
old: ", 'ere the other side he see"

#4
[0]                             [1]                                      [2]                        [3]       [4]
"Bridgekeeper:\n", "Must answer me these questions three", "who would cross the Bridge of Death\n", "Stop, ", ", 'ere the other side he see"
old: "Must answer me these questions three"

#5
[0]                             [1]                                      [2]                        [3]       [4]
"Bridgekeeper:\n", "Stop, ", "who would cross the Bridge of Death\n", "Stop, ", ", 'ere the other side he see"
old: "Must answer me these questions three"

#6
[0]                             [1]                                      [2]                        [3]       [4]
"Bridgekeeper:\n", "Stop, ", "who would cross the Bridge of Death\n", "Must answer me these questions three", ", 'ere the other side he see"
old: "Must answer me these questions three"

*/


console.log(reverseArray(["A", "B", "C"]));
// → ["C", "B", "A"];
let arrayValue = [", 'ere the other side he see", "Must answer me these questions three", "who would cross the Bridge of Death\n", "Stop, ", "Bridgekeeper:\n"];
reverseArrayInPlace(arrayValue);
console.log(arrayValue);
// → [5, 4, 3, 2, 1]