const { getUsers } = require('./api/fetch');
const { client, User, Product } = require('./models');
const { generatePhones } = require('./utils');
const Order = require('./models/Order');


async function start() {
    await client.connect();

    //отримання юзерів і додавання їх до БД
    //const usersArray = await getUsers();
    //const response = await User.bulkCreate(usersArray)
    //console.log(response);

    //генерація телефонів
    //const phonesArray = generatePhones(100);
    //const response = await Product.bulkCreate(phonesArray);
    //console.log(response);

    // ГЕНЕРАЦІЯ ЗАМОВЛЕНЬ
    // 1. Ми витягаємо всіх юзерів User.findAll()
    // 2. Створили для цих юзерів замовлення і наповнили замовлення рандомними позицями Order.bulkCreate(usersArray, productsArray)
    const {rows: usersArray} = await User.findAll();
    const {rows: productsArray}= await Product.findAll();
    await Order.bulkCreate(usersArray, productsArray);

    await client.end();
};

start();

// loadUsers();

// getUsers();