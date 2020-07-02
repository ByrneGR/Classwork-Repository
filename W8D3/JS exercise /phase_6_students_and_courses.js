function Student(firstname, lastname) {
  this.firstname = firstname;
  this.lastname = lastname;
  this.courses = [];
}


Student.prototype.name = function() { 
  return this.firstname + " " + this.lastname;
}

Student.prototype.enroll = function(course) {
  if (!this.courses.includes(course)) {this.courses.push(course);
  }
}

function Course(name, credits, depts) {
    this.name = name;
    this.credits = credits;
    this.department = depts;
}

Student.prototype.courseLoad = function() {
    let load = {};
    for (let i = 0; i < this.courses.length; i++) {
        if (!load[this.courses[i].department]) {
            load[this.courses[i].department] = 0;
        }
        // let currCreds = load[course.department];
        // let notNil = currCreds.instanceOf(Number);
        // load[course.department] = (notNil ? currCreds : 0) + course.credits;
        console.log(this.courses[i])
        load[this.courses[i].department] += this.courses[i].credits;
    }
    return load;
}

let a = new Student("first", "firstson");
let b = new Student("second", "secondson");

let c1 = new Course("calculus", 4, "math");
let c2 = new Course("world history", 4, "history");
let c3 = new Course("mars history", 16, "history");

console.log(a.name());
console.log(b.name());

console.log(a.courses);
// a.enroll("a course");
a.enroll(c1);
a.enroll(c2);
a.enroll(c3);
console.log(a.courses);

console.log(a.courseLoad());

// function Course() {

// }