var Person = function () {};
Person.prototype.initialize = function (name, age) {
  this.name = name;
  this.age = age;
};
Person.prototype.describe = function () {
  return this.name + ", " + this.age + " years old.";
};
var Student = function () {};
Student.prototype = new Person();
Student.prototype.learn = function (subject) {
  console.log(this.name + " just learned " + subject);
};
var me = new Student();
me.initialize("John", 25);
me.learn("Inheritance");

var Teacher = function () {};
Teacher.prototype = new Person();
Teacher.prototype.teach = function (subject) {
  console.log(this.name + " is now teaching " + subject);
};
var me = new Teacher();
me.initialize("Hoang Minh", 21);
me.teach("Front-end");
