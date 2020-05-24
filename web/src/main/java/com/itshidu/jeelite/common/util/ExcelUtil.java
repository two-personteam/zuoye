package com.itshidu.jeelite.common.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

/**
 * 
 * @author Master.Xia
 */
public class ExcelUtil {
	
	public static void main(String[] args) throws IllegalAccessException, InvocationTargetException, InstantiationException, SecurityException, NoSuchMethodException {
		/*File f = new File("d:/user.xls");
		String[] colnames = new String[]{"id","username","password","realname","email","state"};
		List<User> list = ExcelUtil.parse(User.class, colnames, f);
		for(User usr : list){
			System.out.println(usr.getUsername());
			System.out.println(usr.getPassword());
			System.out.println(usr.getRealname());
			System.out.println(usr.getEmail());
			System.out.println(usr.getState());
			System.out.println("---------------------");
		}*/
	}
	
	public static <T> List<T> parse(Class<T> cc,String[] colnames,File file) throws IllegalAccessException, InvocationTargetException, InstantiationException, SecurityException, NoSuchMethodException {
		List<T> list = new ArrayList<T>();
		List<String[]> data = parse(file);
        for (int i = 0; i < data.size(); i++) {
        	String[] row = data.get(i);
        	Map<String, Object> map = new HashMap<String, Object>();
            for(int k=0;k<row.length;k++){
            	map.put(colnames[k], row[k]);
            }
            T bean = BeanHelper.bean(map, cc);
            list.add(bean);
        }
		return list;
	}
	public static List<String[]> parse(File file) throws IllegalAccessException, InvocationTargetException, InstantiationException, SecurityException, NoSuchMethodException{
		List<String[]> list = new ArrayList<String[]>();
		try {
			HSSFWorkbook wookbook = new HSSFWorkbook(new FileInputStream(file));
			HSSFSheet sheet = wookbook.getSheetAt(0);
			int rows = sheet.getPhysicalNumberOfRows();
			int cols = sheet.getRow(0).getPhysicalNumberOfCells();
			// 遍历行,索引从0 开始，第0行可用作表头，不获取。
			for (int i = 1; i < rows; i++) {
				// 读取左上端单元格
				HSSFRow row = sheet.getRow(i);
				// 行不为空
				if (row != null) {
					// 获取到Excel文件中的所有的列
					String value = "";
					// 防止当使用POI处理excel的时候cell.getNumbericCellValue()
					// 当长度大一点的时候会变成科学计数法形式。
					DecimalFormat df = new DecimalFormat("0");
					// ***下方3为cells的值，更换为固定列数，解决空值问题***
					for (int j = 0; j < cols; j++) {
						HSSFCell cell = row.getCell(j);
						if (cell != null) {
							row.getCell(j).setCellType(HSSFCell.CELL_TYPE_STRING);
							value += cell.getStringCellValue() + ",";
						} else {
							value += "#" + ",";
						}
					}
					String[] val = value.split(",");
					String[] arr = new String[cols];
					for(int k=0;k<cols;k++){
						arr[k]=val[k];
					}
					list.add(arr);
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}
}
