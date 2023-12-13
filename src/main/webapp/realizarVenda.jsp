<html lang="pt-BR">
   <head>
    <title>Venda</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>    
<style>
    body {
        background: url('empreender-distribuidora-bebidas.jpeg') no-repeat center center fixed;
        background-size: cover;
        position: relative;
    }

    .form-container {
        background: rgba(255, 255, 255, 0.8); /* Adapte a opacidade conforme necessário */
        padding: 20px;
        margin-top: 50px; /* Ajuste conforme necessário */
        border-radius: 10px;
    }
    form-container input,
        .form-container select,
        .form-container textarea {
            border: none;
            border-radius: 0; /* Remover bordas arredondadas se necessário */
            box-shadow: none; /* Remover sombra se necessário */
        }
</style>
  
     <body class="bg-light">
        <main class="container d-flex h-auto d-inline-block">

        <form class=" needs-validation col-md-8 bg-light" novalidate>
            <div id="Cliente" class="">
                <div class="col-md-6">
                    <h2>Cliente</h2>
                    <label for="validationCustom01" class="form-label">Nome: </label>
                    <input type="text" class="form-control" id="nome" required>
                </div>
                <div class="col-md-6" >
                    <label for="validationCustom01" class="form-label">CPF: </label>
                    <input type="text" class="form-control" id="cpf" required>

                </div>
                <div class="col-md-6">
                    <label for="validationCustom01" class="form-label">Endereço: </label>
                    <input type="text" class="form-control" id="endereco" required>

                </div>
                <div class="col-md-2">
                    <label for="validationCustom01" class="form-label">N°: </label>
                    <input type="text" class="form-control" id="numero" required>

                </div>

        </div>
        <div id="Produto">

            <div>
                <h2>Produto</h2>
            </div>
                <div  class="col-md-3">
                    
                    <label for="validationCustom01" class="form-label">Codigo : </label>
                    <input type="text" class="form-control" id="id" required>

                </div>
                 
            <div class="col-md-7">
                    <label for="validationCustom01" class="form-label">Descrição: </label>
                    <input type="text" class="form-control" id="descricao" required>
                </div>
            <div  class="col-md-3">
                <label for="validationCustom01" class="form-label">Valor De Compra : </label>
                <input type="text" class="form-control" id="valor_de_compra" required>

            </div>
            <div class="col-md-3">
                <label for="validationCustom01" class="form-label">Valor De Venda: </label>
                <input type="text" class="form-control" id="valor_de_venda" required>
               
            </div>
            
            <div  class="col-md-1">
                <label for="validationCustom01" class="form-label">Quantidade: </label>
                <input type="number" class="form-control" id="quantidade" required>
                

            </div>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end col-md-20">
                    <button class="btn btn-primary me-md-2" type="button">Pagamento</button>
                    <button class="btn btn-primary me-md-2" type="button">Cancelar</button>
                    <button class="btn btn-primary me-md-2" type="button">Desconto</button>
                    
                </div>
                <button class="btn btn-primary me-md-2" type="button">Adicionar item</button>
             
        </div> 

        </form>
        <form class=" row g-3 needs-validation col-md-6">
            <div class="p-3 mb-2 bg-light">
              <h2 class="d-flex justify-content-center">Itens Da Venda</h2>
              <div>
              <table class="table table-dark table-hover">
                <thead>
                    <tr>
                     <th>Codigo</th>
                     <th>Data</th>
                     <th>Total</th>
                     <th>Lucro</th>
                     <th>Desconto</th>

                    </tr>
                </div>
                </thead>

              </table>
            
            </div>


        </form>
        
</main>
     </body>


   </head>



</html>