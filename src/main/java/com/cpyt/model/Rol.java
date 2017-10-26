package com.cpyt.model;
// Generated 26/10/2017 01:18:47 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Rol generated by hbm2java
 */
public class Rol  implements java.io.Serializable {


     private Integer idRol;
     private String nomRol;
     private Set usuarios = new HashSet(0);

    public Rol() {
    }

	
    public Rol(String nomRol) {
        this.nomRol = nomRol;
    }
    public Rol(String nomRol, Set usuarios) {
       this.nomRol = nomRol;
       this.usuarios = usuarios;
    }
   
    public Integer getIdRol() {
        return this.idRol;
    }
    
    public void setIdRol(Integer idRol) {
        this.idRol = idRol;
    }
    public String getNomRol() {
        return this.nomRol;
    }
    
    public void setNomRol(String nomRol) {
        this.nomRol = nomRol;
    }
    public Set getUsuarios() {
        return this.usuarios;
    }
    
    public void setUsuarios(Set usuarios) {
        this.usuarios = usuarios;
    }




}


