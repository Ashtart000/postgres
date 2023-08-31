module.exports.getUsers = async () => {
    const resp = await fetch('https://randomuser.me/api?results=100');
    const data = await resp.json();
    return data.results;
}