const _ = require('lodash');

module.exports.mapUsers = (usersArray) => {
    return usersArray.map((
        {name: {first, last}, email, gender, dob: {date}}) => 
        `('${first}', '${last}', '${email}', ${Boolean(Math.random() > 0.5)}, '${gender}', '${date}')`
    ).join(',');
};


const PHONES_BRANDS = [
    'Samsung', 'Huawei', 'Apple', 'Xiaomi', 'Nokia'
]

const generateOnePhone = key => ({
    brand: PHONES_BRANDS[_.random(0, PHONES_BRANDS.length - 1, false)],
    model: `model ${key}`,
    quantity: _.random(10, 100, false),
    price: _.random(500, 100000, false)
})

// module.exports.generatePhones = length => {
//     const phonesArray = [];

//     for(let i = 0; i < length; i++) {
//         phonesArray.push(generateOnePhone(i));
//     };

//     return phonesArray;
// }

module.exports.generatePhones = (length = 50) => new Array(length).fill(null).map((el, i) => generateOnePhone(i));
