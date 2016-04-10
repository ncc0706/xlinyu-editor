package com.qq;

import java.io.File;

public class TestQQ {
	
	public static void getFileList(String strPath) {
		File dir = new File(strPath);
		StringBuilder sb = new StringBuilder();
		File[] files = dir.listFiles(); // 该文件目录下文件全部放入数组
		if (files != null) {
			for (int i = 0; i < files.length; i++) {
				String fileName = files[i].getName();
//				System.out.println(fileName);
				sb.append("'"+fileName+"',");
			}
			
		}
		System.out.println(sb.toString());
	}

	public static void main(String[] args) {
		getFileList("D:\\c\\workspace\\jat\\xlinyu-editor\\src\\main\\webapp\\static\\ckeditor\\plugins\\smiley\\qq");
	}
}
