/*package com.hethi.commonfunctions;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.messaging.support.MessageBuilder;

import com.hethi.utils.InboundGateway;


//Methods to Read and Write to AMQ

public class amqServices  implements MessageListener{

	public void onMessage(Message m) {
		TextMessage message=(TextMessage) m;	
		
		try {
			 String msg = message.getText();
			 String SEPARATOR = "-----------------------";
			 System.out.println( " \n");
			 System.out.println(""+SEPARATOR);
			 System.out.println("Hethi Input Gateway listerner invoke");
			 System.out.println(""+SEPARATOR);	
			 System.out.println("New request recieved.");
			 System.out.println(""+SEPARATOR);	
			 System.out.println("message :"+msg.toString());			 
			 System.out.println(""+SEPARATOR);	
			 
			 
			    ApplicationContext context = new ClassPathXmlApplicationContext("/sp/core/hethi-context.xml");		        
		        // Create new document here 
		        InboundGateway document = context.getBean("inboundGateway",InboundGateway.class);
		        
		        String NextQue="DocumentInChannel"; //DocumentInChannel;
		        
		        org.springframework.messaging.Message   <String> messageData= MessageBuilder.withPayload( msg)
                        .setHeader("NextQue",NextQue)
                        .build();
		        
		        String response = document.post(messageData);
		        System.out.println("response : " + response);
			 
		} catch (JMSException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		
	}
	

}
*/