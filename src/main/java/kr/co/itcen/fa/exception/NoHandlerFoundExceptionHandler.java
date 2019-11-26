package kr.co.itcen.fa.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class NoHandlerFoundExceptionHandler {
	
    @ExceptionHandler(NoHandlerFoundException.class)
    public void handleException404(
    	HttpServletRequest request,
    	HttpServletResponse response,
    	NoHandlerFoundExceptionHandler e)  throws Exception {
    	response.sendRedirect(request.getContextPath() + "/error/404");
    }
}
