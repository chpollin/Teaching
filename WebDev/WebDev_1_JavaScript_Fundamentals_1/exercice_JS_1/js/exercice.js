// JS Fundamentals 1
// Christopher Pollin

///////////////
// number
let number = 0;
console.log("#### number");
console.log(number);
number = (3+3)*8;
console.log(number);

///////////////
// typeof 
console.log("#### typeof ");
console.log(typeof(number));

///////////////
// sentence
let sentence1 = "They speak english in what?";
let sentence2 = 'Say What Again! I double dare you!';
console.log("#### sentence");
console.log(typeof(sentence1));


///////////////
// +
console.log("#### +");
console.log(sentence1 + "\n" + sentence2);
console.log(sentence1 + number);
let number_2 = "2";
// number + string --> both string
console.log(number + number_2);

///////////////
// >
console.log("#### < >");
console.log(3 > 2);
console.log(3 < 1);
console.log(typeof(3 < 1));

///////////////
// &&, || and ! 
console.log("#### &&, || and !");
// false AND true OR false = false OR false = false
console.log((3 < 1) && true || !true);
// 
console.log((3 < 1) && true || true);
console.log((3 < 1) && false || true);

///////////////
// person
let person = {
            firstName:"John", 
            lastName:"Doe", 
            age:50, 
            eyeColor:"blue"
        };
console.log("#### person");
console.log(person.lastName + ", " + person.firstName);