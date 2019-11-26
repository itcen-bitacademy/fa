package kr.co.itcen.fa.exception;

import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.itcen.fa.dto.JSONResult;

//@ControllerAdvice
public class GlobalExceptionHandler {
	
	private static final Log Log = LogFactory.getLog( GlobalExceptionHandler.class );
    
	@ExceptionHandler(Exception.class)
	public void handlerException(
		HttpServletRequest request,
		HttpServletResponse response,
		Exception e) throws Exception {
		
		//1. 로깅
		StringWriter errors = new StringWriter();
		e.printStackTrace(new PrintWriter(errors));
		Log.error(errors.toString());

		//2. 요청 구분
		// 만약 JSON 요청인 경우는 application/json
		String accept = request.getHeader("accept");
		if(accept.matches(".*application/json.*")) {
			//3. json 응답
			response.setStatus(HttpServletResponse.SC_OK);
			
			JSONResult jsonResult = JSONResult.fail(errors.toString());
			String result = new ObjectMapper().writeValueAsString(jsonResult);
			
			OutputStream os = response.getOutputStream();
			os.write(result.getBytes("utf-8"));
			os.close();
		} else {
			response.sendRedirect(request.getContextPath() + "/error/500");
		}
	}
}
