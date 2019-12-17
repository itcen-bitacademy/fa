package kr.co.itcen.fa.security;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.itcen.fa.dto.Menu;
import kr.co.itcen.fa.service.MenuService;
import kr.co.itcen.fa.vo.UserVo;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	MenuService menuService;
	
	@Override
	public boolean preHandle(
		HttpServletRequest request,
		HttpServletResponse response,
		Object handler)
		throws Exception {
		
		// 1. handler 종류 확인
		if( handler instanceof HandlerMethod == false ) {
			return true;
		}
		
		// 2. Casting
		HandlerMethod handlerMethod = (HandlerMethod)handler;
		
		// 3. Method의 @Auth 받아오기
		Auth auth = handlerMethod.getMethodAnnotation(Auth.class);
		NoAuth noAuth = handlerMethod.getMethod().getAnnotation(NoAuth.class);
		
		if (noAuth != null) {
			// 4. Method에 @Auth가 붙어 있지 않으면, Class(Type)의 @Auth 받아오기  
			if(auth == null) {
				auth = handlerMethod.getMethod().getDeclaringClass().getAnnotation( Auth.class );
			}
			
			// 5. Method와 Type에 @Auth가 없음 
			if(auth == null) {
				return true;
			}
		}
		
		// 6. @Auth가 있기 때문에 인증 여부 확인 필요
		HttpSession session = request.getSession();
		UserVo authUser = null;
		if( session != null ) {
			authUser = (UserVo)session.getAttribute( "authUser" );
		}

		if( authUser == null ) {
			response.sendRedirect( request.getContextPath() + "/user/login" );
			return false;
		}

		// 7. Access Control
		Long mainMenuNo =  authUser.getMenuNo();
		String accessMenu = String.format("%02d", mainMenuNo);
		
		String mainMenuCode = ""; 
		String subMenuCode = "";
		String[] paths = request.getRequestURI().split("/");
		for(String s : paths) {
			System.out.println("---" + s + "---");
		}
		
		if(paths.length > 2 && paths[2].matches("\\d{2}")) {
			mainMenuNo = Long.valueOf(paths[2]);
			mainMenuCode = paths[2];
		}
		
		if(paths.length > 3 && paths[3].matches("\\d{2}")) {
			subMenuCode = paths[3];
		}

		// 7-0. 메뉴정보 Request Scope에 저장
		Map<String, Object> menuInfo = new HashMap<>();
		request.setAttribute("menuInfo", menuInfo);
		
		// 7-1. 메뉴 가져오기
		List<Menu> menus = menuService.getAllMenu();
		List<Menu> subMenus = null;
		for(Menu menu : menus) {
//			if(menu.getNo() == mainMenuNo) {
			Long mainMenuNo2 = (mainMenuCode == null || mainMenuCode.isEmpty()) ? mainMenuNo : Long.valueOf(mainMenuCode);
			if(menu.getNo() == mainMenuNo2) {
				subMenus = menu.getSubMenus();
				break;
			}
		}
		menuInfo.put("mainMenus", menus);
		
		// 7-2. 메뉴매핑이 안되어 있으면 통과
		if("".equals(mainMenuCode)) {
			return true; 
		}

		menuInfo.put("subMenus", subMenus);
		menuInfo.put("mainMenuCode", mainMenuCode);
		menuInfo.put("mainMenuNo", mainMenuNo);
		
		// 7-3. 메뉴매핑이 되어있으면 접근 메뉴 확인!
//		if(!accessMenu.equals(mainMenuCode)) {
		if(noAuth == null && !accessMenu.equals(mainMenuCode)) {
			response.sendRedirect( request.getContextPath() + "/error/403" );
			return false;
		}
		
		// 7-4. 서브메뉴 확인
		Long subMenuNo = 0L;
		if(!"".equals(subMenuCode)) {
			subMenuNo = Long.parseLong(subMenuCode);
		} else {
			Menu menu = subMenus.get(0);
			subMenuCode = menu.getCode();
			subMenuNo = menu.getNo();
		} 
		menuInfo.put("subMenuCode", subMenuCode);
		menuInfo.put("subMenuNo", subMenuNo);

		System.out.println(mainMenuCode + ":" + subMenuCode);

		return true;
	}
}