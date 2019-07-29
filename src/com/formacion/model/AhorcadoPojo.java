package com.formacion.model;

import java.util.Arrays;

public class AhorcadoPojo {
	
	
	//TODO (Agosto) probar usando AJAX / usar contador de tiempo cliente js / conexion a bbdd con  tabla diccionario (buscar csv?)
	private final int INTENTOS_TOTALES = 7;
	public int intentoActual;
	
	private String palabraEscogida;
	public String palabraGuiones;
	public char[] letrasAcertadas;
	public String letrasPulsadas="";
	private String [] palabrasPosibles = {"Ipartek",
										 "listener",
										 "filtro",
										 "controlador",
										 "java",
										 "Tomcat",
										 "servlet",
										 "modelo",
										 "informatica",
										 "vista"};
	
	
	public String getLetrasPulsadas() {
		return letrasPulsadas;
	}

	public void setLetrasPulsadas(String letrasPulsadas) {
		this.letrasPulsadas = letrasPulsadas;
	}

	public AhorcadoPojo() {
		super();
		this.intentoActual = 1;
		this.palabraEscogida = palabrasPosibles[(int)(Math.random() * palabrasPosibles.length)].toUpperCase();
		establecerValores();
		
	}
	public void establecerValores() {
	
		this.palabraGuiones = getConguionesPrimera();
		this.letrasAcertadas = getConguionesPrimera().toCharArray();
		
	}
	
	public String getConguionesPrimera() {
		
		String palabraGuiones = "";
		
		// Relleno con guiones bajos lo que se mostrará al usuario al inicio
				// Se ira rellenando con los caracteres acertados
				for (int i = 0; i < palabraEscogida.length(); i++) {
					//palabraAcertadas[i] = '_';
					if(palabraEscogida.charAt(i) == ' ') {
						palabraGuiones += "  ";
					}else {
						palabraGuiones += "_ "; // Coloco espacios entre caracteres para que el usuario distinga cuantas letras tiene la palabra
					}
					
				} // TODO separar palabras si es compuesto
		
		return palabraGuiones;
	}
	
	public String getPalabraGuiones() {
		return palabraGuiones;
		
	}
	public void setPalabraGuiones(String palabraGuiones) {
		this.palabraGuiones = palabraGuiones;
	}
	public int getIntentoActual() {
		return intentoActual;
	}

	public void setIntentoActual(int intentoActual) {
		this.intentoActual = intentoActual;
	}

	public String[] getPalabrasPosibles() {
		return palabrasPosibles;
	}

	public void setPalabrasPosibles(String[] palabrasPosibles) {
		this.palabrasPosibles = palabrasPosibles;
	}

	public String getPalabraEscogida() {
		return palabraEscogida;
	}

	public void setPalabraEscogida(String palabraEscogida) {
		this.palabraEscogida = palabraEscogida;
	}

	public int getINTENTOS_TOTALES() {
		return INTENTOS_TOTALES;
	}
	
	
	
	public char[] getLetrasAcertadas() {
		return letrasAcertadas;
	}

	public void setLetrasAcertadas(char[] letrasAcertadas) {
		this.letrasAcertadas = letrasAcertadas;
	}

	@Override
	public String toString() {
		return "AhorcadoPojo [INTENTOS_TOTALES=" + INTENTOS_TOTALES + ", intentoActual=" + intentoActual
				+ ", palabrasPosibles=" + Arrays.toString(palabrasPosibles) + ", palabraEscogida=" + palabraEscogida
				+ "]";
	}
	
	
	
	

}
