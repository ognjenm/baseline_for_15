package com.hethi.utils;

import org.springframework.messaging.Message;

public interface InboundGateway {

    void createDocument(String request);    
    String post (Message request);
}
