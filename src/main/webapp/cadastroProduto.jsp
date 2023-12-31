<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.Fornecedores"%>
<%@ page import="DAO.FornecedoresDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="Model.Produtos"%>
<%@ page import="DAO.ProdutosDAO"%>

<%
List<Fornecedores> lista;
FornecedoresDAO dao = new FornecedoresDAO();
lista = dao.listaFornecedores();
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Cadastro de Produto</title>
    <link rel="icon" href="img/2992655_click_computer_currency_dollar_money_icon.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
          crossorigin="anonymous">
   
</head>
<body>
<div id="form-container" class="container">
    <form name="cadastrarProduto" action="insert">
        <h2>Cadastro de Produtos</h2>

        <div class="mb-3">
            <label for="descricao" class="form-label">Descrição:</label>
            <input type="text" id="descricao" class="form-control" name="descricao" required>
        </div>

        <div class="mb-3">
            <label for="quantidade" class="form-label">Quantidade em Estoque:</label>
            <input type="text" id="quantidade" class="form-control" name="qtd_estoque" required>
        </div>

        <div class="mb-3">
            <label for="preco_compra" class="form-label">Preço de Compra:</label>
            <input type="text" id="preco_compra"  class="form-control" name="preco_de_compra" required>
        </div>

        <div class="mb-3">
            <label for="preco_venda" class="form-label">Preço de Venda:</label>
            <input type="text" class="form-control" id="preco_venda" name="preco_de_venda">
        </div>

        <div class="mb-3">
            <label for="fornecedor" class="form-label">Fornecedor:</label>
            <select name="for_id" class="form-select">
                <option value="" selected>Selecione o fornecedor</option>

                <%
                String forIdAttribute = (String) request.getAttribute("for_id");

                for (Fornecedores fornecedor : lista) {
                    int fornecedorId = fornecedor.getId();
                    String nomeFornecedorAtual = fornecedor.getNome();
                    boolean isSelected = (forIdAttribute != null && nomeFornecedorAtual.equals(forIdAttribute));

                %>
                <option value="<%= fornecedorId %>" <%= isSelected ? "selected" : "" %>>
                    <%= nomeFornecedorAtual %>
                </option>
                <%
                }
                %>
            </select>
        </div>

        <input type="submit" value="Cadastrar Produto" class="btn btn-primary">
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-b0Lfl5RvbR2RzVa+J4MK93mr1Y8yRXYi0D2r6NV5pOVaCxcHw1V9Af2pdPv/2a7+"
        crossorigin="anonymous"></script>
</body>
</html>
