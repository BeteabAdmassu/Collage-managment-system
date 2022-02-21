/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import java.sql.ResultSet;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

/**
 *
 * @author dagim
 */
public class Student extends Person {
    private String sid;
    private String batch;
    private String dept;
    String[] courses;

    
    Student(String f, String l, String p, String e, String g, String sid, String batch, String dept){
        super(f,l,p,e,g);
        this.sid = sid;
        this.batch = batch;
        this.dept = dept;
    }
    
    Student(JFrame frame, ResultSet res){
        super(frame, res);
        try{
            sid = res.getString("sid");
            batch = res.getString("batch");
            dept = res.getString("dept");
        }catch(Exception e){
            JOptionPane.showMessageDialog(frame, "Can not initialize data!!!");
        }
    }
    
    public String getId(){
        return sid;
    }
    
    
    public String getBatch(){
        return batch;
    }
    
    public String getDept(){
        return dept;
    }
    
    public void writeId(JTextField tx){
        tx.setText(sid);
    }
    
    public void setCourses(String c){
        courses = c.split("-");
    }
    
    
    public void setId(JTextField tx){
        sid = tx.getText();
    }
    
}
