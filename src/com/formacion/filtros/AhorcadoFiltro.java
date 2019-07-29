package com.formacion.filtros;

import java.io.IOException;
import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Filtro que controla que no se pueda acceder al panel de juego sin antes haber elegido jugador
 */
@WebFilter(
		dispatcherTypes = {
				DispatcherType.REQUEST, 
				DispatcherType.FORWARD, 
				DispatcherType.INCLUDE, 
				DispatcherType.ERROR
		}
					, 
		urlPatterns = { 
				"/ahorcado", 
				"/panel-juego/*"
		})
public class AhorcadoFiltro implements Filter {

    /**
     * Default constructor. 
     */
    public AhorcadoFiltro() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		
		
		HttpSession session = req.getSession();
		String jugadorActivo = request.getParameter("jug");
		
		if(jugadorActivo != null) {
			session.setAttribute("jugadorActivo", jugadorActivo);
			chain.doFilter(request, response);
			
		}else if(session.getAttribute("jugadorActivo") != null){
		
		chain.doFilter(request, response);
		
		}else {
			session.invalidate();
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
