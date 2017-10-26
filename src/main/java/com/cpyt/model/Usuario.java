package com.cpyt.model;
// Generated 26/10/2017 01:18:47 AM by Hibernate Tools 4.3.1



/**
 * Usuario generated by hbm2java
 */
public class Usuario  implements java.io.Serializable {


     private Integer idUsu;
     private Persona persona;
     private Rol rol;
     private String logUsu;
     private String pasUsu;

    public Usuario() {
    }

    public Usuario(Persona persona, Rol rol, String logUsu, String pasUsu) {
       this.persona = persona;
       this.rol = rol;
       this.logUsu = logUsu;
       this.pasUsu = pasUsu;
    }
   
    public Integer getIdUsu() {
        return this.idUsu;
    }
    
    public void setIdUsu(Integer idUsu) {
        this.idUsu = idUsu;
    }
    public Persona getPersona() {
        return this.persona;
    }
    
    public void setPersona(Persona persona) {
        this.persona = persona;
    }
    public Rol getRol() {
        return this.rol;
    }
    
    public void setRol(Rol rol) {
        this.rol = rol;
    }
    public String getLogUsu() {
        return this.logUsu;
    }
    
    public void setLogUsu(String logUsu) {
        this.logUsu = logUsu;
    }
    public String getPasUsu() {
        return this.pasUsu;
    }
    
    public void setPasUsu(String pasUsu) {
        this.pasUsu = pasUsu;
    }




}


