const axios = require('axios');

const instance = axios.create({
    baseURL: 'https://randomuser.me/api'
});

module.exports.loadUsers = async () => {
    const response = await instance.get('?results=100');
    console.log(response)
}