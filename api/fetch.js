module.exports.getUsers = async () => {
    const resp = await fetch('https://randomuser.me/api?results=10');
    const data = await resp.json();
    console.log(data.results);
    return data.results;
}