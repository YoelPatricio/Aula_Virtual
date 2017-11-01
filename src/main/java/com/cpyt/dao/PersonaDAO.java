/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cpyt.dao;

import static com.cpyt.dao.GenericDAO.sessionFactory;
import com.cpyt.model.Tarjeta;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author limati
 */
public class PersonaDAO {
    
    static Session session = null;
    
    public static final SessionFactory sessionFactory;
	static {
		sessionFactory = new Configuration().configure().buildSessionFactory();
	}
        
        
    public List<PersonaDAO> listPersona() {

        Session session = sessionFactory.openSession();
        Query query = session.createQuery("from Persona");
        
        List results = query.list();
        return results;
    }
}
