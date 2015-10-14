function Classroom(students){
  this.students = students,
  this.find = function (name) {
    var student = null;
    for(var i = 0; i < this.students.length; i++){
      if (this.students[i].firstName == name) {
        student = this.students[i]
      };
    };
    return student
  };
  this.honorRollStudents = function () {
    var honorStudents = [];
    for(var i = 0; i < this.students.length; i++){
      if (this.students[i].averageScore() >= 95 ) {
        honorStudents.push(this.students[i])
      };
    };
    return honorStudents;
  }
}

