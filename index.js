const { getUsers } = require('./api/fetch');
const { client, User } = require('./models');


async function start() {
    await client.connect();

    const usersArray = await getUsers();

    const response = await User.bulkCreate(usersArray)

    console.log(response);

    await client.end();
};

start();

// loadUsers();

// getUsers();