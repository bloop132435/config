fn main() {
    //print out first n fibonacci numbers squared
    let mut n = 0;
    let mut fib = 0;
    let mut fib_prev = 0;
    let mut fib_next = 1;
    let mut fib_sum = 0;
    while n < 10 {
        fib = fib_next;
        fib_next = fib_next + fib_prev;
        fib_prev = fib;
        fib_sum = fib_sum + fib * fib;
        println!("{}", fib * fib);
        n = n + 1;
    }
}
