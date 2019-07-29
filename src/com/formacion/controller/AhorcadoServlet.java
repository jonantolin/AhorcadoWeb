package com.formacion.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.formacion.model.AhorcadoPojo;

/**
 * Servlet implementation class AhorcadoServlet
 */
@WebServlet("/ahorcado")
public class AhorcadoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public AhorcadoServlet() {
        super();
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String nuevo = request.getParameter("nuevo");
		
		if(nuevo != null) {
			
			request.getSession().invalidate();
			request.getRequestDispatcher("/index.jsp").forward(request, response);
				
		}else {
			
			String jugadores = request.getParameter("jug");
			String letraIntroducida = request.getParameter("letra");
			
			
			HttpSession session = request.getSession();
			
			session.setAttribute("letrasPulsadas", "");
			
			//Se invocara y establecera en el listener (al crearse una sesion)
			AhorcadoPojo ahorcadoDatos = (AhorcadoPojo) session.getAttribute("ahorcadoDatos");
			
			
			if(letraIntroducida == null) { // El momento de empezar (solo pasara 1 vez)
				
				if("1".equals(jugadores)) {		
					
					session.setAttribute("intentoActual", ahorcadoDatos.getIntentoActual());
					session.setAttribute("INTENTOS_TOTALES", ahorcadoDatos.getINTENTOS_TOTALES());
					session.setAttribute("palabraOculta", ahorcadoDatos.getPalabraGuiones());
	
					
				}else if("2".equals(jugadores)) {
					
					session.setAttribute("intentoActual", ahorcadoDatos.getIntentoActual());
					session.setAttribute("INTENTOS_TOTALES", ahorcadoDatos.getINTENTOS_TOTALES());
					String palabraEscogida = request.getParameter("palabraEscogida");
					
					if(palabraEscogida != null) {
						palabraEscogida = palabraEscogida.toUpperCase();
					}
					
					ahorcadoDatos.setPalabraEscogida(palabraEscogida);
					ahorcadoDatos.establecerValores();
					session.setAttribute("palabraOculta", ahorcadoDatos.getPalabraGuiones());
				}
				
			}else {
				
				letraIntroducida = letraIntroducida.toUpperCase();
				char cLetraIntroducida = letraIntroducida.charAt(0);
				ahorcadoDatos.setLetrasPulsadas(ahorcadoDatos.getLetrasPulsadas() + letraIntroducida);
				session.setAttribute("elegida", letraIntroducida);
				int posicion = ahorcadoDatos.getPalabraEscogida().indexOf(cLetraIntroducida);
				
				
				char [] letrasAcertadas = ahorcadoDatos.getLetrasAcertadas();
				String palabraMedioResuelta = "";
				
				if(posicion != -1) {
		
					String palabraEscogida = ahorcadoDatos.getPalabraEscogida();
					
					for (int i = 0; i < palabraEscogida.length(); i++) {
						
						if(palabraEscogida.charAt(i) == cLetraIntroducida ) {
							letrasAcertadas[i*2]  = cLetraIntroducida;
							
						}	
					}
					
					for (int i = 0; i < letrasAcertadas.length; i++) {
						palabraMedioResuelta += letrasAcertadas[i];
					}

					ahorcadoDatos.setPalabraGuiones(palabraMedioResuelta);
					ahorcadoDatos.setLetrasAcertadas(letrasAcertadas);
					
					
				}else{
					
					ahorcadoDatos.setIntentoActual(ahorcadoDatos.getIntentoActual() + 1);
				}
				
				
				ahorcadoDatos.setLetrasAcertadas(letrasAcertadas);
				
				
				//Comprobaciones GANA - CONTINUA - PIERDE

				if(!ahorcadoDatos.getPalabraGuiones().contains("_")) {
					
					session.setAttribute("intentoActual", "Salvado");
					session.setAttribute("perdido", new Alert("success", "<b>ENHORABUENA</b> has sobrevivido!!"));
					session.setAttribute("volverJugar", "<a class=\"btn btn-info\" href=\"ahorcado?nuevo=1\">Volver a jugar</a>");
					
					
				}else if(ahorcadoDatos.getIntentoActual() <=  ahorcadoDatos.getINTENTOS_TOTALES()) {
					
					session.setAttribute("intentoActual", ahorcadoDatos.getIntentoActual());
					
				}else {
					
					session.setAttribute("perdido",new Alert("danger", "Has muerto, la palabra era: <b>"+ahorcadoDatos.getPalabraEscogida()+"</b>"));
					session.setAttribute("volverJugar", "<a class=\"btn btn-info\" href=\"ahorcado?nuevo=1\">Volver a jugar</a>");
					session.setAttribute("intentoActual", "Ahorcado");	
				}
				
				
				session.setAttribute("palabraOculta", ahorcadoDatos.getPalabraGuiones());
				session.setAttribute("letrasPulsadas", ahorcadoDatos.getLetrasPulsadas());
				
			}
		
		request.getRequestDispatcher("formujuego.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
