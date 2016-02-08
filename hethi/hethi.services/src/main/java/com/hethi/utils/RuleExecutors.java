package com.hethi.utils;

import java.io.Reader;
import java.io.StringReader;

import org.drools.KnowledgeBase;
import org.drools.KnowledgeBaseFactory;
import org.drools.builder.KnowledgeBuilder;
import org.drools.builder.KnowledgeBuilderError;
import org.drools.builder.KnowledgeBuilderErrors;
import org.drools.builder.KnowledgeBuilderFactory;
import org.drools.builder.ResourceType;
import org.drools.io.Resource;
import org.drools.io.ResourceFactory;

public class RuleExecutors {
	
	public KnowledgeBase readKnowledgeBase(String rule) throws Exception {
		
	       KnowledgeBuilder kbuilder = KnowledgeBuilderFactory.newKnowledgeBuilder();	       
	       Resource myResource=ResourceFactory.newReaderResource((Reader) new StringReader(rule));
		   kbuilder.add(myResource, ResourceType.DRL);
	       KnowledgeBuilderErrors errors = kbuilder.getErrors();
	       if (errors.size() > 0) {
	           for (KnowledgeBuilderError error: errors) {
	               System.err.println(error);
	           }
	           throw new IllegalArgumentException("Could not read rule file.");
	       }
	       KnowledgeBase kbase = KnowledgeBaseFactory.newKnowledgeBase();
	       kbase.addKnowledgePackages(kbuilder.getKnowledgePackages());
	       return kbase;
	   }
	

}
