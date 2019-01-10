import { Selector } from 'testcafe';

fixture `Testing my test page`
  .page `http://localhost:5000`;

test('Testing initial state then decrement then increment', async t => {
  await t
    .expect(Selector('#compteur').innerText).eql('0')
    .click('#boutonM')
    .expect(Selector('#compteur').innerText).eql('-1')
    .click('#boutonP')
    .expect(Selector('#compteur').innerText).eql('0');
  });