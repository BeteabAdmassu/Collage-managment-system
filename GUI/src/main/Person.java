/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;
import javax.swing.*;
import java.awt.*;
import java.sql.*;
import javax.swing.table.*;

/**
 *
 * @author dagim
 */
public class Person {
    protected String fname = null;
    protected String lname = null;
    protected String phone = null;
    protected String email = null;
    protected String gender = null;
    
    Person(String f, String l, String p, String e, String g){
        fname = f;
        lname = l;
        phone = p;
        email = e;
        gender = g;
    }
    
    Person(JFrame frame, ResultSet res){
        try{
            fname = res.getString("fname");
            lname = res.getString("lname");
            phone = res.getString("phone");
            email = res.getString("email");
            gender = res.getString("gender");
        }catch(Exception e){
            JOptionPane.showMessageDialog(frame, "Can not initialize data");
        }
        
    }
    
    public String getFname(){
        return fname;
    };
    public String getLname(){
        return lname;
    };
    public String getPhone(){
        return phone;
    };
    public String getEmail(){
        return email;
    };
    public String getGender(){
        return gender;
    };
    
    public void setFname(JTextField tx){
        fname = tx.getText();
    }
    
    public void setLname(JTextField tx){
        lname = tx.getText();
    }
    
    public void setPhone(JTextField tx){
        phone = tx.getText();
    }
    
    public void setEmail(JTextField tx){
        email = tx.getText();
    }
    
    public void setGender(JTextField tx){
        gender = tx.getText();
    }
    
    
    public void writeFname(JTextField tx){
        tx.setText(fname);
    }
    
    
    public void writeLname(JTextField tx){
        tx.setText(lname);
    }
    
    public void writePhone(JTextField tx){
        tx.setText(phone);
    }
    
    public void writeEmail(JTextField tx){
        tx.setText(email);
    }
    
    public void writeGender(JTextField tx){
        tx.setText(gender);
    }
    
 

}
