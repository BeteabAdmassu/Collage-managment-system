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
public class Util {
    public static Connection dbConnect(JFrame frame, String url, String user, String password){
        Connection c = null;
        try{
            
            c = DriverManager.getConnection(url, user, password);
        }catch(Exception e){
            JOptionPane.showMessageDialog(frame, "There is an error connecting to your database!\nThe Program will exit!");   
            System.exit(1);
        }
        return c;
    }
    
    
    public static void Update(JFrame frame,Connection con ,Teacher t){
         try{
	    PreparedStatement statement;
            statement = con.prepareStatement("update teacher set fname=?,lname=?,phone=?,email=?,salary=?,gender=? where tid=?");
            statement.setString(1, t.getFname());
            statement.setString(2, t.getLname());
            statement.setString(3, t.getPhone());
            statement.setString(4, t.getEmail());
            statement.setString(5, t.getSalary());
            statement.setString(6, t.getGender());
            statement.setString(7, t.getId());
	    statement.executeUpdate();
        }catch(Exception e){
            JOptionPane.showMessageDialog(frame, "Please Enter a Valid Input!!!");
        }
    }
    
    public static int generateId(){
       int ints[] = {1,2,3,4,5,6,7,8,9,0};
       String random_int = "";
       for(int i = 0; i < 7; ++i){
           random_int += (int)Math.floor(Math.random()*(ints.length-0+1)+0);
       }
       return Integer.parseInt(random_int);
    }
    
    private static boolean validateString(String s){
        for(char c: s.toCharArray()){
             if(Character.isDigit(c) || Character.isSpaceChar(c)){
                 return false;
             }
         }
        return true;
    }
    
    public static void register(JFrame frame, Connection con, Teacher t){
        if(!validateString(t.getFname())){
            JOptionPane.showMessageDialog(frame, "First Name Can not have numbers or spaces");
            return;
        }
        if(!validateString(t.getLname())){
             JOptionPane.showMessageDialog(frame, "Last Name Can not have numbers or spaces");
             return;
        }
        
     
        try{
            PreparedStatement statement;
            statement = con.prepareStatement("insert into teacher values(?,?,?,?,?,?,?)");
            statement.setString(1, t.getId());
            statement.setString(2, t.getFname());
            statement.setString(3, t.getLname());
            statement.setString(4, t.getPhone());
            statement.setString(5, t.getEmail());
            statement.setString(6, t.getSalary());
            statement.setString(7, t.getGender());
	    statement.executeUpdate();
            JOptionPane.showMessageDialog(frame, "First Name and Last Name can not be more than 10 Characters");
            return;
        }catch(Exception e){
            e.printStackTrace();
            JOptionPane.showMessageDialog(frame, "Can not insert value!!!");
            return;
        }
    };
    
     public static void register(JFrame frame, Connection con, Student t){
         if(!validateString(t.getFname())){
            JOptionPane.showMessageDialog(frame, "First Name Can not have numbers or spaces");
            return;
        }
        if(!validateString(t.getLname())){
             JOptionPane.showMessageDialog(frame, "Last Name Can not have numbers or spaces");
             return;
        }
        
        try{
            PreparedStatement statement;
            statement = con.prepareStatement("insert into student values(?,?,?,?,?,?,?,?)");
            //sid, fname,lname,gender,phone,email,gpa,cgpa,batch,dept
            
            statement.setString(1, t.getId());
            statement.setString(2, t.getFname());
            statement.setString(3, t.getLname());
            statement.setString(4, t.getGender());
            statement.setString(5, t.getPhone());
            statement.setString(6, t.getEmail());
            statement.setString(7, t.getBatch());
            statement.setString(8, t.getDept());
	    statement.executeUpdate();
            
        }catch(Exception e){
            e.printStackTrace();
            JOptionPane.showMessageDialog(frame, "Can not insert value!!!");
        }
     
    };
    
    
    public static boolean isNumeric(String string) {
        int intValue;

        if(string == null || string.equals("")) {
            return false;
        }
        try {
            intValue = Integer.parseInt(string);
            return true;
        } catch (NumberFormatException e) {
        }
        return false;
    }
    
    
    public static void clearField(JTextField tx){
        tx.setText("");
    }
    
    public static void FillTable(JFrame frame, JTable table, Connection con,String Query) {
	    try
            {
	        Statement stat = con.createStatement();
	        ResultSet rs = stat.executeQuery(Query);

	        //To remove previously added rows
	        while(table.getRowCount() > 0) 
	        {
	            ((DefaultTableModel) table.getModel()).removeRow(0);
	        }
	        int columns = rs.getMetaData().getColumnCount();
	        while(rs.next())
	        {  
	            Object[] row = new Object[columns];
	            for (int i = 1; i <= columns; i++)
	            {  
	                row[i - 1] = rs.getObject(i);
	            }
	            ((DefaultTableModel) table.getModel()).insertRow(rs.getRow()-1,row);
	        }

	       
	    }catch(Exception e)
	    {
                e.printStackTrace();
	    	JOptionPane.showMessageDialog(frame, "Can not fetch student data!!!");
	    }
	}
    
    public static void FillTable(JFrame frame, JTable table, ResultSet rs) {
	    try
            {
	       

	        //To remove previously added rows
	        while(table.getRowCount() > 0) 
	        {
	            ((DefaultTableModel) table.getModel()).removeRow(0);
	        }
	        int columns = rs.getMetaData().getColumnCount();
	        while(rs.next())
	        {  
	            Object[] row = new Object[columns];
	            for (int i = 1; i <= columns; i++)
	            {  
	                row[i - 1] = rs.getObject(i);
	            }
	            ((DefaultTableModel) table.getModel()).insertRow(rs.getRow()-1,row);
	        }

	       
	    }catch(Exception e)
	    {
                e.printStackTrace();
	    	JOptionPane.showMessageDialog(frame, "Can not fetch student data!!!");
	    }
	}
    
    public static void insertGrade(JFrame form, Connection con, String cid, String sid, String mid, String fcf, String cont, String grade)
            throws Exception
    {
    
        Double m = Double.parseDouble(mid);
        Double f = Double.parseDouble(fcf);
        Double c = Double.parseDouble(cont);
        char ch = 'D';
    
            try{
               if(m > 30 || m < 0 || f > 50 || f < 0 || c < 0 || c > 20){
                   throw new Exception("Invalid input");
               }
               if(grade.charAt(0) < 'A' || grade.charAt(0) > 'F'){
                   throw new Exception("Invalid input");
                }
               PreparedStatement s = con.prepareStatement("insert into grade values(?,?,?,?,?,?)");
                s.setString(1, sid);
                s.setString(2, cid);
                s.setDouble(3, m);
                s.setDouble(4, f);
                s.setDouble(5, c);
                s.setString(6, grade);
                s.executeUpdate();
             
        }catch(Exception e){
            e.printStackTrace();
            JOptionPane.showMessageDialog(form, "Wrong Value Inserted!!!");
        }
    }
  }



        
