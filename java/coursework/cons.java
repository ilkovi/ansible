package sesp.tu.sofia;

import java.io.*; 
import java.net.*;

public class ProducerConsumer {
	public static String rabota = "";
	
    public static void main(String[] args) {
        CubbyHole c = new CubbyHole();
        
    	String nameA[] = { "Thread 1", "Thread 2", "Thread 3", "Thread 4"};
    	Producer p1 = new Producer(c, nameA.length);
        p1.start();
        
        
		for (int i = 0; i < nameA.length; i++) {	
			Consumer con = new Consumer(c,nameA[i]); 			
			con.start();						
		}

    }
}

class CubbyHole {
    private String contents;
    private boolean available = false;

    public synchronized String get() {
        while (available == false) {
            try {
                wait();
            } catch (InterruptedException e) { }
        }
        available = false;
        notifyAll();
        return contents;
    }

    public synchronized void put(String value) {
        while (available == true) {
            try {
                wait();
            } catch (InterruptedException e) { }
        }
        contents = value;            
        available = true;
        notifyAll();
    }
}


class Consumer extends Thread {
    private CubbyHole cubbyhole;
    private String name;
    private boolean izhod = false;
	private String value = "";
	private int izrabotih;
	
    public Consumer(CubbyHole c, String name) {
        cubbyhole = c;
        this.name = name;
        izrabotih = 0;
    }

    public void run() {
    	while (!izhod) { 

            value = cubbyhole.get(); 
            	if (value.equals("exit")) {izhod=true;break;}
            	++izrabotih;     ProducerConsumer.rabota = (this.name +" izraboti "+ this.izrabotih );      
    	}
    }
}


class Producer extends Thread {
    private CubbyHole cubbyhole;
    private boolean izhod = false;
    String str ="";
    
	String s = ""; // za stringa polu4en na vhoda
	int zaKill;
	  public static final int PORT = 8080; 
	  
    public Producer(CubbyHole c,int zaKill) {
        cubbyhole = c;
        this.zaKill = zaKill;
    }

    public void run() {
    	while (!izhod) {
    	
    	    ServerSocket srv;
    	    try { 
				srv = new ServerSocket(PORT);

    	    System.out.println("Started server : " + srv);    //////////////////

    	    
    	        Socket socket = srv.accept();                                            
    	        try {                                                                                           
    	        	BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));               
    	        	PrintWriter out =  new PrintWriter(new BufferedWriter( new OutputStreamWriter(socket.getOutputStream())),true);
    	                 		 
    	          while (true) { 
    	            str = in.readLine();

    	            if (str.equals("END")) break;
    	            

    	            cubbyhole.put(str);    	            

    	            sleep(20);
    	            System.out.println();    	            
    	            out.println(ProducerConsumer.rabota);
    	          }
    	          
              	for (int i = 0; i < zaKill-1; i++) {cubbyhole.put(str);}      
            	izhod = true;	         
    	 
    	        } catch (InterruptedException e) {
    	        	System.out.println("gre6ka pri server socket " + e);
				} finally { 
    	          socket.close(); 
    	        } 
    	      }
    	    
    	    catch (IOException e) {
    	    		System.out.println("gre6ka pri proizvoditelq " + e);
			}    

    	}
    }
}
