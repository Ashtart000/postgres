const { Client } = require('pg');
const { configs } = require('.././configs');
const User = require('./User');
const Product = require('./Product')

const client = new Client(configs);

User._client = client;
User._tableName = 'users';

Product._client = client;
Product._tableName = 'products';

module.exports = {
    client,
    User,
    Product
}