package com.ben.dojo_and_ninjas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.ben.dojo_and_ninjas.models.Dojo;
import com.ben.dojo_and_ninjas.models.Ninja;
import com.ben.dojo_and_ninjas.repositories.DojoRepository;
import com.ben.dojo_and_ninjas.repositories.NinjaRepository;

@Service
public class MainService {
	DojoRepository dojoRepo;
	NinjaRepository ninjaRepo;
	
	public MainService(DojoRepository dojoRepo, NinjaRepository ninjaRepo) {
		this.dojoRepo = dojoRepo;
		this.ninjaRepo = ninjaRepo;
	}
	
	// find all
	public List<Ninja> findAllNinja() {
		return ninjaRepo.findAll();
	}
	
	// find all
	public List<Dojo> findAllDojo() {
		return dojoRepo.findAll();
	}
	
	// find one
	public Ninja findNinjaById(Long id) {
		Optional<Ninja> optionalNinja = ninjaRepo.findById(id);
		if(optionalNinja.isPresent()) {
			return optionalNinja.get();
		} else {
			return null;
		}
	}
	
	// find one
	public Dojo findDojoById(Long id) {
		Optional<Dojo> optionalDojo = dojoRepo.findById(id);
		if(optionalDojo.isPresent()) {
			return optionalDojo.get();
		} else {
			return null;
		}
	}
	
	// create
	public Ninja createNinja(Ninja n) {
		return ninjaRepo.save(n);
	}
	
	// create
	public Dojo createDojo(Dojo d) {
		return dojoRepo.save(d);
	}
	
	// add Ninja to Dojo
	public Dojo addNinjaToDojo(Long dojo_id, Long ninja_id) {
		Optional<Dojo> dojo = dojoRepo.findById(dojo_id);
		Optional<Ninja> ninja = ninjaRepo.findById(ninja_id);
		if(dojo.isPresent() & dojo.isPresent()) {
			List<Ninja> ninjas = dojo.get().getNinjas();
			ninjas.add(ninja.get());
			dojo.get().setNinjas(ninjas);
			return dojo.get();
		} else {
			return null;
		}
	}

}