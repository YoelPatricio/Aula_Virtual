/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cpyt.dao;

import com.cpyt.model.Curso;
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
public class UsuarioDAO {
    
    static Session session = null;
    
    public static final SessionFactory sessionFactory;
	static {
		sessionFactory = new Configuration().configure().buildSessionFactory();
	}
        
        
    public static List<Object> getUserInSession(String user,String pass) {

        Session session = sessionFactory.openSession();
        Query query = session.createSQLQuery("select u.id_rol,p.nombres,p.apaterno,p.amaterno,p.id_per "
                                            + " from persona p inner join usuario u on p.id_per=u.id_per "
                                            + " where u.log_usu=? and u.pas_usu=?");
        query.setParameter(0, user);
        query.setParameter(1, pass);
        List results = query.list();
        return results;
    }
    
    
    public static void main(String[] args) {
        
        List<Object> per = getUserInSession("123","1253");
        
        for (int i = 0; i < per.size(); i++) {
            Object  a [] = (Object[]) per.get(i);      
                
            System.out.println(a[0]);           
            
        }
        int a = 23;
    }
}
