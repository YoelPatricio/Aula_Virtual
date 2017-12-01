/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cpyt.dao;

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
public class CursoDAO {
    
    static Session session = null;
    
    public static final SessionFactory sessionFactory;
	static {
		sessionFactory = new Configuration().configure().buildSessionFactory();
	}
        
        
    public static List<Object> listCurso() {

        Session session = sessionFactory.openSession();
        Query query = session.createSQLQuery("select c.id_cur,p.apaterno,p.amaterno,p.nombres,c.nom_cur,c.des_cur,c.pre_cur,c.tra_cur,c.id_per from curso c inner join persona p on c.id_per=p.id_per where c.estado=0");
        
        List results = query.list();
        return results;
    }
    
    public void deleteCurso(String idCur) {

        Session session = sessionFactory.openSession();
        Query query = session.createSQLQuery("update curso set estado=1 where id_per="+idCur);
        //query.setParameter(0, idPer);
        
        query.executeUpdate();
        Transaction tx = session.beginTransaction();
        tx.commit();
        session.close();
    }
    
    
    
    public static void main(String[] args) {
        
        List<Object> per = listCurso();
        
        for (int i = 0; i < per.size(); i++) {
            Object  a [] = (Object[]) per.get(i);      
                
            System.out.println(a[0]);           
            
        }
        int a = 23;
    }
}
