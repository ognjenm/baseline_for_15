package com.hethi.utils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CollectionManipulation {

	
	
	public String getElementCount(List<String> list){
		
		
		
		Map<String, Integer> stringsCount = new HashMap<>();

		// And iterate over your array filling this map:

		for (String s : list) {
			Integer c = stringsCount.get(s);
			if (c == null)
				c = new Integer(0);
			c++;
			stringsCount.put(s, c);
		}

		// Finally, you can get the most repeated element iterating over the
		// map:

		Map.Entry<String, Integer> mostRepeated = null;
		int i = 0;
		for (Map.Entry<String, Integer> e : stringsCount.entrySet()) {
			if (mostRepeated == null || mostRepeated.getValue() < e.getValue())
				mostRepeated = e;
			// System.out.println(i++);
		}

		// And show the most common string:

		if (mostRepeated != null)
			System.out.println(
					"Most common string: " + mostRepeated.getKey() + " the count is" + mostRepeated.getValue());

		return mostRepeated.getKey() + "," + mostRepeated.getValue();

	}
	
}
