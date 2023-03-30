import express from 'express';
import { createPersona, getAllPersona, getPersona, updatePersona, deletePersona } from '../controllers/personaController.js';

const router = express.Router()

router.get('/', getAllPersona)
router.get('/:id', getPersona)
router.post('/', createPersona)
router.put('/:id', updatePersona)
router.delete('/:id', deletePersona)

export default router;