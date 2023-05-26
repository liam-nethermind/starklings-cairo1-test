// Integer types implement basic comparison and arithmetic operators.
// Felt252 operations should be avoided where possible, as they could have unwanted behavior.

// TODO
// Return the solution of x^3 + y - 2

use debug::PrintTrait;
use traits::Into;
use traits::TryInto;
use option::OptionTrait;

fn pow(base: felt252, exp: felt252) -> felt252 {
    match exp {
        0 => 1,
        _ => base * pow(base, exp - 1),
    }
}

fn power(base: felt252, exponent: u32) -> felt252 {
    if exponent == 0_usize {
        return 1;
    } else if exponent % 2_usize == 0_usize {
        let result = power(base, exponent / 2_usize);
        return result * result;
    } else {
        let result = power(base, (exponent - 1_usize) / 2_usize);
        return result * result * base;
    }
}

fn poly(x: usize, y: usize) -> usize {
    // FILL ME
    let result = power(x.into(), 3_usize) + y.into() - 2;
    let res = result.try_into().unwrap();
    res // Do not change
}

// Do not change the test function
#[test]
fn test_poly() {
    let res = poly(5_usize, 3_usize);
    assert(res == 126_usize, 'Error message');
    assert(res < 300_usize, 'res < 300');
    assert(res <= 300_usize, 'res <= 300');
    assert(res > 20_usize, 'res > 20');
    assert(res >= 2_usize, 'res >= 2');
    assert(res != 27_usize, 'res != 27');
}

