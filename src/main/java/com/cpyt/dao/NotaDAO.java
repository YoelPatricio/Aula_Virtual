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
public class NotaDAO {
    
    static Session session = null;
    
    public static final SessionFactory sessionFactory;
	static {
		sessionFactory = new Configuration().configure().buildSessionFactory();
	}
        
        
    
    
    public void subirNota(Integer idTra,Integer nota) {

        Session session = sessionFactory.openSession();
        Query query = session.createSQLQuery("update trabajo_final set not_tra=? where id_tra=?");
        query.setParameter(0, nota);
        query.setParameter(1, idTra);
        
        query.executeUpdate();
        Transaction tx = session.beginTransaction();
        tx.commit();
        session.close();
    }
    
    public void cursoConcluido(Integer idTra,Integer nota) {

        Session session = sessionFactory.openSession();
        Query query = session.createSQLQuery("update trabajo_final set not_tra=? where id_tra=?");
        query.setParameter(0, nota);
        query.setParameter(1, idTra);
        
        query.executeUpdate();
        Transaction tx = session.beginTransaction();
        tx.commit();
        session.close();
    }
    
    
    
    
    
   
}
