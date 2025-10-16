class Livro {
    private titulo: string;
    private autor: string;
    private editora: string;
    private anoPublicacao: string;
    private isbn: string;
    private quantTotal: number;
    private quantDisponivel: number;
    private valorAquisicao: number;
    private statusLivroEmprestado: string;

    constructor(
        _titulo: string,
        _autor: string,
        _editora: string,
        _anoPublicacao: string,
        _isbn: string,
        _quantTotal: number,
        _quantDisponivel: number,
        _valorAquisicao: number,
        _statusLivroEmprestado: string
    ) {
        this.titulo = _titulo;
        this.autor = _autor;
        this.editora = _editora;
        this.anoPublicacao = _anoPublicacao;
        this.isbn = _isbn;
        this.quantTotal = _quantTotal;
        this.quantDisponivel = _quantDisponivel;
        this.valorAquisicao = _valorAquisicao;
        this.statusLivroEmprestado = _statusLivroEmprestado;
    }

    public getTitulo(): string {
        return this.titulo;
    }

    public getAutor(): string {
        return this.autor;
    }

    public getEditora(): string {
        return this.editora;
    }

    public getAnoPublicacao(): string {
        return this.anoPublicacao;
    }

    public getIsbn(): string {
        return this.isbn;
    }

    public getQuantTotal(): number {
        return this.quantTotal;
    }

    public getQuantDisponivel(): number {
        return this.quantDisponivel;
    }

    public getValorAquisicao(): number {
        return this.valorAquisicao;
    }

    public getStatusLivroEmprestado(): string {
        return this.statusLivroEmprestado;
    }

    public setTitulo(titulo: string): void {
        this.titulo = titulo;
    }

    public setAutor(autor: string): void {
        this.autor = autor;
    }

    public setEditora(editora: string): void {
        this.editora = editora;
    }

    public setAnoPublicacao(anoPublicacao: string): void {
        this.anoPublicacao = anoPublicacao;
    }

    public setIsbn(isbn: string): void {
        this.isbn = isbn;
    }

    public setQuantTotal(quantTotal: number): void {
        this.quantTotal = quantTotal;
    }

    public setQuantDisponivel(quantDisponivel: number): void {
        this.quantDisponivel = quantDisponivel;
    }

    public setValorAquisicao(valorAquisicao: number): void {
        this.valorAquisicao = valorAquisicao;
    }

    public setStatusLivroEmprestado(statusLivroEmprestado: string): void {
        this.statusLivroEmprestado = statusLivroEmprestado;
    }
}

export default Livro;
