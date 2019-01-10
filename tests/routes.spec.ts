import * as routes from '../src/routes';
const jsc = require("jsverify");

describe('Multiply a number by 2', () => {
    test('2 * 2 = 4', () => {
        expect(routes.multiplyBy2(2)).toEqual(4);
    });
    const naturalNumber = jsc.nat;
    jsc.property(
        'multiply by 2 like a boss',
        naturalNumber,
        (n1: number) => routes.multiplyBy2(n1) === n1 + n1
    )
});