<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<html>
<head>
<meta charset="utf-8">
<title>Editar Produto</title>
<link rel="icon"
	href="img/2992655_click_computer_currency_dollar_money_icon.png">
<link rel="stylesheet" href="style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

</head>

<body>
	<div id="form-container-cads">
		<form name="editar" action="update" method="post" class="form-control">
			<h2>Editar Produto</h2>
			<label for="Codigo Do Produto"  class="form-label">Codigo Do Produto:</label> <input
				type="text" class="form-control" name="id" id="id" readonly
				value="<%out.print(request.getAttribute("id"));%>"> <label
				for="descricao">Descrição:</label> <input type="text" id="descricao"
				name="descricao"
				value="<%out.print(request.getAttribute("descricao"));%>" required>
			<label for="quantidade">Quantidade em Estoque:</label> <input
				type="text" id="quantidade" name="qtd_estoque"
				value="<%out.print(request.getAttribute("qtd_estoque"));%>" required>
			<label for="preco_compra">Preço de Compra:</label> <input type="text"
				id="preco_compra" name="preco_de_compra"
				value="<%out.print(request.getAttribute("preco_de_compra"));%>"
				required> <label for="preco_venda">Preço de Venda:</label> <input
				type="text" id="preco_venda" name="preco_de_venda"
				value="<%out.print(request.getAttribute("preco_de_venda"));%>"
				required> <label for="fornecedor">Fornecedor:</label> <select
					name="for_id" >
					<option value="" selected>Selecione o fornecedor</option>
					<%
					for (Fornecedores fornecedor : lista) {
					%>
					<option value="<%=fornecedor.getId()%>"
						<%-- Verificar se o fornecedor atual é o selecionado --%>
                            <%String nomeFornecedorAtual = fornecedor.getNome();
                        Object forIdAttribute = request.getAttribute("for_id");
if (forIdAttribute != null && nomeFornecedorAtual.equals(forIdAttribute.toString())) {%>
						selected="selected" <%}%>>
						<%=nomeFornecedorAtual%>
					</option>
					<%
					}
					%>
				</select> <input type="submit" value="Salvar">

		</form>
	</div>
</body>
</html>
