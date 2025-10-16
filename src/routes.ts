import { Router } from 'express';
import type { Request, Response } from 'express';
import Aluno from './model/Aluno.js'; // extensão .js obrigatória

const routes = Router();

let alunos: Aluno[] = [];

routes.get('/', (req: Request, res: Response) => {
  res.send('API Biblioteca funcionando!');
});

routes.post('/alunos', (req: Request, res: Response) => {
  const { ra, nome, sobrenome, dataNascimento, endereco, email, celular } = req.body;

  const novoAluno = new Aluno(
    ra,
    nome,
    sobrenome,
    new Date(dataNascimento),
    endereco,
    email,
    celular
  );

  alunos.push(novoAluno);
  return res.status(201).json({ message: 'Aluno cadastrado com sucesso!', aluno: novoAluno });
});

routes.get('/alunos', (req: Request, res: Response) => {
  return res.json(alunos);
});

export default routes;

