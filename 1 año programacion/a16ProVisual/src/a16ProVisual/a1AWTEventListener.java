package a16ProVisual;
import java.awt.*;   
import java.awt.event.*;  

//AWT Example by Inheritance

//extending Frame class to our class AWTExample1  
public class a1AWTEventListener extends Frame {
	// initializing using constructor 
	  a1AWTEventListener() {  
		  // creating a button  
		  Button b = new Button("Pulsa!!"); 
		  // setting button position on screen  
		  b.setBounds(100,100,80,30); 
		  // adding button into frame    
		  add(b);  
		  // frame size 300 width and 300 height    
		  setSize(300,300);  
		  // setting the title of Frame  
		  setTitle("AWT example"); 
		  // no layout manager   
		  setLayout(null); 
		  // now frame will be visible, by default it is not visible   
		  setVisible(true);  
	  }
	
}
//class AWTExample2 directly creates instance of Frame class  
class AWTExample2 {
	  AWTExample2() {  
		 // creating a Frame  
		  Frame f = new Frame();
		   // creating a Label  
		  Label l = new Label("Empleado id:");
		// creating a Button
		  Button b = new Button("Submit"); 
		  // creating a TextField 
		  TextField t = new TextField();  
		  
		// setting position of above components in the frame  
		  l.setBounds(20, 80, 80, 30);  
	      t.setBounds(20, 100, 80, 30);  
	      b.setBounds(100, 100, 80, 30);  
	      
	      // adding components into frame 
	      f.add(b);  
	      f.add(l);  
	      f.add(t);
	      
	      // frame size 300 width and 300 height    
	      f.setSize(400,300);  
	      
	      // setting the title of frame 
	      f.setTitle("Employee info"); 
	      
	      // no layout  
	      f.setLayout(null);   
	      
	      // setting visibility of frame 
	      f.setVisible(true);  
	  }
}

//Java event handling by implementing ActionListener
	class AEvent extends Frame implements ActionListener{  
		
		TextField tf;  
		AEvent(){ 
			//create components  
			tf=new TextField();  
			tf.setBounds(60,50,170,20);  
			Button b=new Button("click me");  
			b.setBounds(100,120,80,30);  
			
			// registro de escucha que se activa cuando le doy a click me
			b.addActionListener(this);//passing current instance  
			
			//add components and set size, layout and visibility  
			add(b);add(tf);  
			setSize(300,300);  
			setLayout(null);  
			setVisible(true);  
		}
		public void actionPerformed(ActionEvent e){  
			tf.setText("Welcome");  
		}  
	}

// 2) Java event handling by outer class
	class AEvent2 extends Frame{  
		TextField tf;  
		AEvent2(){  
			//create components  
			tf=new TextField();  
			tf.setBounds(60,50,170,20);  
			Button b=new Button("click me");  
			b.setBounds(100,120,80,30);  
			
			//register listener  
			Outer o=new Outer(this);  
			
			b.addActionListener(o);//passing outer class instance  
			//add components and set size, layout and visibility  
			add(b);add(tf);  
			setSize(300,300);  
			setLayout(null);  
			setVisible(true);  
		}  	 
	}
	class Outer implements ActionListener{  
	
		AEvent2 obj;  
		Outer(AEvent2 obj){  
			this.obj=obj;  
		}  
	
		public void actionPerformed(ActionEvent e){  
			obj.tf.setText("welcome");  
		}  
	}  
	
// Java event handling by anonymous class
	class AEvent3 extends Frame{  
		TextField tf;  
		
		AEvent3(){  
		
			tf=new TextField();  
			tf.setBounds(60,50,170,20);  
			Button b=new Button("click me");  
			b.setBounds(50,120,80,30);  
		  
			b.addActionListener(new ActionListener(){  
													public void actionPerformed(ActionEvent e){  
														tf.setText("hello");  
													} 
													}
								);  
			
			add(b);add(tf);  
			setSize(300,300);  
			setLayout(null);  
			setVisible(true);  
		}  
		
		public static void main(String args[]){  
			new AEvent3();  
		}  
	}  
