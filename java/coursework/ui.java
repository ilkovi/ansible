package sesp.tu.sofia;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.JTextArea;
import javax.swing.JScrollPane;

public class ButtonDemo extends JPanel  { 
	private static final long serialVersionUID = 1L;
	
	public static boolean  newMessage = true; // za inner consumer

	protected JButton b1, b2, b3 ,b4,b5;
	protected JTextField textF1,textF2,textF3;
	protected JScrollPane sp;
	protected JTextArea area;
 	
    public ButtonDemo() {
    	
        b1 = new JButton("Enter work to do ");
        b1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        
        b2 = new JButton("Enter work to do ");
        b2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });
        
        b3 = new JButton("Enter work to do ");
        b3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });
        
        b4 = new JButton("Done Work");
        b4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton4ActionPerformed(evt);
            }
        });
        
        b5 = new JButton("Stop Server");
        b5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton5ActionPerformed(evt);
            }
        });
        
        textF1 = new JTextField( 10 );
        textF2 = new JTextField( 10 );
        textF3 = new JTextField( 10 );

        area = new JTextArea(8,12);
        sp = new JScrollPane(area,JScrollPane.VERTICAL_SCROLLBAR_ALWAYS,JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
        
       
        //Add Components to this container, using the default FlowLayout.
        add(b1);
        add(textF1);
        add(b2);
        add(textF2);
        add(b3);
        add(textF3);
        add(b4);
        add(sp);
        add(b5);
    }
    	
    public void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {	                                          
        try{
        	Client.doJob=textF1.getText();
        	Client.rabota = true;
        	textF1.setText("");
        }
        catch (Exception ex){
            System.out.println("exception: "+ex);			   
        } 
    
    }

    public void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {	                                          
        try{
        	Client.doJob=textF2.getText();
        	Client.rabota = true;
        	textF2.setText("");     
        }
        catch (Exception ex){
            System.out.println("exception: "+ex);
        }      
    }
    
    public void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {	                                          
        try{
        	Client.doJob=textF3.getText();
        	Client.rabota = true;
        	textF3.setText("");     
        }
        catch (Exception ex){
            System.out.println("exception: "+ex);			   
        }        
    }
    
    public void jButton4ActionPerformed(java.awt.event.ActionEvent evt) {
    	area.setText(Client.pamet);
    }
    
    public void jButton5ActionPerformed(java.awt.event.ActionEvent evt) {
        try{
        	Client.doJob="exit";
        	Client.rabota = true;     
        }
        catch (Exception ex){
            System.out.println("exception: "+ex);			   
        }
    }
    
    public static void createAndShowGUI() {

        //Create and set up the window.
        JFrame frame = new JFrame("Test");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        //Create and set up the content pane.
        ButtonDemo newContentPane = new ButtonDemo();
        newContentPane.setOpaque(true); //content panes must be opaque
        frame.setContentPane(newContentPane);

        //Display the window.
        frame.pack();
        frame.setTitle("Copyright 2010 II Tu-Sofia");
        frame.setLocation(100,200);
        frame.setSize(300, 350);
        frame.setVisible(true);
    }

}
