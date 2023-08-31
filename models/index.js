const { Client } = require('pg');
const { configs } = require('.././configs');
const User = require('./User');

const client = new Client(configs);

User._client = client;
User._tableName = 'users';

module.exports = {
    client,
    User
}