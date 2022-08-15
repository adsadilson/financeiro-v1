package br.com.apss.financeiro.util.jsf;

import javax.faces.context.FacesContext;

public class SistemaUtil {
	
	public static boolean isWindows() {
		return System.getProperty("os.name").toUpperCase().contains("WINDOWS");
	}
	
	public static String pathRelatorio() {
		if (SistemaUtil.isWindows()) {
			return "/relatorios";
		}else {
			return "/usr/local/tomcat/webapps/financeiro/WEB-INF/classes/relatorios";
		}
	}
	
	public static String pathImagem() {
		if (SistemaUtil.isWindows()) {
			String caminho = FacesContext.getCurrentInstance().getExternalContext().getRealPath("/WEB-INF/classes/relatorios/");
			return caminho;
		}else {
			return "/usr/local/tomcat/webapps/financeiro/WEB-INF/classes/relatorios/";
		}
	}
	
	public static String pathProperties() {
		if (SistemaUtil.isWindows()) {
			String caminho = FacesContext.getCurrentInstance().getExternalContext().getRealPath("/WEB-INF/classes/META-INF/");
			return caminho;
		}else {
			return "/usr/local/tomcat/webapps/financeiro/WEB-INF/classes/META-INF/";
		}
	}
	
	
}
