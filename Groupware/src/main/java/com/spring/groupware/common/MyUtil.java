package com.spring.groupware.common;

import javax.servlet.http.HttpServletRequest;

public class MyUtil {

	public static String getCurrentURL(HttpServletRequest request) {

		String currentURL = request.getRequestURL().toString(); // URL �������� (query ����)
		String queryString = request.getQueryString(); // GET ����� �� "?" �޺κ� ����, POST �� �� null

		if (queryString != null) { // GET ����� �� URL�� query���� ���̱�
			currentURL += "?" + queryString;
		}

		String ctxPath = request.getContextPath(); // /Groupware
		int beginIndex = currentURL.indexOf(ctxPath) + ctxPath.length();
		// currentURL���� ctxPath�� �ε��� + �ش� ���� ��ŭ

		currentURL = currentURL.substring(beginIndex + 1);
		// "http://localhost:9090" �� ������ /Groupware ������ ���ڿ�

		return currentURL;
	}

	// **** ũ�ν� ����Ʈ ��ũ��Ʈ ���ݿ� �����ϴ� ������ �ڵ�(��ť�� �ڵ�) �ۼ��ϱ� **** //
	public static String secureCode(String str) {

		str = str.replaceAll("<", "&lt;");
		str = str.replaceAll(">", "&gt;");

		return str;
	}
}
