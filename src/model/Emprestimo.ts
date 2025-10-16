import Aluno from "./Aluno.js";
import Livro from "./Livro.js";

class Emprestimo {
    private aluno: Aluno;
    private livro: Livro;
    private dataEmprestimo: Date;
    private dataDevolucao: Date | null;
    private statusEmprestimo: string;

    constructor(
        _aluno: Aluno,
        _livro: Livro,
        _dataEmprestimo: Date,
        _dataDevolucao: Date | null,
        _statusEmprestimo: string
    ) {
        this.aluno = _aluno;
        this.livro = _livro;
        this.dataEmprestimo = _dataEmprestimo;
        this.dataDevolucao = _dataDevolucao;
        this.statusEmprestimo = _statusEmprestimo;
    }

    public getAluno(): Aluno {
        return this.aluno;
    }

    public getLivro(): Livro {
        return this.livro;
    }

    public getDataEmprestimo(): Date {
        return this.dataEmprestimo;
    }

    public getDataDevolucao(): Date | null {
        return this.dataDevolucao;
    }

    public getStatusEmprestimo(): string {
        return this.statusEmprestimo;
    }

    public setAluno(aluno: Aluno): void {
        this.aluno = aluno;
    }

    public setLivro(livro: Livro): void {
        this.livro = livro;
    }

    public setDataEmprestimo(dataEmprestimo: Date): void {
        this.dataEmprestimo = dataEmprestimo;
    }

    public setDataDevolucao(dataDevolucao: Date | null): void {
        this.dataDevolucao = dataDevolucao;
    }

    public setStatusEmprestimo(statusEmprestimo: string): void {
        this.statusEmprestimo = statusEmprestimo;
    }
}

export default Emprestimo;
