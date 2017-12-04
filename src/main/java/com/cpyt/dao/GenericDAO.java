
package com.cpyt.dao;



import com.cpyt.model.Curso;
import com.cpyt.model.Persona;
import com.cpyt.model.Tarjeta; 
import java.math.BigDecimal;
import java.util.List; 
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class GenericDAO {
    
    static Session session = null;
    
    public static final SessionFactory sessionFactory;
	static {
		sessionFactory = new Configuration().configure().buildSessionFactory();
	}

    public void insert(Object o) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        session.save(o);
        tx.commit();
        session.close();
    }

    public void update(Object o) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        session.update(o);
        tx.commit();
        session.close();
    }

    public void delete(Object o) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        session.update(o);
        tx.commit();
        session.close();
        
    }
    
    public Integer generarID(String id,String entidad){
        Session session = sessionFactory.openSession();
        Query query = session.createQuery("select max("+id+") from "+entidad);
        List results = query.list();
        Integer ultimoID =  (Integer) results.get(0);
        Integer siguienteID=1;
        if(ultimoID!=null){
            siguienteID = ultimoID + 1;
        }
        
        return siguienteID;
    }
    
    public List<Object> list(String entidad) {

        Session session = sessionFactory.openSession();
        Query query = session.createQuery("from "+entidad+" where isDeleted=?");
        query.setParameter(0, 0);
        List results = query.list();
        return results;
    }
    
     public List<Tarjeta> listAll(String entidad) {

        Session session = sessionFactory.openSession();
        Query query = session.createQuery("from "+entidad);
        
        List results = query.list();
        return results;
    }
    
    public void delete(String tabla, String campoID,Integer id) {

        Session session = sessionFactory.openSession();
        Query query = session.createSQLQuery("update "+tabla+" set estado=1 where "+campoID+"=?");
       
        query.setParameter(0, id); 
       
        query.executeUpdate();
        Transaction tx = session.beginTransaction();
        tx.commit();
        session.close();
        

    }
    
    public static List<Object> getAfluenciaClientes(int limit) {

        Session session = sessionFactory.openSession();
        //Query query = session.createQuery("from Empleado where (dniEmp like ? or cast(idEmp as string) like ? or nombEmp like ?) and isDeleted=?");
        String sql ="select dni_cli,nomb_cli,count(*) as cantidad from boleto " +
                    " where esta_bol=0 " +
                    " group by dni_cli " +
                    " order by cantidad desc ";
                    
        
                    if(limit!=-1){
                        sql=sql+" limit ?";
                    }
                    
        Query query = session.createSQLQuery(sql);
   
        if(limit!=-1){
            query.setParameter(0, limit);
                    
        }         

        List results = query.list();

        return results;

    }   
    
    public Integer ultimoID(String id,String entidad){
        Session session = sessionFactory.openSession();
        Query query = session.createQuery("select max("+id+") from "+entidad);
        List results = query.list();
        Integer ultimoID =  (Integer) results.get(0);
        
        return ultimoID;
    }
    
    public String userDir(){
        String dir=System.getProperty("user.dir");
        return dir;
    }
    
    
    
    public static void main(String[] args) {
        
        /*Rol r=new Rol(11,"Cajero2", "Encargado de cobrar", 0);
        GenericDAO g = new GenericDAO();
        
        
        HashSet<Permiso> permisos = new HashSet<Permiso>();
        permisos.add(new Permiso(11));
        permisos.add(new Permiso(22));
        permisos.add(new Permiso(33));
        r.setPermiso(permisos);
        
        g.update(r);
        
        GenericDAO g = new GenericDAO();
        Empleado e=new Empleado();
        Rol r= new Rol();
        r.setIdRol(15);
        e.setRol(r);
        e.setDniEmp("41246543");
        e.setNombEmp("Leonardo Patricio");
        e.setCeluEmp("98745632");
        e.setDireEmp("Av. Aviacion");
        
        g.insert(e);
        GenericDAO g = new GenericDAO();
        //g.delete("ruta", "id_rut", 13);
        Boleto b=new Boleto();
        b.setIdBol(0);
        
        Programacion p = new Programacion();
        p.setIdPro(1);
        
        b.setProgramacion(p);
        
        Ruta ru = new Ruta();
        ru.setIdRut(1);
        
        b.setRuta(ru);
                
        Usuario u = new Usuario();
        u.setIdUsu(1);
        
        b.setUsuario(u);
        
        b.setRucEmpr("");
        b.setNombEmpr("");
        b.setDniCli("12345678");
        b.setNombCli("Jose Jose");
        b.setPrecBol(new BigDecimal("15.00"));
        b.setAcarBol(new BigDecimal("15.00"));
        b.setTotaBol(new BigDecimal("30.00"));
        b.setFcomBol(new Date());
        
        g.insert(b);
        Programacion p = new Programacion();
        p.setIdPro(1);
        Ruta r=new Ruta();
        r.setIdRut(1);
        Encomienda e=new Encomienda(p, r, new Date(), "77229104", "Yoel", "74171474", "Claudia", new BigDecimal("10.00"), 0);
        GenericDAO g = new GenericDAO();
        
        List<Encomiendadetalle> detalleList=new ArrayList<Encomiendadetalle>();
        
        HashSet<Encomiendadetalle> enc = new HashSet<Encomiendadetalle>();
        enc.add(new Encomiendadetalle("CAJA",new BigDecimal("15.5")));
        enc.add(new Encomiendadetalle("CAJA", new BigDecimal("20.5")));
        
        e.setDetalle(enc);
        
        g.insert(e);*/
        
        GenericDAO g = new GenericDAO();
        
        /*Tarjeta tar = new Tarjeta();
        tar.setNumTar("13546346356");
        tar.setFecVen("09/22");
        tar.setNumCvv("256");
        tar.setSaldo(BigDecimal.ZERO);
        //Hola mundo
        //g.insert(tar);
        
        List<Tarjeta> tj =  g.listAll("Tarjeta");
        
        System.out.println(tj);
        
        for (int i = 0; i<tj.size(); i++) {
            System.out.println(tj.get(i).getNumTar());
        }
        
        Integer a = g.ultimoID("idPer", "Persona");
        System.out.println(a);*/
        String d=g.userDir();
        System.out.println(d);
                    
              
        //System.out.println(g.userDir());
       
        
    }
}
