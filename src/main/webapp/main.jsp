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

<%
List<Produtos> prodp; // Declara a lista
ProdutosDAO daop = new ProdutosDAO();
prodp = daop.listarProdutos(); // Atribui o resultado da busca à lista exibida na tabela
%>
<%
Produtos produtos = new Produtos();
%>

<%
List<Fornecedores> prodop; // Declara a lista
ProdutosDAO proddao = new ProdutosDAO();
prodop = proddao.nomeFonecedorProduto(produtos.getId());
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<title>Inicio</title>
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

#container {
  display: flex;
  flex-direction: column;
  padding: 10px;
  background-color: #fff;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

#form-container {
  padding: 20px;
}

#tables-container {
  display: flex;
  justify-content: space-between;
}

#table-container,
#table-vendas {
  flex: 1;
  border: 1px solid #ccc;
  padding: 10px;
}

#table-container table,
#table-vendas table {
  width: 100%;
  border-collapse: collapse;
}

#table-container th,
#table-container td,
#table-vendas th,
#table-vendas td {
  border: 1px solid #ddd;
  padding: 8px;
  text-align: left;
}

#table-container th {
  background-color: #007bff;
  color: floralwhite;
}

.button3,
.button4 {
  text-decoration: none;
  padding: 5px 10px;
  border-radius: 3px;
  color: #fff;
  cursor: pointer;
  display: inline-block;
}

.button3 {
  background-color: #007bff;
  margin-right: 10px;
}

.button4 {
  background-color: #dc3545;
  margin-right: 10px;
  margin: 10px 0px;
}

.button3:hover,
.button4:hover {
  background-color: #218838;
}
</style>
</head>
<body>
  
    <div id="tables-container">
      <div id="table-container">
        <table>
          <thead>
            <tr>
              <th>Codigo</th>
              <th>Decrição</th>
              <th>Quantidade em estoque</th>
              <th>Preço de compra</th>
              <th>Preço de venda</th>
              <th>Margem</th>
              <th>Fornecedor</th>
              <th>Opções</th>
            </tr>
          </thead>
          <tbody>
            <%
            for (Produtos produto : prodp) {
            %>
            <tr id="row<%=produto.getId()%>" class="linha-editar"
              data-id="<%=produto.getId()%>">
              <td><%=produto.getId()%></td>
              <td><%=produto.getDescricao()%></td>
              <td><%=produto.getQtd_estoque()%></td>
              <td><%=produto.getPreco_de_compra()%></td>
              <td><%=produto.getPreco_de_venda()%></td>
              <td><script>
                var precoCompra = <%=produto.getPreco_de_compra()%>;
                var precoVenda = <%=produto.getPreco_de_venda()%>;
                var porcentagem = ((precoVenda - precoCompra) / precoCompra) * 100;
                var porcentagemArredondada = porcentagem.toFixed(2);
                document.write(porcentagemArredondada + '%');
              </script></td>
              <td>
                <%
                for (Fornecedores fornecedor : lista) {
                  if (fornecedor.getId() == produto.getFornecedor().getId()) {
                %>
                <%=fornecedor.getNome()%>
                <%
                 }
                }
                %>
              </td>
              <td><a href="select?id=<%=produto.getId()%>" class="button3">Editar</a>
                <a href="apagar?id=<%=produto.getId()%>" class="button4">Apagar</a>
              </td>
            </tr>
            <%
            }
            %>
          </tbody>
        </table>
      </div>
      <div id="table-vendas">
        <table>
          <thead>
            <tr>
              <th>Codigo</th>
              <th>Data</th>
              <th>Total</th>
              <th>Lucro</th>
              <th>Desconto</th>
            </tr>
          </thead>
          <tbody>
            <!-- Adicione os dados da tabela de vendas conforme necessário -->
          </tbody>
        </table>
      </div>
    </div>
  </div>
</body>
</html>
