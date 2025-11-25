import { Router } from "express";
import type { Request, Response } from "express";
import LivroController from "./controller/LivrosController.js";

const router: Router = Router();

router.get("/api", (req: Request, res: Response) => {
    res.status(200).json({ mensagem: "Olá, seja bem-vindo a Biblioteca!" });
});

// LIVROS
router.get("/api/livros", LivroController.todos);
router.post("/api/livros", LivroController.novo);
router.get("/api/livros/:id", LivroController.livro);


export default router;
