// https://sourceacademy.org/sicpjs/1.3.4

// SICP JS 1.3.4

// 1.40 - skipped - got spooked by math

// 1.41
function inc(n) {
    return n + 1;
}

function double(fn) {
    return (n) => fn(fn(n));
}

double(double(double))(inc)(5);
// 2^3 = 8 of doubles = 16 + 5 = 21

// 1.42
function compose(f, g) {
    return (x) => f(g(x));
}

// 1.43
const square = (x) => x * x;


function repeated(fn, n) {
    return n === 0
        ? y => y
        : compose(fn, repeated(fn, n - 1));
}

repeated(square, 2)(5);
// square 5 2 times
// square 5 * 5, square 5 1 times
// square 25 * 5, square 0 times
// if times === 0 return 625

