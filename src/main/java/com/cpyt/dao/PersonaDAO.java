/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cpyt.dao;

import static com.cpyt.dao.GenericDAO.sessionFactory;
import com.cpyt.model.Persona;
import com.cpyt.model.Tarjeta;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
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
        
        
    public static List<Object> listDocente() {

        Session session = sessionFactory.openSession();
        Query query = session.createSQLQuery("select * from persona where id_per in (select p.id_per from persona p inner join usuario u on p.id_per=u.id_per where u.id_rol=2) and estado=0");
        
        List results = query.list();
        return results;
    }
    
    public static List<Object> listAdm() {

        Session session = sessionFactory.openSession();
        Query query = session.createSQLQuery("select * from persona where id_per in (select p.id_per from persona p inner join usuario u on p.id_per=u.id_per where u.id_rol=1) and estado=0");
        
        List results = query.list();
        return results;
    }
    
    public void deletePersona(String idPer) {

        Session session = sessionFactory.openSession();
        Query query = session.createSQLQuery("update persona set estado=1 where id_per="+idPer);
        //query.setParameter(0, idPer);
        
        query.executeUpdate();
        Transaction tx = session.beginTransaction();
        tx.commit();
        session.close();
    }
    
    
    
    public static void main(String[] args) {
        
        List<Object> per = listDocente();
        
        for (int i = 0; i < per.size(); i++) {
            Object  a [] = (Object[]) per.get(i);      
                
            System.out.println(a[0]);           
            
        }
        int a = 23;
    }
}
