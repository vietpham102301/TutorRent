package tutor.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;
import java.util.stream.Stream;

public class debugs {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Map<Integer, Integer> years = new HashMap<>();
		for(int i=0; i<24; i++)
		{
			years.put(1980+i+1, 1980+i+1);
		}
		TreeMap<Integer, Integer> sorted = new TreeMap<>(years);
		
		sorted.forEach(
	            (key, value)
	                -> System.out.println(key + " = " + value));
		   
	}


}
