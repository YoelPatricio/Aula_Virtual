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
public class CursoDAO {
    
    static Session session = null;
    
    public static final SessionFactory sessionFactory;
	static {
		sessionFactory = new Configuration().configure().buildSessionFactory();
	}
        
        
    public static List<Object> listCurso() {

        Session session = sessionFactory.openSession();
        Query query = session.createSQLQuery("select c.id_cur,p.apaterno,p.amaterno,p.nombres,c.nom_cur,c.des_cur,c.pre_cur,c.tra_cur,c.id_per,c.publicado from curso c inner join persona p on c.id_per=p.id_per where c.estado=0");
        
        List results = query.list();
        return results;
    }
    
    public static List<Object> listCursoDocente(String idPer) {

        Session session = sessionFactory.openSession();
        Query query = session.createSQLQuery("select c.id_cur,p.apaterno,p.amaterno,p.nombres,c.nom_cur,c.des_cur,c.pre_cur,c.tra_cur,c.id_per,c.publicado from curso c inner join persona p on c.id_per=p.id_per where c.estado=0 and c.id_per="+idPer);
        
        List results = query.list();
        return results;
    }
    
    public static List<Object> listCursoEstudiante(String idPer) {

        Session session = sessionFactory.openSession();
        Query query = session.createSQLQuery("select c.id_cur,p.apaterno,p.amaterno,p.nombres,c.nom_cur,c.des_cur,c.pre_cur,c.tra_cur,c.id_per,c.publicado,i.id_ins,i.fec_ins,i.est_ins,tf.not_tra "
                                            + " from inscripcion i inner join curso c on i.id_cur=c.id_cur "
                                            + " inner join persona p on c.id_per=p.id_per "
                                            + " left join trabajo_final tf on i.id_ins=tf.id_ins where i.id_per="+idPer);
        
        List results = query.list();
        return results;
    }
    
    public static List<Curso> listCursoE(Integer idCur) {

        Session session = sessionFactory.openSession();
        Query query = session.createQuery("from Curso where idCur="+idCur);
        
        List results = query.list();
        return results;
    }
    
    public void deleteCurso(String idCur) {

        Session session = sessionFactory.openSession();
        Query query = session.createSQLQuery("update curso set estado=1 where id_cur="+idCur);
        //query.setParameter(0, idPer);
        
        query.executeUpdate();
        Transaction tx = session.beginTransaction();
        tx.commit();
        session.close();
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
    
    public static List<Object> listCursoAll() {

        Session session = sessionFactory.openSession();
        Query query = session.createSQLQuery("select c.id_cur,p.apaterno,p.amaterno,p.nombres,c.nom_cur,c.des_cur,c.pre_cur,c.tra_cur,c.id_per from curso c inner join persona p on c.id_per=p.id_per where c.estado=0 and c.publicado=0");
        
        List results = query.list();
        return results;
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
