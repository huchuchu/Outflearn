package com.outflearn.Outflearn;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RoadMapController {
	
	private static final Logger logger  = LoggerFactory.getLogger(RoadMapController.class);
	
	
	@RequestMapping("/RoadMap")
	public String roadMapPage() {
		return"RoadMapList";
	}
	
	@RequestMapping("/RoadMapWriteP1")
	public String roadMapWriteP1() {
		return "RoadMapWrite_p1";
	}
	
	

}
