package com.spring.groupware.common;

import javax.servlet.http.HttpServletRequest;

public class MyUtil {

	public static String getCurrentURL(HttpServletRequest request) {

		String currentURL = request.getRequestURL().toString(); // URL 가져오기 (query 제외)
		String queryString = request.getQueryString(); // GET 방식일 때 "?" 뒷부분 내용, POST 일 때 null

		if (queryString != null) { // GET 방식일 때 URL에 query내용 붙이기
			currentURL += "?" + queryString;
		}

		String ctxPath = request.getContextPath(); // /Groupware
		int beginIndex = currentURL.indexOf(ctxPath) + ctxPath.length();
		// currentURL에서 ctxPath의 인덱스 + 해당 길이 만큼

		currentURL = currentURL.substring(beginIndex + 1);
		// "http://localhost:9090" 을 제외한 /Groupware 부터의 문자열

		return currentURL;
	}

	// **** 크로스 사이트 스크립트 공격에 대응하는 안전한 코드(시큐어 코드) 작성하기 **** //
	public static String secureCode(String str) {

		str = str.replaceAll("<", "&lt;");
		str = str.replaceAll(">", "&gt;");

		return str;
	}
}
