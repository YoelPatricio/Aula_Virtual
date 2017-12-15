/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cpyt.dao;

import static com.cpyt.dao.GenericDAO.sessionFactory;
import com.cpyt.model.Persona;
import com.cpyt.model.Tarjeta;
import java.math.BigDecimal;
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
public class TarjetaDAO {
    
    static Session session = null;
    
    public static final SessionFactory sessionFactory;
	static {
		sessionFactory = new Configuration().configure().buildSessionFactory();
	}
        
        
    public static List<Tarjeta> getTarjeta(String tarjeta,String fv,String cvv) {

        Session session = sessionFactory.openSession();
        Query query = session.createQuery("from Tarjeta where numTar=? and fecVen=? and numCvv=?");
        query.setParameter(0, tarjeta);
        query.setParameter(1, fv);
        query.setParameter(2, cvv);
        
        List results = query.list();
        return results;
    }
    
   
    
    public void actualizarSaldo(BigDecimal saldoActualizado,Integer idTar) {

        Session session = sessionFactory.openSession();
        Query query = session.createSQLQuery("update tarjeta set saldo=? where id_tar=?");
        query.setParameter(0, saldoActualizado);
        query.setParameter(1, idTar);
        
        query.executeUpdate();
        Transaction tx = session.beginTransaction();
        tx.commit();
        session.close();
    }
    
    
    
    public static void main(String[] args) {
        
        
    }
}
