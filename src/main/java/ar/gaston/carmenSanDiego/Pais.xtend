package ar.gaston.carmenSanDiego

import java.util.ArrayList
import java.util.List
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.UserException
import java.util.Arrays

@Accessors
@Observable
class Pais {
	int id
	String nombrePais
	List <String> caracteristicasDelPais = new ArrayList<String>()
	List <Pais> paisConexiones = new ArrayList<Pais>()
	List<LugarDeInteres> lugaresDeInteres= new ArrayList<LugarDeInteres>() //limite son 3 lugares sin repetidos
	
	new(){}
	
	new(String nombre, int id)
	{
		this.nombrePais = nombre
		this.id = id
	}
	def void setNombrePais(String n){
		nombrePais= n
	}
	def getNombrePais(){
		nombrePais
	}
	
	
	def void agregarCaracteristica(String c){
		caracteristicasDelPais.add(c)
	}
	
	def List <String> getCaracteristicasDelPais(){	
		caracteristicasDelPais
		
	}
	
	def sacarCaracteristica(String c){
		caracteristicasDelPais.remove(c)
		
	}
	
	def void agregarPaisConexion(Pais p){
		paisConexiones.add(p)
	}
	
	def sacarPaisConexion(Pais p){
		paisConexiones.remove(p)
	}
	
	def List <Pais> getPaisConexion(){	
		paisConexiones
		
	}
	def equals(LugarDeInteres l1, LugarDeInteres l2){
		return l1.nombreLugar == l2.nombreLugar
	}
	def void agregarLugarDeInteres(LugarDeInteres l){
		if (!lugaresDeInteres.contains(l) && lugaresDeInteres.size <= 2 ){
			lugaresDeInteres.add(l)
		}
		else{
			if(lugaresDeInteres.contains(l)){
				throw new UserException("Error el lugar de interes "+ l.nombreLugar+ " ya esta en la lista" )
			}
			else
		        {
		        throw new UserException("Los lugares de interes deben ser Exactamente 3")	
	            }
		}
	
	}
	def sacarLugarDeInteres(LugarDeInteres l){
		lugaresDeInteres.remove(l)
	}       
	       
// 	def List <LugarDeInteres> getlugaresDeInteres(){	
//		lugaresDeInteres
//		
//	}
	
	def LugarDeInteres getPrimerLugarDeInteres(){
		return lugaresDeInteres.get(0)
	}
	
	def LugarDeInteres getSegundoLugarDeInteres(){
		return lugaresDeInteres.get(1)
	}
	
	def LugarDeInteres getTercerLugarDeInteres(){
		return lugaresDeInteres.get(2)
	}
	       
	def setearCasoAlugares(Caso caso) {
		for( LugarDeInteres l: lugaresDeInteres){
				l.setearCaso(caso)
			}
	}
	
	def getId() {
		id
	}
	def procesarLugar(String lugar)
	{
		for(LugarDeInteres l : lugaresDeInteres)
		{
			if(l.nombreLugar == lugar)
			{
				return l.devolverPista
			}
		}
	}
	def lugarPosible(String s){
		if(s == "Embajada"){
			return new Embajada
		}
		else{
			if(s == "Club"){
				return new Club
			}
			else{
				if(s == "Banco"){
					return new Banco
				}
				else{
					return new Biblioteca
				}
			}
		}
	}
	
	def modificarLugares(List<String> strings) {
		var ArrayList<LugarDeInteres> ls = new ArrayList<LugarDeInteres>
		for(String s : strings){
			print(s)
			print(this.lugarPosible(s).nombreLugar)			
			ls.add(this.lugarPosible(s))
		}
		if(ls.size()== 3){
			this.lugaresDeInteres = ls
		}
		else{
			throw new UserException("Los lugares de interes deben ser exactamente 3")
		}
	}
		
	
	
}

