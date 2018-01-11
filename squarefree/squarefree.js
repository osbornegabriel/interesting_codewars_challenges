// The squarefree part of a positive integer is the largest divisor of that integer which itself has no square factors (other than 1). For example, the squareefree part of 12 is 6, since the only larger divisor is 12, and 12 has a square factor (namely, 4).

// Your challenge, should you choose to accept it, is to implement a squareFreePart function which accepts a number n and returns the squarefree part of n.

// In the case that n = 1, your function should return 1. Also, if the input doesn't make sense (e.g. if it is not a positive integer), the function should return null/None.

// Here are some examples:

// squareFreePart(2) // returns 2
// squareFreePart(4) // returns 2
// squareFreePart(24) // returns 6, since any larger divisor is divisible by 4, which is a square
// squareFreePart("hi") // returns null
// squareFreePart(0) // returns null

var findMultiples;
var noSquareFactor;
var squareFreePart;

Array.prototype.some = function(f){
  var includes;
  this.forEach(function(i){
    if (f(i) === true){
      includes = true;
    }
  })
  return !!includes;
}


squareFreePart = function(n) {
  if(n === 1){
    return 1;
  }
  else{
    multiples = findMultiples(n);

    // squareFree = multiples.filter(noSquareFactor);
    // squareFree.filter()
    return squareFree.pop();
  }
}

findMultiples = function(n){
  var i;
  var multiples = [];
  for(i = 0; i <= n/2; i += 1){
    if(Number.isInteger(n/i)){
      multiples.push(i)
    }
  }
  multiples.push(n);
  return multiples;
}

noSquareFactor = function(n){
  return n == 1 ? true : !Number.isInteger(Math.sqrt(n));
}

noMultSquareFactors = function(n){
  multiples = findMultiples(n)
  multiples.some(noSquareFactor);
}