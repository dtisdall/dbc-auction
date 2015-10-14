function Student(name, scores){
  this.firstName = name,
  this.scores = scores,
  this.averageScore = function(){
    var total = 0;
    for(var i = 0; i < this.scores.length; i++) {
        total += this.scores[i];
    }
    var avg = total / this.scores.length
    return Math.floor(avg)
  },
  this.letterGrade = function() {
    if (this.averageScore() >= 90) {
      return "A"    
    } else if (this.averageScore() >= 80) {
      return "B"
    } else if (this.averageScore() >= 70) {
      return "C"
    } else if (this.averageScore() >= 60) {
      return "D"
    } else { return "F"}
  }
}

