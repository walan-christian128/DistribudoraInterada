package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProdutosDAO;
import Model.Fornecedores;
import Model.Produtos;

/**
 * Servlet implementation class produtosServer
 */
@WebServlet(urlPatterns = { "/produtoServer", "/main", "/insert", "/select", "/update" })
public class produtosServer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProdutosDAO dao = new ProdutosDAO();
	Produtos prod = new Produtos();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public produtosServer() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String action = request.getServletPath();
		System.out.println(action);

		if (action.equals("/main")) {
			listaPordutos(request, response);
		} else if (action.equals("/insert")) {
			listaPordutos(request, response);
		} else if (action.equals("/select")) {
			listandoProduto(request, response);
		} else if (action.equals("/update")) {
			EditarProdutos(request, response);

		}
	}

	private void listandoProduto(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idProduto = request.getParameter("id");
		try {
			prod.setId(Integer.parseInt(idProduto));

			dao.consultarProduto(prod);
			request.setAttribute("id", prod.getId());
			request.setAttribute("descricao", prod.getDescricao());
			request.setAttribute("qtd_estoque", prod.getQtd_estoque());
			request.setAttribute("preco_de_compra", prod.getPreco_de_compra());
			request.setAttribute("preco_de_venda", prod.getPreco_de_venda());
			request.setAttribute("for_id", prod.getFornecedor().getNome());
		} catch (Exception e) {
			// TODO: handle exception
		}

		RequestDispatcher rd = request.getRequestDispatcher("EditarProduto.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String descricao = request.getParameter("descricao");
		String qtdEstoque = request.getParameter("qtd_estoque");
		String precoCompra = request.getParameter("preco_de_compra");
		String precoVenda = request.getParameter("preco_de_venda");
		String fornecedorId = request.getParameter("for_id");
		doGet(request, response);
	}

	protected void listaPordutos(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String descricao = request.getParameter("descricao");
			String qtdEstoqueStr = request.getParameter("qtd_estoque");
			String idFornecedorStr = request.getParameter("fornecedor");
			String precoCompraStr = request.getParameter("preco_de_compra");
			String precoVendaStr = request.getParameter("preco_de_venda");

			if (descricao != null && qtdEstoqueStr != null && idFornecedorStr != null && precoCompraStr != null
					&& precoVendaStr != null) {

				int qtdEstoque = Integer.parseInt(qtdEstoqueStr);
				int idFornecedor = Integer.parseInt(idFornecedorStr);
				double precoCompra = Double.parseDouble(precoCompraStr);
				double precoVenda = Double.parseDouble(precoVendaStr);

				// Verifique se os valores são válidos (por exemplo, se os números são
				// positivos)

				if (qtdEstoque >= 0 && precoCompra >= 0 && precoVenda >= 0) {
					prod.setDescricao(descricao);

					Fornecedores fornecedor = new Fornecedores();
					fornecedor.setId(idFornecedor);
					prod.setFornecedor(fornecedor);
					prod.setQtd_estoque(qtdEstoque);
					prod.setPreco_de_compra(precoCompra);
					prod.setPreco_de_venda(precoVenda);

					dao.cadastrar(prod);
					response.sendRedirect("main.jsp");

				} else {

				}
			} else {

			}
		} catch (NumberFormatException e) {

		} catch (Exception e) {

		}
	}

	protected void EditarProdutos(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    try {
	        // Restante do código para setar os valores em "prod"
	        prod.setId(Integer.parseInt(request.getParameter("id")));
	        prod.setDescricao(request.getParameter("descricao"));

	        String qtdEstoqueStr = request.getParameter("qtd_estoque");
	        if (qtdEstoqueStr != null && !qtdEstoqueStr.isEmpty()) {
	            prod.setQtd_estoque(Integer.parseInt(qtdEstoqueStr));
	        }

	        String precoCompraStr = request.getParameter("preco_de_compra");
	        if (precoCompraStr != null && !precoCompraStr.isEmpty()) {
	            prod.setPreco_de_compra(Double.parseDouble(precoCompraStr));
	        }

	        String precoVendaStr = request.getParameter("preco_de_venda");
	        if (precoVendaStr != null && !precoVendaStr.isEmpty()) {
	            prod.setPreco_de_venda(Double.parseDouble(precoVendaStr));
	        }

	        String idFornecedorStr = request.getParameter("for_id");
	        if (idFornecedorStr != null && !idFornecedorStr.isEmpty()) {
	            Fornecedores f = new Fornecedores();
	            f.setId(Integer.parseInt(idFornecedorStr));
	            prod.setFornecedor(f);
	        } else {
	            prod.setFornecedor(null);
	        }

	        dao.alterarProdutos(prod);
	    } catch (NumberFormatException e) {
	        // Lide com o caso em que há um problema de formato numérico
	        System.out.println("Erro de formato numérico: " + e.getMessage());
	        e.printStackTrace();
	    } catch (Exception e) {
	        // Lide com outras exceções não previstas
	        System.out.println("Erro não previsto: " + e.getMessage());
	        e.printStackTrace();
	    }

	    RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
	    rd.forward(request, response);
	}


}
