var colors = ["baby blue", "royal green", "burnt orange", "black"];
var names = ["Ed", "Hands", "Seabiscuit", "Secretariat"];

colors.push("silver");
names.push("Silver");

// Let's declare an object:
// 2 different loops.
//for each name array  -- create a new obj w. key=== name CurrentIndex , and the value equal to color at the CurrentIndex
var horses = []
for(var i = 0; i < names.length; i++) {
  var horse = {};
  horse[names[i]] = colors[i];
  horses.push(horse);
};
//This doesn't currently store the horses we make, but it could
// console.log(horses);
// console.log(horses[2]);
// console.log(horses[10]);

// Make a car constructor function

var Car = function(maker, year, numberOfWheels){
  this.maker = maker;
  this.year = year;
  this.numberOfWheels = numberOfWheels;
  // console.log("our new car: "  + this);
  this.drive = function(distance) {console.log("You drove " + distance + " miles."); };
};

var car1 = new Car("Honda", 2003, 4);
console.log("---------");
console.log(car1);

var car2 = new Car("Lamborghini", 2010, 4);
console.log("---------");
console.log(car2);


var car3 = new Car("Lotus", 2017, 4);
console.log("---------");
console.log(car3);
// console.log(("car1 is ") + (car1)); //How do people interpolate in Javascript?
car1.drive(42);
car1.drive(5);
car2.drive(33);
car3.drive(68);

