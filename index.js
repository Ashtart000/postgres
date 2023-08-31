const { Client } = require('pg');
const { mapUsers } = require('./utils');
const { configs } = require('./configs');
const { loadUsers } = require('./api');
const { getUsers } = require('./api/fetch')

const client = new Client(configs);

async function start() {
    await client.connect();

    const response = await client.query(`
        INSERT INTO users(first_name,last_name,email,is_subscribe,gender) VALUES
        ${mapUsers(usersArray)};
    `);

    await client.end();

    console.log(response)
};

// start();

// loadUsers();

getUsers();