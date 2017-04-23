package ar.gaston.carmenSanDiego

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Villano {
	String nombre
	String sexo
    List <String> señasParticulares = new ArrayList<String>()
    List<String> hobbies = new ArrayList<String>()
    
    def void setVillano (String n, String s ){
    	
    	nombre = n;
    	sexo = s;
    }
    
    def nombreVillano(){
    	nombre
    }
    
    def void agregarSeña(String seña){
    	
    	señasParticulares.add(seña);
    }
    
    def void sacarSeña(String seña){
    	señasParticulares.remove(seña)
    }
    
    def void agregarHobbie (String h){
    	
    	hobbies.add(h);
    }
    
    def getHobbies(){
    	hobbies
    }
    
    def sacarHobbie(String h){
    	hobbies.remove(h)
    }
    
    def getSeñasParticulares(){
    	señasParticulares
    }
	
}