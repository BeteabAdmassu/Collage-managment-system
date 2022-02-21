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
public class Teacher extends Person {
    String salary = null;
    String id = null;
    String[] courses;
    Teacher(String f, String l, String p, String e, String g, String salary, String id, String c){
        super(f,l,p,e,g);
        this.salary = salary;
        this.id = id;
        courses = c.split("-");
    }
    
    Teacher(String f, String l, String p, String e, String g, String s, String i){
        super(f,l,p,e,g);
        salary = s;
        id = i;
    }
    
    Teacher(JFrame frame, ResultSet res){
        super(frame, res);
        try{
            salary = res.getString("salary");
            id = res.getString("tid");
        }catch(Exception e){
            JOptionPane.showMessageDialog(frame, "Can not initialize data!!!");
        }
    }
    
    public String getId(){
        return id;
    }
    
    public String getSalary(){
        return salary;
    }
    
    public void writeSalary(JTextField tx){
        tx.setText(salary);
    }
    
    public void writeId(JTextField tx){
        tx.setText(id);
    }
    
    public void setCourses(String c){
        courses = c.split("-");
    }
    
    public void setSalary(JTextField tx){
        salary = tx.getText();
    }
    
    public void setId(JTextField tx){
        id = tx.getText();
    }
    
    public void writeCourses(JTextArea tx){
        for(int i = 0; i < courses.length; ++i){
            tx.append(courses[i] + "\n");
        }
    }
}
