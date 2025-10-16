class Aluno {
    private ra: string;
    private nome: string;
    private sobrenome: string;
    private dataNascimento: Date;
    private endereco: string;
    private email: string;
    private celular: number;

    constructor(
        _ra: string,
        _nome: string,
        _sobrenome: string,
        _dataNascimento: Date,
        _endereco: string,
        _email: string,
        _celular: number
    ) {
        this.ra = _ra;
        this.nome = _nome;
        this.sobrenome = _sobrenome;
        this.dataNascimento = _dataNascimento;
        this.endereco = _endereco;
        this.email = _email;
        this.celular = _celular;
    }

    public getRa(): string {
        return this.ra;
    }

    public getNome(): string {
        return this.nome;
    }

    public getSobrenome(): string {
        return this.sobrenome;
    }

    public getDataNascimento(): Date {
        return this.dataNascimento;
    }

    public getEndereco(): string {
        return this.endereco;
    }

    public getEmail(): string {
        return this.email;
    }

    public getCelular(): number {
        return this.celular;
    }

    public setRa(ra: string): void {
        this.ra = ra;
    }

    public setNome(nome: string): void {
        this.nome = nome;
    }

    public setSobrenome(sobrenome: string): void {
        this.sobrenome = sobrenome;
    }

    public setDataNascimento(dataNascimento: Date): void {
        this.dataNascimento = dataNascimento;
    }

    public setEndereco(endereco: string): void {
        this.endereco = endereco;
    }

    public setEmail(email: string): void {
        this.email = email;
    }

    public setCelular(celular: number): void {
        this.celular = celular;
    }
}

export default Aluno;