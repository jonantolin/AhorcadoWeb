<%@page import="com.formacion.model.AhorcadoPojo"%>
<%@page import="org.apache.catalina.ant.SessionsTask"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<style>

	.tiempo{
		visibility: hidden;
	}
	.intentos{
		box-sizing: border;	
	}
	
	@media(max-width: 600px){
	
		img{
			width: 30%;
			height: auto;
		}
	
	}

	@media(min-width: 601px){
	
		img{
			width: 50%;
			height: auto;
		}
	
	}
	@media(min-width: 901px){
	
		img{
			width: 100%;
			height: auto;
		}
	
	}

	</style>

<jsp:include page="includes/header.jsp"></jsp:include>
  
  	<div class="jumbotron">
  		<h1 class="text-center">Ahorcado</h1>
  	</div>
  	
  	<div class="container-fluid">
  	
  		<div class="d-flex flex-column justify-content-center container rounded border shadow">
	  		<div class="row justify-content-around">
		  		<div id="intentos" class="text-center border border-success rounded m-2 p-2 col-12 col-md-3 align-middle intentos">
					<h4 id="intentoTitulo">Intento actual</h4>
			  		<h6 id="intento" class="m-1 p-2 box"><span id="actual">${intentoActual}</span>/<span id="iTotales">${INTENTOS_TOTALES }</span></h6>
			  		<span id="alerta">${perdido }</span>
			  		<% String intento = session.getAttribute("intentoActual").toString(); %>
			  		<%=(session.getAttribute("intentoActual") != null)?"<img id=\"imagen\" src=\"resources/img/"+intento+".png\">":"" %>
		  		</div>
		  		<div id="adivina" class="text-center m-2 p-2  col-12 col-md-5">
					<h4>Adivina la palabra</h4>
			  		<h2 id="oculta">${palabraOculta}</h2>
			  		
			  		
			  		<p>${volverJugar }</p>
		  		</div>
		  		<div class="d-none d-md-inline tiempo text-center m-2 p-2 border border-success rounded  col-12 col-md-3"> <!-- Usando AJAX lo hare mas adelante -->
					<h4>Tiempo</h4>
			  		<p>02:23</p>
			  		
		  		</div>
	  		</div>
	  		<div class="d-flex flex-row justify-content-center clearfix">
	  		<div class="float-left"> 
	  			<a class="btn mr-0 ml-1 my-1 p-2 col-2 col-md-1 <%=(session.getAttribute("letrasPulsadas").toString().indexOf("A") != -1 || session.getAttribute("perdido") != null )?"disabled btn-secondary":"btn-outline-primary" %>"  href="ahorcado?letra=a">A</a>
	  			<a class="btn mr-0 ml-1 my-1 p-2 col-2 col-md-1 <%=(session.getAttribute("letrasPulsadas").toString().indexOf("B") != -1 || session.getAttribute("perdido") != null )?"disabled btn-secondary":"btn-outline-primary" %>" href="ahorcado?letra=b">B</a>
	  			<a class="btn mr-0 ml-1 my-1 p-2 col-2 col-md-1 <%=(session.getAttribute("letrasPulsadas").toString().indexOf("C") != -1 || session.getAttribute("perdido") != null )?"disabled btn-secondary":"btn-outline-primary" %>" href="ahorcado?letra=c">C</a>
	  			<a class="btn mr-0 ml-1 my-1 p-2 col-2 col-md-1 <%=(session.getAttribute("letrasPulsadas").toString().indexOf("D") != -1 || session.getAttribute("perdido") != null )?"disabled btn-secondary":"btn-outline-primary" %>" href="ahorcado?letra=d">D</a>
	  		
	  			<a class="btn mr-0 ml-1 my-1 p-2 col-2 col-md-1 <%=(session.getAttribute("letrasPulsadas").toString().indexOf("E") != -1 || session.getAttribute("perdido") != null )?"disabled btn-secondary":"btn-outline-primary" %>" href="ahorcado?letra=e">E</a>
	  			<a class="btn mr-0 ml-1 my-1 p-2 col-2 col-md-1 <%=(session.getAttribute("letrasPulsadas").toString().indexOf("F") != -1 || session.getAttribute("perdido") != null )?"disabled btn-secondary":"btn-outline-primary" %>" href="ahorcado?letra=f">F</a>
	  			
	  			
	  			<a class="btn mr-0 ml-1 my-1 p-2 col-2 col-md-1 <%=(session.getAttribute("letrasPulsadas").toString().indexOf("G") != -1 || session.getAttribute("perdido") != null )?"disabled btn-secondary":"btn-outline-primary" %>" href="ahorcado?letra=g">G</a>
	  			<a class="btn mr-0 ml-1 my-1 p-2 col-2 col-md-1 <%=(session.getAttribute("letrasPulsadas").toString().indexOf("H") != -1 || session.getAttribute("perdido") != null )?"disabled btn-secondary":"btn-outline-primary" %>" href="ahorcado?letra=h">H</a>
	  		
	  			<a class="btn mr-0 ml-1 my-1 p-2 col-2 col-md-1 <%=(session.getAttribute("letrasPulsadas").toString().indexOf("I") != -1 || session.getAttribute("perdido") != null )?"disabled btn-secondary":"btn-outline-primary" %>" href="ahorcado?letra=i">I</a>
	  			<a class="btn mr-0 ml-1 my-1 p-2 col-2 col-md-1 <%=(session.getAttribute("letrasPulsadas").toString().indexOf("J") != -1 || session.getAttribute("perdido") != null )?"disabled btn-secondary":"btn-outline-primary" %>" href="ahorcado?letra=j">J</a>
	  			<a class="btn mr-0 ml-1 my-1 p-2 col-2 col-md-1 <%=(session.getAttribute("letrasPulsadas").toString().indexOf("K") != -1 || session.getAttribute("perdido") != null )?"disabled btn-secondary":"btn-outline-primary" %>" href="ahorcado?letra=k">K</a>
	  			
	  			<a class="btn mr-0 ml-1 my-1 p-2 col-2 col-md-1 <%=(session.getAttribute("letrasPulsadas").toString().indexOf("L") != -1 || session.getAttribute("perdido") != null )?"disabled btn-secondary":"btn-outline-primary" %>" href="ahorcado?letra=l">L</a>
	  		
	  			<a class="btn mr-0 ml-1 my-1 p-2 col-2 col-md-1 <%=(session.getAttribute("letrasPulsadas").toString().indexOf("M") != -1 || session.getAttribute("perdido") != null )?"disabled btn-secondary":"btn-outline-primary" %>" href="ahorcado?letra=m">M</a>
	  			
	  		
	  			<a class="btn mr-0 ml-1 my-1 p-2 col-2 col-md-1 <%=(session.getAttribute("letrasPulsadas").toString().indexOf("N") != -1 || session.getAttribute("perdido") != null )?"disabled btn-secondary":"btn-outline-primary" %>" href="ahorcado?letra=n">N</a>
	  			<a class="btn mr-0 ml-1 my-1 p-2 col-2 col-md-1 <%=(session.getAttribute("letrasPulsadas").toString().indexOf("Ñ") != -1 || session.getAttribute("perdido") != null )?"disabled btn-secondary":"btn-outline-primary" %>" href="ahorcado?letra=ñ">Ñ</a>
	  			<a class="btn mr-0 ml-1 my-1 p-2 col-2 col-md-1 <%=(session.getAttribute("letrasPulsadas").toString().indexOf("O") != -1 || session.getAttribute("perdido") != null )?"disabled btn-secondary":"btn-outline-primary" %>" href="ahorcado?letra=o">O</a>
	  			<a class="btn mr-0 ml-1 my-1 p-2 col-2 col-md-1 <%=(session.getAttribute("letrasPulsadas").toString().indexOf("P") != -1 || session.getAttribute("perdido") != null )?"disabled btn-secondary":"btn-outline-primary" %>" href="ahorcado?letra=p">P</a>
	  			
	  			<a class="btn mr-0 ml-1 my-1 p-2 col-2 col-md-1 <%=(session.getAttribute("letrasPulsadas").toString().indexOf("Q") != -1 || session.getAttribute("perdido") != null )?"disabled btn-secondary":"btn-outline-primary" %>" href="ahorcado?letra=q">Q</a>
	  			<a class="btn mr-0 ml-1 my-1 p-2 col-2 col-md-1 <%=(session.getAttribute("letrasPulsadas").toString().indexOf("R") != -1 || session.getAttribute("perdido") != null )?"disabled btn-secondary":"btn-outline-primary" %>" href="ahorcado?letra=r">R</a>
	  			<a class="btn mr-0 ml-1 my-1 p-2 col-2 col-md-1 <%=(session.getAttribute("letrasPulsadas").toString().indexOf("S") != -1 || session.getAttribute("perdido") != null )?"disabled btn-secondary":"btn-outline-primary" %>" href="ahorcado?letra=s">S</a>
	  			<a class="btn mr-0 ml-1 my-1 p-2 col-2 col-md-1 <%=(session.getAttribute("letrasPulsadas").toString().indexOf("T") != -1 || session.getAttribute("perdido") != null )?"disabled btn-secondary":"btn-outline-primary" %>" href="ahorcado?letra=t">T</a>
	  			<a class="btn mr-0 ml-1 my-1 p-2 col-2 col-md-1 <%=(session.getAttribute("letrasPulsadas").toString().indexOf("U") != -1 || session.getAttribute("perdido") != null )?"disabled btn-secondary":"btn-outline-primary" %>" href="ahorcado?letra=u">U</a>
	  		
	  			<a class="btn mr-0 ml-1 my-1 p-2 col-2 col-md-1 <%=(session.getAttribute("letrasPulsadas").toString().indexOf("V") != -1 || session.getAttribute("perdido") != null )?"disabled btn-secondary":"btn-outline-primary" %>" href="ahorcado?letra=v">V</a>
	  			<a class="btn mr-0 ml-1 my-1 p-2 col-2 col-md-1 <%=(session.getAttribute("letrasPulsadas").toString().indexOf("W") != -1 || session.getAttribute("perdido") != null )?"disabled btn-secondary":"btn-outline-primary" %>" href="ahorcado?letra=w">W</a>
	  			<a class="btn mr-0 ml-1 my-1 p-2 col-2 col-md-1 <%=(session.getAttribute("letrasPulsadas").toString().indexOf("X") != -1 || session.getAttribute("perdido") != null )?"disabled btn-secondary":"btn-outline-primary" %>" href="ahorcado?letra=x">X</a>
	  			<a class="btn mr-0 ml-1 my-1 p-2 col-2 col-md-1 <%=(session.getAttribute("letrasPulsadas").toString().indexOf("Y") != -1 || session.getAttribute("perdido") != null )?"disabled btn-secondary":"btn-outline-primary" %>" href="ahorcado?letra=y">Y</a>
	  			<a class="btn mr-0 ml-1 my-1 p-2 col-2 col-md-1 <%=(session.getAttribute("letrasPulsadas").toString().indexOf("Z") != -1 || session.getAttribute("perdido") != null )?"disabled btn-secondary":"btn-outline-primary" %>" href="ahorcado?letra=z">Z</a>
	  		</div>
	  	</div>
	  	</div>
    </div>

<% 

	intento = session.getAttribute("intentoActual").toString();
	if(intento.equals("Salvado") || intento.equals("Ahorcado")){ 
	
%>
	<script>
		
		document.getElementById("alerta").scrollIntoView();
		
		var actual = document.getElementById("actual").innerHTML;
		
		if(actual.indexOf("Salvado") != -1){
			document.getElementById("intentoTitulo").style.display = "none";
			document.getElementById("intento").innerHTML = "SALVADO";
			document.getElementById("intento").style.color = "#008000";
		}else{
			document.getElementById("intentoTitulo").style.display = "none";
			document.getElementById("intento").innerHTML = "AHORCADO";
			document.getElementById("intento").style.color = "#FF0000";
		}
		
		document.getElementById("intento").style.fontSize = "200%";
		
		document.getElementById("intento").scrollIntoView();

	</script>

<% }else{ %>

<script>
		var hOculta = document.getElementById("oculta");
		var oculta = document.getElementById("oculta").innerHTML;
		if(oculta.length > 18 && screen.width < 600 ){
			hOculta.style.fontSize = "80%";
		}
		document.getElementById("intentos").scrollIntoView();

	</script>
	

<% }%>	

<jsp:include page="includes/footer.jsp"></jsp:include>