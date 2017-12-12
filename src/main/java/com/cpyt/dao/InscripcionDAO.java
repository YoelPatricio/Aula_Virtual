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
public class InscripcionDAO {
    
    static Session session = null;
    
    public static final SessionFactory sessionFactory;
	static {
		sessionFactory = new Configuration().configure().buildSessionFactory();
	}
        
        
    public static List<Object> listAlumForCurso(Integer idCur) {

        Session session = sessionFactory.openSession();
        Query query = session.createSQLQuery("select i.id_ins,i.id_per,p.apaterno,p.amaterno,p.nombres,i.fec_ins,i.est_ins,tf.arc_tra,tf.not_tra "
                                                + " from inscripcion i inner join persona p "
                                                + " on i.id_per=p.id_per left join trabajo_final tf on i.id_ins=tf.id_ins"
                                                + " where p.estado=0 and i.id_cur="+idCur);
        
        List results = query.list();
        return results;
    }
    
    
    public void uploadJob(String idCur,String job) {

        Session session = sessionFactory.openSession();
        Query query = session.createSQLQuery("update curso set tra_cur=? where id_cur=?");
        query.setParameter(0, job);
        query.setParameter(1, idCur);
        
        query.executeUpdate();
        Transaction tx = session.beginTransaction();
        tx.commit();
        session.close();
    }
    
    public static void main(String[] args) {
        int a = 0;
        List<Object> ins = listAlumForCurso(1);
        int ad = 0;
    }
    
    
    
   
}
