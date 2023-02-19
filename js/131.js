// SICP JS 1.3.1

// 1.32
// id = identity
const id = x => x;
const inc = x => x + 1;

function sum(a, term, b, next) {
    return a > b ? 0 : term(a) + sum(next(a), term, term(b), next);
}
// sum(1, id, 3, inc);

function product_r(a, term, b, next) {
    return a > b ? 1 : term(a) * product_r(next(a), term, term(b), next);
}
// product_r(1, id, 5, inc);


function product_r_v2(term, next, a, b) {
    const pre_pro = (a, b) => product_r(term, next, a, b);
    return a > b ? 1 : term(a) * pre_pro(next(a), b);
}
// product_r_v2(id, inc, 1, 5);

// Skipped: also use product to compute approximations to π using the formula

// #TIL source academy stepper doesn't work with iter arrow functions, recursion works fine
function product_i(term, next, a, b) {
    function iter(a, result) {
        return a > b ? result : iter(next(a), result * term(a));
    }
    return iter(a, 1);
}
// product_i(id, inc, 1, 5);

// 1.33
function accumulate_r(combiner, null_value, term, next, a, b) {
    const pre_acc = (a, b) => accumulate_r(combiner, null_value, term, next, a, b);
    return a > b ? null_value : combiner(term(a), pre_acc(next(a), b));
}

// const add = (a, b) => a + b;
// accumulate_r(add, 0, id, inc, 1, 6);
const mul = (a, b) => a * b;
accumulate_r(mul, 1, id, inc, 1, 5);

function accumulate_i(combiner, null_value, term, next, a, b) {
    function iter(a, result) {
        return a > b ? result : iter(next(a), combiner(result, term(a)));
    }
    return iter(a, null_value);
}
accumulate_i(mul, 1, id, inc, 1, 5);
