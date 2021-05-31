package com.spring.groupware.addrlist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.groupware.addrlist.service.InterAddrService;
@Controller
public class AddrController {

   @Autowired // Type에 따라 알아서 Bean 을 주입해준다.
   private InterAddrService service;
      

}