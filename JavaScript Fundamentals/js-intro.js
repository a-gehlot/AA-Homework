function madLib(verb, adjective, noun) {
    console.log(`We shall ${verb} the ${adjective} ${noun}.`);
}

madLib('make', 'best', 'guac'); 

function isSubstring(searchString, subString) {
    console.log(searchString.includes(subString));
}

isSubstring("time to program", "time");
isSubstring("Jump for joy", "joys");

function fizzBuzz(array) {
    const numbers = array.filter((element) => {
        return (element % 3 === 0) ^ (element % 5 === 0)
    })
    console.log(numbers);
}

fizzBuzz([10, 9, 15, 1]);


function isPrime(number) {
    for (var i = 2; i <= Math.sqrt(number); i++) {
        if (number % i === 0) {
            return false;
        }
    }
    return true;
}

isPrime(2);
isPrime(10);
isPrime(15485863);
isPrime(3548563);

function firstNPrimes(n) {
    let primes = [];
    for (var i = 2; primes.length <= n; i++) {
        if (isPrime(i)) {
            primes.push(i);
        }
    }
    return primes;
}

firstNPrimes(5);

function sumOfNPrimes(n) {
    let sum = firstNPrimes(n).reduce(
        (a, b) => {
            return a + b;
        },
    0)
    console.log(sum);
}

sumOfNPrimes(5);