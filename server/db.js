const pool = require("mysql2/promise");

const mysqlPool = pool.createPool({
  host: "localhost",
  user: "root",
  password: 'MySQL@Harith',
  database: "pos",
  port: 3307,
});

module.exports = mysqlPool;