const getRandomName = require("./randomName");

test("returns random number", () => {
  expect(getRandomName()).toBeTruthy();
});
