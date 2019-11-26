package kr.co.itcen.fa.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.Menu;
import kr.co.itcen.fa.repository.MenuRepository;
import kr.co.itcen.fa.vo.MenuVo;

@Service
public class MenuService {
	
	@Autowired
	private MenuRepository menuRepository;

	public void addMenu(MenuVo menuVo) {
		menuRepository.save(menuVo);
	}
	
	public List<MenuVo> getAllMainMenu(){
		return menuRepository.findAllByParentNoNull();
	}
	
	public List<Menu> getAllMenu() {
		List<Menu> result = new ArrayList<>();
		
		Menu mainMenu = null;
		List<MenuVo> list = menuRepository.findAll();
		for(MenuVo vo : list) {
			if(vo.getParentNo() == null) {
				mainMenu = new Menu(vo.getNo(), vo.getName(), vo.getLastUpdate());
				result.add(mainMenu);
				continue;
			}
			if(mainMenu != null) {
				mainMenu.addsubMenu(new Menu(vo.getNo(), vo.getName(), vo.getLastUpdate()));
			}
		}
		
		return result;
	}
}
