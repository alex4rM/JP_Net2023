import personaModel from "../models/personaModel.js";

//Mostrar todos los registros
export const getAllPersona = async (req, res) => {
    try{
        const persona = await personaModel.findAll()
        res.json(persona)
    }catch(error){
        res.json({message: error.message})
    }
}

//Mostrar un registro
export const getPersona = async (req, res) => {
    try{
        const persona = personaModel.findAll({
            where:{id:req.params.id}
        })
        res.json(persona)
    }catch(error){
        res.json({message: error.message})
    }
}

//Crear un registro
export const createPersona = async (req, res) => {
    try{
        await personaModel.create(req.body)
        res.json({
            message:"registro creado exitosamente"
        })
    }catch(error){
        res.json({message: error.message})
    }
}

//Actualizar un registro
export const updatePersona = async (req, res) => {
    try{
        await personaModel.update(req.body,{
            where:{id:req.params.id}
        })
        res.json({
            message:"registro actualizado exitosamente"
        })
    }catch(error){
        res.json({message: error.message})
    }
}

//Eliminar un registro
export const deletePersona = async (req, res) => {
    try{
        await personaModel.destroy({
            where:{id:req.params.id}
        })
        res.json({
            message:"registro eliminado exitosamente"
        })
    }catch(error){
        res.json({message: error.message})
    }
}