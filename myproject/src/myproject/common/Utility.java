package myproject.common;

import java.util.Date;

public class Utility {
	public static final String UP_PATH = "pds_upload";
	public static final String TEST_DIR = "C:\\gittest\\myproject\\WebContent\\pds_upload";
	
	
	
	public static String displayFile(String fileName){
		String result = "";
		
		if(fileName!= null && !fileName.isEmpty()){
			result = "<img src='../images/file.gif' alt = '파일이미지'>";
		} else{
			result = "";
		}
		return result;
	}
	
	public static String displayNew(Date regdate){
		Date today = new Date();
		
		long gap = (today.getTime()-regdate.getTime())/1000;
		
		gap = gap/(60*60);
		String result = "";
		if(gap<24){
			result = "<img src='../images/new.gif'>";
		}
		return result;
	}
	
	public static String displayRe(int step){
		String result = "";
		if(step>0){
			for(int j = 0; j<step; j++){
				result +="&nbsp";
			}
			result += "<img src ='../images/re.gif'>";
		}
		return result;
	}
}
