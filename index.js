const { getUsers } = require('./api/fetch');
const { client, User, Product } = require('./models');
const { generatePhones } = require('./utils')


async function start() {
    await client.connect();

    //отримання юзерів і додавання їх до БД
    //const usersArray = await getUsers();
    //const response = await User.bulkCreate(usersArray)
    //console.log(response);

    //генерація телефонів
    const phonesArray = generatePhones(100);
    const response = await Product.bulkCreate(phonesArray);
    console.log(response);

    await client.end();
};

start();

// loadUsers();

// getUsers();