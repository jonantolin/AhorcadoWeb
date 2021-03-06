package com.formacion.controller;

public class Alert {
	
	private String tipo;
	private String texto;
	
	public Alert(String tipo, String texto) {
		super();
		this.tipo = tipo;
		this.texto = texto;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getTexto() {
		return texto;
	}

	public void setTexto(String texto) {
		this.texto = texto;
	}
	
	
	/**
	 * @return String div con la alerta con tipo y texto
	 */
	public String toString() { 
		
		String alertaCompleta;
		
		alertaCompleta = "<div class=\"alert alert-"+getTipo()+"\" role=\"alert\">"+getTexto()+"</div>";
		
		return alertaCompleta;
			
	}


}
