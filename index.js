const { Client } = require('pg');

const configs = {
    host: 'localhost',
    port: 5432,
    user: 'postgres',
    password: 'annush250588',
    database: 'students'
}

const client = new Client(configs);

// await client.connect();

async function start() {
    await client.connect();

    const response = await client.query(`
        INSERT INTO users(first_name,last_name,email,is_subscribe,gender) VALUES
        ('Anya', 'Lednyova', 'ashtart@gmail.com', false, 'female');
    `);

    await client.end();

    console.log(response)
};

start();