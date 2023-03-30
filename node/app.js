import express from 'express';
import cors from 'cors';
import db from './database/db.js';
import personaRoute from './routes/routes.js';

const app = express();

app.use(cors())
app.use(express.json())
app.use('/persona', personaRoute)

try{
    await db.authenticate()
    console.log('Base de datos conectada')
}catch(error){
    console.log('El error de conexion es: ${error}')
}

app.get('/', (req,res)=>{
    res.send('Hola Alex');
})

app.listen(8000,() =>{
    console.log('Servidor corriendo en http://localhost:8000/');
})