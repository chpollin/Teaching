// Assignment 2, Webdevelopment 2019
// author: Christopher Pollin 
// 2019

//////////////////////////////////////
// main()
var SUPERHEROS = [{
		"superhero": "Batman",
		"publisher": "DC Comics",
		"alter_ego": "Bruce Wayne",
		"first_appearance": "Detective Comics #27",
		"characters": "Bruce Wayne",
        "wiki": "https://de.wikipedia.org/wiki/Batman"
	},
	{
		"superhero": "Superman",
		"publisher": "DC Comics",
		"alter_ego": "Kal-El",
		"first_appearance": "Action Comics #1",
		"characters": "Kal-El",
        "wiki": "https://de.wikipedia.org/wiki/Superman"
	},
	{
		"superhero": "Flash",
		"publisher": "DC Comics",
		"alter_ego": "Jay Garrick",
		"first_appearance": "Flash Comics #1",
		"characters": "Jay Garrick, Barry Allen, Wally West, Bart Allen"
	},
	{
		"superhero": "Green Lantern",
		"publisher": "DC Comics",
		"alter_ego": "Alan Scott",
		"first_appearance": "All-American Comics #16",
		"characters": "Alan Scott, Hal Jordan, Guy Gardner, John Stewart, Kyle Raynor, Jade, Sinestro, Simon Baz"
	},
	{
		"superhero": "Green Arrow",
		"publisher": "DC Comics",
		"alter_ego": "Oliver Queen",
		"first_appearance": "More Fun Comics #73",
		"characters": "Oliver Queen"
	},
	{
		"superhero": "Wonder Woman",
		"publisher": "DC Comics",
		"alter_ego": "Princess Diana",
		"first_appearance": "All Star Comics #8",
		"characters": "Princess Diana"
	},
	{
		"superhero": "Martian Manhunter",
		"publisher": "DC Comics",
		"alter_ego": "J'onn J'onzz",
		"first_appearance": "Detective Comics #225",
		"characters": "Martian Manhunter"
	},
	{
		"superhero": "Robin/Nightwing",
		"publisher": "DC Comics",
		"alter_ego": "Dick Grayson",
		"first_appearance": "Detective Comics #38",
		"characters": "Dick Grayson"
	},
	{
		"superhero": "Blue Beetle",
		"publisher": "DC Comics",
		"alter_ego": "Dan Garret",
		"first_appearance": "Mystery Men Comics #1",
		"characters": "Dan Garret, Ted Kord, Jaime Reyes"
	},
	{
		"superhero": "Black Canary",
		"publisher": "DC Comics",
		"alter_ego": "Dinah Drake",
		"first_appearance": "Flash Comics #86",
		"characters": "Dinah Drake, Dinah Lance"
	},
	{
		"superhero": "Spider Man",
		"publisher": "Marvel Comics",
		"alter_ego": "Peter Parker",
		"first_appearance": "Amazing Fantasy #15",
		"characters": "Peter Parker"
	},
	{
		"superhero": "Captain America",
		"publisher": "Marvel Comics",
		"alter_ego": "Steve Rogers",
		"first_appearance": "Captain America Comics #1",
		"characters": "Steve Rogers"
	},
	{
		"superhero": "Iron Man",
		"publisher": "Marvel Comics",
		"alter_ego": "Tony Stark",
		"first_appearance": "Tales of Suspense #39",
		"characters": "Tony Stark"
	},
	{
		"superhero": "Thor",
		"publisher": "Marvel Comics",
		"alter_ego": "Thor Odinson",
		"first_appearance": "Journey into Myster #83",
		"characters": "Thor Odinson"
	},
	{
		"superhero": "Hulk",
		"publisher": "Marvel Comics",
		"alter_ego": "Bruce Banner",
		"first_appearance": "The Incredible Hulk #1",
		"characters": "Bruce Banner"
	},
	{
		"superhero": "Wolverine",
		"publisher": "Marvel Comics",
		"alter_ego": "James Howlett",
		"first_appearance": "The Incredible Hulk #180",
		"characters": "James Howlett"
	},
	{
		"superhero": "Daredevil",
		"publisher": "Marvel Comics",
		"alter_ego": "Matthew Michael Murdock",
		"first_appearance": "Daredevil #1",
		"characters": "Matthew Michael Murdock"
	},
	{
		"superhero": "Hawkeye",
		"publisher": "Marvel Comics",
		"alter_ego": "Clinton Francis Barton",
		"first_appearance": "Tales of Suspense #57",
		"characters": "Clinton Francis Barton"
	},
	{
		"superhero": "Cyclops",
		"publisher": "Marvel Comics",
		"alter_ego": "Scott Summers",
		"first_appearance": "X-Men #1",
		"characters": "Scott Summers"
	},
	{
		"superhero": "Silver Surfer",
		"publisher": "Marvel Comics",
		"alter_ego": "Norrin Radd",
		"first_appearance": "The Fantastic Four #48",
		"characters": "Norrin Radd"
	}];


//////////////////////////////////////
function buildTable(data) {
  let table = document.createElement("table");

  let fields = Object.keys(data[0]);
  let headRow = document.createElement("tr");
  fields.forEach(function(field) {
  if(field != "wiki")
    {
        let headCell = document.createElement("th");
        headCell.textContent = field;
        headRow.appendChild(headCell);
    }
  });
  table.appendChild(headRow);
  //für jedes object im JSON
  data.forEach(function(object) {
    let row = document.createElement("tr");
    
    //für jede Spalte
    fields.forEach(function(field) {
        //überspringe die wiki spalte
        if(field != "wiki")
        {
        let cell = document.createElement("td");

        //wenn du in der Spalte supherhero bist
        if (field == "superhero") {
			
            //cell.style.textAlign = "center";
			// or
			//cell.setAttribute("class", "text-center"); 
			// or
			//cell.setAttribute("style", "text-align: center;");

            cell.style.fontWeight = "bold";
            row.setAttribute("id", "superhero_" + object[field]);
            // wenn ein wiki key im JSON exisitiert erzeuge einen link

			console.log(object["wiki"]);
			// gibt undefined zurück wenn kein wiki existiert.
			// Boolean value of undefined is false
				
            if(object["wiki"]){
              let a = document.createElement('a');
              a.setAttribute("target", "_blank"); 
              a.textContent = object[field];
              a.setAttribute("href", object["wiki"]);
              cell.appendChild(a);
            }
            //sonst befülle nur die cell
            else{
            cell.textContent = object[field];
            }  
          }
          else
          {
            cell.textContent = object[field];
          }
          row.appendChild(cell);
          row.setAttribute("class", "hero_row");
        }
    });
    table.appendChild(row);
    table.setAttribute("border", "1px solid black");
  });
  return table;
}


//5.2
//////////////////////////////////////
function getTabel() {
  document.getElementById("superheros").appendChild(buildTable(SUPERHEROS));
}
//////////////////////////////////////
function destroyTabel() {
  let superheros = document.getElementById("superheros");
  document.getElementById("superheros");

  if (superheros.hasChildNodes()) {
    superheros.removeChild(superheros.childNodes[0]);
  } else {
    console.log("Error: table is already destroyed");
  }
  // kann man auch mit ternary operator ... ? ... : ... machen
  //superheros.hasChildNodes() ? superheros.removeChild(superheros.childNodes[0]) : console.log("Error: table is already destroyed");
}

