package com.hethi.commonfunctions;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class callRulePackage {

	public static String getRulePackage(String path) {
				
				AbstractApplicationContext context = new ClassPathXmlApplicationContext("/sp/core/hethi-core-schema.xml");
				RuleInterface test = (RuleInterface)context.getBean("getRuleBeam");
				
				String SEPARATOR = "-----------------------";
				 System.out.println(" \n ");
				 System.out.println(""+SEPARATOR);
				 System.out.println("Reququesting for  rule ");
				 System.out.println(""+SEPARATOR);	
				 
				 
				 String ruleString=test.getRule(path);
				return ruleString ;
				
		}
	
	
}


