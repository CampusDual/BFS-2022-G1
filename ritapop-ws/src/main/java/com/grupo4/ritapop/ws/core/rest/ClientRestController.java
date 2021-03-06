package com.grupo4.ritapop.ws.core.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.grupo4.ritapop.api.core.service.IClientService;
import com.ontimize.jee.server.rest.ORestController;

@RestController
@RequestMapping("/clients")
public class ClientRestController extends ORestController<IClientService> {

 @Autowired
 private IClientService clientService;

 @Override
 public IClientService getService() {
  return this.clientService;
 }
}
