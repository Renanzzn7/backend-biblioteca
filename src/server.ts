import express from 'express';
import cors from 'cors';
import routes from './routes.js'; // extensão .js obrigatória com ES Modules

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());
app.use(routes);

app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});
