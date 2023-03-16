package sesp.tu.sofia;

import java.awt.Frame;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.*; 

import javax.swing.JFrame;
import javax.swing.JPanel;


 
public class Client {
	public static boolean rabota = false,workCycle = true;
	public static String doJob = "",pamet = "";
	
   Gui g;	
   Client(Frame f){
       g = new Gui(f);
   }
	
	// G U I 
	class Gui extends JPanel  { 
		private static final long serialVersionUID = 1L;
			 	
        Gui (Frame f) {	 
	        createAndShowGUI();	        	        
	    }	    	
	    
	    public void createAndShowGUI() {

	        //Create and set up the window.
	        JFrame frame = new JFrame("Test");
	        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	        ButtonDemo newContentPane = new ButtonDemo();
	        newContentPane.setOpaque(true); //content panes must be opaque
	        frame.setContentPane(newContentPane);

	        //Display the window.
	        frame.pack();
	        frame.setTitle("Copyright 2010 II Tu-Sofia");
	        frame.setLocation(100,100);
	        frame.setSize(300, 350);
	        frame.setVisible(true);
	    }
	    
	}
    // E N D   G U I

	// 
	public void init()throws IOException{
		   
		 String server = null; 
		 String s = "";
		 InetAddress addr =  InetAddress.getByName(server); 
		 Socket socket = new Socket(addr, Server.PORT);       
	 
		try { 
//		      System.out.println("socket = " + socket); 

	          BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));                 
	          PrintWriter out =  new PrintWriter(new BufferedWriter( new OutputStreamWriter(socket.getOutputStream())),true);
      
		      while (workCycle) {
		    	  while (rabota == true	) {
		    		  s=doJob;		    					   
		    		  	out.println(s);
		    		  	
						String str = in.readLine();
						pamet = pamet + str + "\n";
						
					  if (s.equals("exit")) {out.println("END");workCycle=false;break;}
					   rabota = false;
		    	  }
		        
		       }		      	      
		      
		   out.println("END"); //za servera
	     } //try
		 
		 finally { 
			   System.out.println("closing...Client"); 
			   socket.close(); 
		 }
	}
	
	
   public static void main(String[] args)throws IOException { 
	   Frame frame =new Frame();
       Client cl = new Client(frame);     
       cl.init();
       
	 
   } 
} 