<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.Fornecedores"%>
<%@ page import="DAO.FornecedoresDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="Model.Produtos"%>
<%@ page import="DAO.ProdutosDAO"%>

<%
List<Fornecedores> lista; // Declara a lista
FornecedoresDAO dao = new FornecedoresDAO();
lista = dao.listaFornecedores(); // Atribui o resultado da busca à lista exibida no select
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<title>Cadastro de Produto</title>
<link rel="icon" href="img/2992655_click_computer_currency_dollar_money_icon.png">
<script src="scripts/buscaProduto.js"></script>
<link rel="stylesheet" href="style.css">
<style>
body {
  font-family: Arial, sans-serif;
  background-color: #f2f2f2;
  margin: 0;
  padding: 0;
}

#form-container {
  display: flex;
  justify-content: left;
  align-items: left;
  height: 100vh;
  margin-top: -240px;
}

form {
  width: 50%;
  background-color: #fff;
  padding: 20px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

label {
  display: block;
  margin-top: 10px;
}

input[type="text"],
select {
  width: 100%;
  padding: 8px;
  margin: 5px 0;
  border: 1px solid #ccc;
  border-radius: 3px;
}

input[type="submit"] {
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 3px;
  padding: 10px;
  cursor: pointer;
}

.input[type="submit"]:hover {
  background-color: #0056b3;
}
</style>
</head>
<body>
  <div id="form-container">
    <form name="cadastrarProduto" action="insert" method="post">
      <h2>Cadastro de Produtos</h2>
      <label for="descricao">Descrição:</label>
      <input type="text" id="descricao" name="descricao" required>

      <label for="quantidade">Quantidade em Estoque:</label>
      <input type="text" id="quantidade" name="qtd_estoque" required>

      <label for="preco_compra">Preço de Compra:</label>
      <input type="text" id="preco_compra" name="preco_de_compra" required>

      <label for="preco_venda">Preço de Venda:</label>
      <input type="text" id="preco_venda" name="preco_de_venda" required>

      <label for="fornecedor">Fornecedor:</label>
      <select name="fornecedorId">
        <option value="" selected>Selecione o fornecedor</option>
        <% for (Fornecedores fornecedor : lista) { %>
          <option value="<%=fornecedor.getId()%>"><%=fornecedor.getNome()%></option>
        <% } %>
      </select>

      <input type="submit" value="Cadastrar Produto">
    </form>
  </div>
</body>
</html>
