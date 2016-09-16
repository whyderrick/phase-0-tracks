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
  horses.push(horse)
};
//This doesn't currently store the horses we make, but it could
console.log(horses);
console.log(horses[2]);
console.log(horses[10]);