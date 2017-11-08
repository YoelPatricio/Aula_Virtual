/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cpyt.dao;

import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 *
 * @author Yoel
 */
public class SendMail {

    public void enviarCredencialesAcceso(String usuario,String password,String tipoUsuario,String destinatario) {
        try {

            Properties p = new Properties();

            p.put("mail.smtp.host", "smtp.gmail.com");
            p.setProperty("mail.smtp.starttls.enable", "true");
            p.setProperty("mail.smtp.port", "587");
            p.setProperty("mail.smtp.user", "ypatriciov@gmail.com");
            p.setProperty("mail.smtp.auth", "true");

            String rutaArchivo="";
            //String rutaArchivo="C:\\Users\\Yoel\\Desktop\\img.jpg";
            Session s = Session.getDefaultInstance(p, null);
            BodyPart texto = new MimeBodyPart();
            texto.setText("BIENVENIDO AL AULA VIRTUAL \n\n"
                        + "Ingrese a la plataforma con las siguientes credenciales:\n\n"
                        + "Usuario: "+usuario+" \nContraseña: "+password);

            BodyPart adjunto = new MimeBodyPart();
            
            
            if (!rutaArchivo.equals("")) {
                adjunto.setDataHandler(new DataHandler(new FileDataSource(rutaArchivo)));
                adjunto.setFileName("Certificado");
            }
            
            MimeMultipart m = new MimeMultipart();
            m.addBodyPart(texto);
            if(!rutaArchivo.equals("")){
                m.addBodyPart(adjunto);
            }
            
            MimeMessage mensaje = new MimeMessage(s);
            mensaje.setFrom(new InternetAddress("ypatriciov@gmail.com"));
            mensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));
            mensaje.setSubject("Aula Virtual - Credenciales de acceso "+tipoUsuario);
            mensaje.setContent(m);
            
            Transport t=s.getTransport("smtp");
            t.connect("ypatriciov@gmail.com","itxokmdtgojmsoql");
            t.sendMessage(mensaje, mensaje.getAllRecipients());
            t.close();


        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    
}
