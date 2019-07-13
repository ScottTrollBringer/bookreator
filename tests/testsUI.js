import { Selector } from 'testcafe';

fixture `Testing the home page`
  .page `http://localhost:8080`;

test('Testing that all initial components are loading correctly initial state', async t => {
  await t
    .expect(Selector('#bookTitle').exists).ok()
    .expect(Selector('#pageNumber').exists).ok()
    .expect(Selector('#pageContent').exists).ok()
    .expect(Selector('#button1').exists).ok()
    .expect(Selector('#button2').exists).ok()
  });