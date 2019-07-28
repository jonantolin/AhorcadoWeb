<jsp:include page="includes/header.jsp"></jsp:include>
<%@ page contentType="text/html; charset=UTF-8" %>

  	<div class="jumbotron">
  		<h1 class="text-center">Ahorcado</h1>
  	</div>
  	
  	<div class="container-fluid">
  	
  		<div class="d-flex flex-row justify-content-center container rounded border shadow w-75">
	  		<div class="d-flex flex-column">
		  		<div class="text-center">
			  		<h2>¿Sobrevivirás?</h2>
			  		<p>Selecciona número de jugadores</p>
		  		</div>
		  		<div class="mb-2 text-center">
					<a class="btn btn-outline-primary align-middle mt-1" href="ahorcado?jug=1"><i class="fas fa-user fa-x2 mr-2"></i>1 Jugador</a>
				  	<button type="button" class="btn btn-outline-danger align-middle mt-1" data-toggle="modal" data-target="#elegirPalabra">
		 			 <i class="fas fa-user-friends fa-x2 mr-2"></i>2 Jugadores
					</button>
		  		</div>
	  		</div>
	  		
	  	</div>
	  	
	  	<!-- Button trigger modal -->
		
		
		<!-- Modal -->
		<div class="modal fade" id="elegirPalabra" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="elegirPalabraLabel">Elige una palabra para que la resuelva tu compañero (que no te vea!)</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        Escríbela aquí abajo
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-warning" data-dismiss="modal">Volver</button>
		        
		        <form method="get" action="ahorcado">
		        	<input type="text" name="palabraEscogida" required placeholder="Escribe aquí..." pattern="[A-Za-zñÑ]+" title="Solo letras sin tildes">
		        	<input type="hidden" name="jug" value="2">
		        	<input type="submit" class="btn btn-success" value="Elegir y empezar">
		        </form>
		      </div>
		    </div>
		  </div>
		</div>
	  	
	  	
    </div>

<jsp:include page="includes/footer.jsp"></jsp:include>

