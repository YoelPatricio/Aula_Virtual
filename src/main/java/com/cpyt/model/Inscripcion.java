package com.cpyt.model;
// Generated 26/10/2017 01:18:47 AM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Inscripcion generated by hbm2java
 */
public class Inscripcion  implements java.io.Serializable {


     private Integer idIns;
     private Curso curso;
     private Persona persona;
     private Date fecIns;
     private int estIns;
     private Set trabajoFinals = new HashSet(0);

    public Inscripcion() {
    }

	
    public Inscripcion(Curso curso, Persona persona, Date fecIns, int estIns) {
        this.curso = curso;
        this.persona = persona;
        this.fecIns = fecIns;
        this.estIns = estIns;
    }
    public Inscripcion(Curso curso, Persona persona, Date fecIns, int estIns, Set trabajoFinals) {
       this.curso = curso;
       this.persona = persona;
       this.fecIns = fecIns;
       this.estIns = estIns;
       this.trabajoFinals = trabajoFinals;
    }
   
    public Integer getIdIns() {
        return this.idIns;
    }
    
    public void setIdIns(Integer idIns) {
        this.idIns = idIns;
    }
    public Curso getCurso() {
        return this.curso;
    }
    
    public void setCurso(Curso curso) {
        this.curso = curso;
    }
    public Persona getPersona() {
        return this.persona;
    }
    
    public void setPersona(Persona persona) {
        this.persona = persona;
    }
    public Date getFecIns() {
        return this.fecIns;
    }
    
    public void setFecIns(Date fecIns) {
        this.fecIns = fecIns;
    }
    public int getEstIns() {
        return this.estIns;
    }
    
    public void setEstIns(int estIns) {
        this.estIns = estIns;
    }
    public Set getTrabajoFinals() {
        return this.trabajoFinals;
    }
    
    public void setTrabajoFinals(Set trabajoFinals) {
        this.trabajoFinals = trabajoFinals;
    }




}


