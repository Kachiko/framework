package org.personnel.kachiko.framework.utils;

import java.util.ArrayList;
import java.util.List;

import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;

public class DozerUtil {

	private static Mapper mapper = new DozerBeanMapper();
	private static List<String> mappingFiles;
	
	public static void setMapper(Mapper mapper){
		DozerUtil.mapper = mapper;
	}
	
	public static void setMapper(List<String> mappingFiles){
		mapper = new DozerBeanMapper(mappingFiles);
	}
	
	public static <T, U> List<U> map(final List<T> source, final Class<U> destType) {
		final List<U> dest = new ArrayList<U>();
		for (T element : source) {
			dest.add(mapper.map(element, destType));
		}
		return dest;
	}
	
	public static <T, U> U map(final T source, final Class<U> destType){
		return mapper.map(source, destType);
	}
	
	public static void addMappingFile(String mappingFile){
		mappingFiles.add(mappingFile);
		mapper = new DozerBeanMapper(mappingFiles);
	}
	
	public static void addMappingFiles(List<String> newMappingFiles){
		mappingFiles.addAll(newMappingFiles);
		mapper = new DozerBeanMapper(mappingFiles);
	}
}
