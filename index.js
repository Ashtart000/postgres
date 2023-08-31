const { Client } = require('pg');
const { mapUsers } = require('./utils');

const configs = {
    host: 'localhost',
    port: 5432,
    user: 'postgres',
    password: 'annush250588',
    database: 'students'
}

const client = new Client(configs);

const usersArray = [
    {
        firstName: 'Test1',
        lastName: 'Superman',
        email: 'test1@gmail.com',
        gender: 'male',
        isSubscribe: true
    },
    {
        firstName: 'Test2',
        lastName: 'Superman',
        email: 'test2@gmail.com',
        gender: 'male',
        isSubscribe: true
    },
    {
        firstName: 'Test3',
        lastName: 'Superman',
        email: 'test3@gmail.com',
        gender: 'male',
        isSubscribe: true
    }
]

const user = {
    firstName: 'Alex',
    lastName: 'Superman',
    email: 'alex@gmail.com',
    gender: 'male',
    isSubscribe: true
};

async function start() {
    await client.connect();

    const response = await client.query(`
        INSERT INTO users(first_name,last_name,email,is_subscribe,gender) VALUES
        ${mapUsers(usersArray)};
    `);

    await client.end();

    console.log(response)
};

start();