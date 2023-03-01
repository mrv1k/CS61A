// https://sourceacademy.org/sicpjs/1.3.4

// SICP JS 1.3.4

// 1.41
function inc(n) {
    return n + 1;
}

function double(fn) {
    return (n) => fn(fn(n));
}

double(double(double))(inc)(5);
// 2^3 = 8 of doubles = 16 + 5 = 21

// skipped 1.42

// 1.43
