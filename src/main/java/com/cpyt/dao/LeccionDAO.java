/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cpyt.dao;

import static com.cpyt.dao.CursoDAO.sessionFactory;
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
public class LeccionDAO {
    
    static Session session = null;
    
    public static final SessionFactory sessionFactory;
	static {
		sessionFactory = new Configuration().configure().buildSessionFactory();
	}
        
        
    public static List<Object> listLeccion(Integer idCur) {

        Session session = sessionFactory.openSession();
        Query query = session.createSQLQuery("select l.id_lec,c.nom_cur,l.nom_lec,l.vid_lec,l.arc_lec from lecciones l inner join curso c on l.id_cur=c.id_cur where l.estado=0 and l.id_cur="+idCur+" order by l.id_lec asc");
        
        List results = query.list();
        return results;
    }
    
    public static List<Curso> listCursoE(Integer idCur) {

        Session session = sessionFactory.openSession();
        Query query = session.createQuery("from Curso where idCur="+idCur);
        
        List results = query.list();
        return results;
    }
    
    public void deleteLeccion(String idLec) {

        Session session = sessionFactory.openSession();
        Query query = session.createSQLQuery("update lecciones set estado=1 where id_lec="+idLec);
        //query.setParameter(0, idPer);
        
        query.executeUpdate();
        Transaction tx = session.beginTransaction();
        tx.commit();
        session.close();
    }
    
    
    
    public static void main(String[] args) {
        
        List<Object> per = listLeccion(2);
        
        for (int i = 0; i < per.size(); i++) {
            Object  a [] = (Object[]) per.get(i);      
                
            System.out.println(a[0]);           
            
        }
        int a = 23;
    }
}
