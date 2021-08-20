// Find the Error
function mysteryScoping1() {
    console.log("mysteryScoping1()")
    var x = 'out of block';
    if (true) {
      var x = 'in block';  
      console.log(x);
    }
    console.log(x);
  }
  
  function mysteryScoping2() {
    console.log("mysteryScoping2()")
    const x = 'out of block';
    if (true) {
      const x = 'in block';  
      console.log(x);
    }
    console.log(x);
  }
  
  function mysteryScoping3() {
    // SyntaxError: Identifier 'x' has already been declared
    console.log("mysteryScoping3()")
    const x = 'out of block';
    if (true) {
      var x = 'in block';  
      console.log(x);
    }
    console.log(x);
  }
  
  function mysteryScoping4() {
    console.log("mysteryScoping4()")
    let x = 'out of block';
    if (true) {
      let x = 'in block';  
      console.log(x);
    }
    console.log(x);
  }
  
  function mysteryScoping5() {
    console.log("mysteryScoping5()")
    let x = 'out of block';
    if (true) {
      let x = 'in block';  
      console.log(x);
    }
    // SyntaxError: Identifier 'x' has already been declared
    let x = 'out of block again';
    console.log(x);
  }
//   mysteryScoping1()
//   mysteryScoping2()
//   mysteryScoping3()
//   mysteryScoping4()
//   mysteryScoping5()

const madLib = (verb, adjective, noun) => {
    return `We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}`
}
// console.log(madLib('make', 'best', 'guac'));
// "We shall MAKE the BEST GUAC."

const isSubstring = (string, substring) => {
    console.log(string.includes(substring));
}

// isSubstring("time to program", "time")
// true

// isSubstring("Jump for joy", "joys")
// false


const fizzbuzz = function(num){
    for(let i = 1; i <= num; i++){
        if (i%3 == 0 && i%5 == 0){
            console.log("fizzbuzz")
        }else if (i % 3 == 0){
            console.log("fizz")
        }else if (i % 5 == 0){
            console.log("buzz")
        }else{
            console.log(i)
        }
    }
}
// fizzbuzz(15)

const isPrime = function(n){
    let flag = true
    for (let i = 2; i < n/2; i++){
        if (n % i == 0) flag = false
    }
    // USE CONSOLE.LOG to print, use return to use in sumOfPrimes
    // console.log(flag)
    return flag
}


// isPrime(15485863)
// isPrime(3548563)

const sumOfNPrimes = (n) => {
    let arr = []
    let i = 2;
    while (arr.length < n){
        if (isPrime(i)){
            arr.push(i)
        }
        i++;
    }
    let sum = 0;
    for (let j=0; j<arr.length; j++){
        sum += arr[j]
    }
    console.log(sum);
}

sumOfNPrimes(0)
// 0

sumOfNPrimes(1)
// 2

sumOfNPrimes(4)
// 17