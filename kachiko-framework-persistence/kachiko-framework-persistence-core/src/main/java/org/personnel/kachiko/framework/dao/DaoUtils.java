package org.personnel.kachiko.framework.dao;

import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;

public class DaoUtils {

	private static Mapper mapper = new DozerBeanMapper();
	
	public static Mapper getDozerBeanMapper(){
		return mapper;
	}
}
