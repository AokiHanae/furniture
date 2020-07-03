package com.neusoft.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.neusoft.base.BaseController;
import com.neusoft.po.Car;
import com.neusoft.po.CategoryDto;
import com.neusoft.po.Item;
import com.neusoft.po.ItemCategory;
import com.neusoft.po.ItemUserNum;
import com.neusoft.po.Manage;
import com.neusoft.po.User;
import com.neusoft.service.CarService;
import com.neusoft.service.ItemCategoryService;
import com.neusoft.service.ItemOrderService;
import com.neusoft.service.ItemService;
import com.neusoft.service.ManageService;
import com.neusoft.service.UserService;
import com.neusoft.utils.CollaborativeAlgorithm;
import com.neusoft.utils.Pager;
import com.neusoft.utils.RedisUtil;

@Controller
@RequestMapping("/login")
public class LoginController  extends BaseController{
	
	@Autowired
	private ManageService manageService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ItemOrderService itemOrderService;
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private CarService carService;
	
	@Autowired
	private ItemCategoryService itemCategoryService;
	/**
	 * 跳转登陆
	 * @return
	 */
	@RequestMapping("/login")
	public String login(){
		return "login/mLogin";
	}
	@RequestMapping("/uLogin")
	public String uLogin(){
		return "login/uLogin";
	}
	
	@RequestMapping("/res")
	public String res(){
		return "login/res";
	}
	
	@RequestMapping("/toRes")
	public String toRes(User u){
		userService.insert(u);
		return "login/uLogin";
	}
	
	
	
	@RequestMapping("/uIndex")
	public String uIndex(Model model,Item item,String prices,Integer xl, HttpServletRequest request){
		String sql2 = "SELECT * FROM item_category WHERE isDelete = 0 and pid is null";
        sql2 += " ORDER BY ID DESC ";
        List<ItemCategory> fatherList = itemCategoryService.listBySqlReturnEntity(sql2);
		
		List<CategoryDto> list = new ArrayList<CategoryDto>();
		
		if (!CollectionUtils.isEmpty(fatherList)){
			
			for (ItemCategory ic : fatherList){
				CategoryDto dto = new CategoryDto();
				dto.setFather(ic);
				//查询儿子
				String sql3 = "SELECT * FROM item_category WHERE isDelete = 0 and pid = "+ic.getId();
				 List<ItemCategory> childrens = itemCategoryService.listBySqlReturnEntity(sql3);
				 dto.setChildrens(childrens);
				 list.add(dto);
			}
			
			System.out.println("====================================================");
			model.addAttribute("lbs",list);
		}
	
		//热销
		List<Item> listBySqlReturnEntity = itemService.listBySqlReturnEntity("SELECT * FROM item WHERE 1=1 and isDelete =0 order by gmNum desc limit 0,10");
		model.addAttribute("rxs",listBySqlReturnEntity);
		
		//折扣
		List<Item> zks = itemService.listBySqlReturnEntity("SELECT * FROM item WHERE 1=1 and isDelete =0 and zk is not null order by zk asc limit 0,10");
		model.addAttribute("zks",zks);
		
		//做推荐
		Object attribute = request.getSession().getAttribute("userId");
		if (attribute != null){
			Integer userId = Integer.valueOf(attribute.toString());
			//查询购物车中所有商品
			String sql = "SELECT * FROM car WHERE 1=1 and user_id = "+userId;
			List<Car> cars = carService.listBySqlReturnEntity(sql);
			
			Map<Integer,Object> map = new HashMap<Integer,Object>();
			if (!CollectionUtils.isEmpty(cars)){
				
				for (Car c : cars){
					map.put(c.getItem().getCategoryIdTwo(), 1);
				}
			}
			List<Integer> types = new ArrayList<Integer>();
			
			if (map.keySet() != null && map.keySet().size()>0){
				for (Integer key : map.keySet()) { 
					  System.out.println("Key = " + key);
					  types.add(key);
				} 
			}
			if (!CollectionUtils.isEmpty(types)){
				//数据库查询 in
			   List<Item> tjs = itemService.listtj(types);
			   model.addAttribute("tjs",tjs);
			}
		}
		
		//猜你喜欢商品列表
		Object loginUser = request.getSession().getAttribute("user");
		if(loginUser==null){
			List<Item> recommendList = itemService.listBySqlReturnEntity("SELECT * FROM item WHERE 1=1 and isDelete =0  order by id desc limit 0,5");
			model.addAttribute("recommendList",recommendList);
		}else{
			User user=(User) loginUser;
			List<Map<String, Object>> itemUserNumList = itemOrderService.getItemUserNumList();
			List<ItemUserNum> itemUserNums=new ArrayList<>();
			itemUserNumList.forEach(e->{
				ItemUserNum itemUserNum=new ItemUserNum();
				String userId = String.valueOf(e.get("user_id"));
				String itemId = String.valueOf(e.get("item_id"));
				String num = String.valueOf(e.get("num"));
				itemUserNum.setItemId(Integer.parseInt(itemId));
				itemUserNum.setNum(Integer.parseInt(num));
				itemUserNum.setUserId(Integer.parseInt(userId));
				itemUserNums.add(itemUserNum);
			});
			//返回的推荐列表
			List<Item> recommendList=new ArrayList<>();
			//获取的推荐商品ID
            List<String> calculateList = CollaborativeAlgorithm.calculate(user.getId(), itemUserNums);
			if(calculateList==null||calculateList.isEmpty()){
				recommendList = itemService.listBySqlReturnEntity("SELECT * FROM item WHERE 1=1 and isDelete =0  order by id desc limit 0,5");
			}else if(calculateList.size()>=5){
				List<String> subList = calculateList.subList(0, 5);
				recommendList = itemService.recommendListByIdList(subList);
			}else if(calculateList.size()<5){
				recommendList = itemService.recommendListByIdList(calculateList);
				List<Item> list2 = listBySqlReturnEntity.subList(0, 5 - calculateList.size());
				recommendList.addAll(list2);
			}

			model.addAttribute("recommendList",recommendList);
		}
	
		model.addAttribute("obj",item);
		model.addAttribute("prices",prices);
		model.addAttribute("xl",xl);
		return "login/uIndex";
	}
	
	
	
	@RequestMapping("/mtuichu")
	public String mtuichu(HttpServletRequest request){
		//request.getSession().invalidate();
		return "login/mLogin";
	}
	@RequestMapping("/welcome")
	private String welcome(){
		return "login/welcome";
	}
	
	@RequestMapping("/toLogin")
	public String toLogin(Manage manage, HttpServletRequest request, HttpServletResponse response){
		Manage byEntity = manageService.getByEntity(manage);
		if(byEntity == null){
			return "redirect:/login/mtuichu";
		}else{
			/*request.getSession().setAttribute("role", 1);
			request.getSession().setAttribute("username", byEntity.getUserName());
			request.getSession().setAttribute("userId", byEntity.getId());*/
		}
		return "login/mIndex";
	}
	
//	
//	
	@RequestMapping("/utoLogin")
	public String utoLogin(User manage, HttpServletRequest request, HttpServletResponse response){
		User byEntity = userService.getByEntity(manage);
		if(byEntity == null){
			return "redirect:/login/res.action";
		}else{
			request.getSession().setAttribute("role", 2);
			request.getSession().setAttribute("user",byEntity);
			request.getSession().setAttribute("username", byEntity.getUserName());
			request.getSession().setAttribute("userId", byEntity.getId());
		}
		return "redirect:/login/uIndex.action";
	}
//	
//	
	@RequestMapping("/pass")
	public String pass(HttpServletRequest request){
		Object attribute = request.getSession().getAttribute("userId");
		
	   	if (attribute == null){
	   		return "redirect:/login/uLogin.action";
		}
			Integer userId = Integer.valueOf(attribute.toString());
			
			User load = userService.load(userId);
			request.setAttribute("obj", load);
		return "login/pass";
	}
	
	@RequestMapping("/upass")
	@ResponseBody
	public String upass(HttpServletRequest request,String password){
      Object attribute = request.getSession().getAttribute("userId");
      JSONObject j = new  JSONObject();
	   	if (attribute == null){
	   		j.put("res", 0);
	   		return j.toString();
		}
			Integer userId = Integer.valueOf(attribute.toString());
			User load = userService.load(userId);
			load.setPassWord(password);
			userService.updateById(load);
			j.put("res", 1);
			return j.toString();
			
	}
	
	
	
	/**
	 * 退出
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/tuichu")
	public String tuichu( HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		session.invalidate();
		return "login/login";
	}
	@RequestMapping("/uTui")
	public String uTui( HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/login/uLogin.action";
	}
	

	@RequestMapping("/head")
	private String head(){
		return "inc/head";
	}
	
	@RequestMapping("/left")
	private String left(){
		return "inc/left";
	}
	
	@RequestMapping("/main")
	private String main(HttpServletRequest request){
		Object attribute = request.getSession().getAttribute("userId");
		if (attribute == null){
			return "redirect:/login/uLogin.action";
		}
		Integer userId = Integer.valueOf(attribute.toString());
		User load = userService.load(userId);
		request.setAttribute("user", load);
		return "login/main";
	}
	
	
	@RequestMapping("/info")
	private String info(HttpServletRequest request){
		Object attribute = request.getSession().getAttribute("userId");
		Integer userId = Integer.valueOf(attribute.toString());
		User load = userService.load(userId);
		request.setAttribute("user", load);
		return "login/info";
	}
}
