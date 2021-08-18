package com.ben.dojo_and_ninjas.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ben.dojo_and_ninjas.models.Dojo;
import com.ben.dojo_and_ninjas.models.Ninja;
import com.ben.dojo_and_ninjas.services.MainService;


@Controller
public class MainController {
	private final MainService mainservice;
	public MainController(MainService mainservice) {
		this.mainservice = mainservice;
	}
	
	// home page
	@RequestMapping("/")
	public String root() {
		return "redirect:/dojos/new/";
	}
	
	// create
	@RequestMapping("/dojos/new")
	public String newDojo(@ModelAttribute("dojo") Dojo dojo) {
		return "newdojo.jsp";
	}
	
	// add new
	@RequestMapping(value="/dojos/create", method=RequestMethod.POST)
	public String createDojo(@Valid @ModelAttribute("dojo") Dojo dojo, BindingResult result) {
		if(result.hasErrors()) {
			return "newdojo.jsp";
		} else {
			mainservice.createDojo(dojo);
			return "redirect:/dojos/new";
		}
	}
	
	// create
	@RequestMapping("/ninjas/new")
	public String newNinja(@ModelAttribute("ninja") Ninja ninja, Model model) {
		List<Dojo> dojos = mainservice.findAllDojo();
		model.addAttribute("dojos", dojos);
		return "newninja.jsp";
	}
	
	// add new
	@RequestMapping(value="/ninjas/create", method=RequestMethod.POST)
	public String createNinja(@Valid @ModelAttribute("ninja") Ninja ninja, BindingResult result) {
		if(result.hasErrors()) {
			return "newninja.jsp";
		} else {
			mainservice.createNinja(ninja);
			return "redirect:/ninjas/new";
		}
	}
	
	// display all
	@RequestMapping("/dojos/{dojo_id}")
	public String dojoDetail(Model model, @PathVariable("dojo_id") Long dojo_id) {
		Dojo dojo = mainservice.findDojoById(dojo_id);
		model.addAttribute("dojo", dojo);
		return "/dojodetails.jsp";
	}
}