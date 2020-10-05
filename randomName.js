const randomName = ["Mostafa","Ehab", "Ezzeldin", "Sayed"];
const getRandomName = () =>
  randomName[Math.floor(Math.random() * randomName.length)];

module.exports = getRandomName;
