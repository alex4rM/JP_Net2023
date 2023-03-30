import { Sequelize } from "sequelize";

const db = new Sequelize('jpingenieria_jpnet2023', 'root','root',{
    host: 'localhost',
    dialect:'mysql',
})

export default db;