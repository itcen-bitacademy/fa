package kr.co.itcen.fa.controller.menu17.advice;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * @author 최웅
 * 메뉴17 어드바이스
 */
@ControllerAdvice(basePackages = {"kr.co.itcen.fa.controller.menu17"})
public class Menu17Advice {

	@ExceptionHandler(Exception.class)
	public String allExceptionHandler(HttpServletRequest request) throws UnsupportedEncodingException {
		String uri = request.getRequestURI().replace(request.getContextPath() + "/", "");
		String[] uriArr = uri.split("/");
		String returnUri = "redirect:/" + uriArr[0];
		
		if (uriArr.length >= 2) {
			returnUri = returnUri + "/" + uriArr[1];
		}
		
		returnUri = returnUri + "?error=" + URLEncoder.encode("알 수 없는 에러가 발생하였습니다.17", "UTF-8");
		
		return returnUri; 
	}
}
