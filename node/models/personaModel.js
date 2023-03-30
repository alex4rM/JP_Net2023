import db from "../database/db.js";

import { DataTypes } from "sequelize";

const personaModel = db.define('persona', {
    Nombres: {type: DataTypes.STRING},
    ApellidoPaterno: {type: DataTypes.STRING},
    ApellidoMaterno: {type: DataTypes.STRING},
    DNI: {type: DataTypes.STRING},
    Telefono: {type: DataTypes.STRING},
    Email: {type: DataTypes.STRING},
    idDireccion: {type: DataTypes.INTEGER},
    ContactoDeEmergencia: {type: DataTypes.STRING},
    NumeroDeEmergencia: {type: DataTypes.STRING},
    FechaDeNacimiento: {type: DataTypes.DATE},
    Alergias:{type: DataTypes.STRING},
    //idLocalidadActual: {type: DataTypes.INTEGER},
    //idLocalidadNacimiento: {type: DataTypes.INTEGER},
    idTipodeSangre:{type: DataTypes.INTEGER},
    telefonoFijo:{type: DataTypes.STRING},
    createdAt:{type: DataTypes.DATE},
    updatedAt:{type: DataTypes.DATE}
})

export default personaModel;