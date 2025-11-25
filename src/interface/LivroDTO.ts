export interface LivroDTO {
    titulo: string;
    autor: string;
    editora: string;
    ano_publicacao: number;
    principio_ativo: string;
    isbn: string;
    quant_total: number;
    quant_disponivel: number;
    valor_aquisicao: number;
    status_livro_emprestado: string;
}