// SICP JS 1.3.1

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
