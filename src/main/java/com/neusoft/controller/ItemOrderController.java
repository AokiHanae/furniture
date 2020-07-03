package com.neusoft.controller;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.neusoft.base.BaseController;
import com.neusoft.po.*;
import com.neusoft.utils.Pager;
import java.util.*;

import com.neusoft.po.*;
import com.neusoft.mapper.*;
import com.neusoft.service.*;




@Controller
@RequestMapping("/itemOrder")
public class ItemOrderController extends BaseController {
	@Autowired
	private ItemService itemService;
	/**
	 * 依赖注入 start dao/service/===
	 */
	@Autowired
	private UserService userService;
	@Autowired
	private CarService carService;
	@Autowired
	private ItemOrderService itemOrderService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private AddressService addressService;
	@Autowired
	private OrderDetailService orderDetailService;
	// --------------------------------------- 华丽分割线 ------------------------------
	
	/*********************************查询列表【不分页】***********************************************/
	
	/**
	 * 【不分页 => 查询列表 => 无条件】
	* @Title: listAll 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @return 设定文件 
	* @author
	* @return String 返回类型 
	* @throws
	 */
	@RequestMapping(value = "/listAll")
	public String listAll(ItemOrder itemOrder, Model model, HttpServletRequest request, HttpServletResponse response){
		List<ItemOrder> listAll = itemOrderService.listAll();
		model.addAttribute("list", listAll);
		return "itemOrder/itemOrder";
	}
	
	/**
	 *  【不分页=》查询列表=>有条件】
	* @Title: listByEntity 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @return 设定文件 
	* @author
	* @return String 返回类型 
	* @throws
	 */
	@RequestMapping(value = "/listByEntity")
	public String listByEntity(ItemOrder itemOrder, Model model, HttpServletRequest request, HttpServletResponse response){
		List<ItemOrder> listAll = itemOrderService.listAllByEntity(itemOrder);
		model.addAttribute("list", listAll);
		return "itemOrder/itemOrder";
	}
	
	/**
	 *  【不分页=》查询列表=>有条件】
	* @Title: listByMap 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @return 设定文件 
	* @author 
	* @return String 返回类型 
	* @throws
	 */
	@RequestMapping(value = "/listByMap")
	public String listByMap(ItemOrder itemOrder, Model model, HttpServletRequest request, HttpServletResponse response){
		//通过map查询
		Map<String,Object> params = new HashMap<String,Object>();
	        if(!isEmpty(itemOrder.getItemId())){
	        	params.put("itemId", itemOrder.getItemId());
			}
	        if(!isEmpty(itemOrder.getUserId())){
	        	params.put("userId", itemOrder.getUserId());
			}
	        if(!isEmpty(itemOrder.getCode())){
	        	params.put("code", itemOrder.getCode());
			}
	        if(!isEmpty(itemOrder.getAddTime())){
	        	params.put("addTime", itemOrder.getAddTime());
			}
	        if(!isEmpty(itemOrder.getTotal())){
	        	params.put("total", itemOrder.getTotal());
			}
	        if(!isEmpty(itemOrder.getIsDelete())){
	        	params.put("isDelete", itemOrder.getIsDelete());
			}
	        if(!isEmpty(itemOrder.getStatus())){
	        	params.put("status", itemOrder.getStatus());
			}
	    List<ItemOrder> listAll = itemOrderService.listByMap(params);
		model.addAttribute("list", listAll);
		return "itemOrder/itemOrder";
	}
	
	
	/*********************************查询列表【分页】***********************************************/
	
	
	
	/**
	 * 分页查询 返回list对象(通过对象)
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/findByObj")
	public String findByObj(ItemOrder itemOrder, Model model, HttpServletRequest request, HttpServletResponse response) {
		//分页查询
		Pager<ItemOrder> pagers = itemOrderService.findByEntity(itemOrder);
		model.addAttribute("pagers", pagers);
		//存储查询条件
		model.addAttribute("obj", itemOrder);
		return "itemOrder/itemOrder";
	}
	
	/**
	 * 分页查询 返回list对象(通过对By Sql)
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/findBySql")
	public String findBySql(ItemOrder itemOrder, Model model, HttpServletRequest request, HttpServletResponse response) {
		//分页查询
		String sql = "SELECT * FROM item_order WHERE 1=1 ";
        if(!isEmpty(itemOrder.getItemId())){
        	sql += " and itemId like '%"+itemOrder.getItemId()+"%'";
		}
        if(!isEmpty(itemOrder.getUserId())){
        	sql += " and userId like '%"+itemOrder.getUserId()+"%'";
		}
        if(!isEmpty(itemOrder.getCode())){
        	sql += " and code like '%"+itemOrder.getCode()+"%'";
		}
        if(!isEmpty(itemOrder.getAddTime())){
        	sql += " and addTime like '%"+itemOrder.getAddTime()+"%'";
		}
        if(!isEmpty(itemOrder.getTotal())){
        	sql += " and total like '%"+itemOrder.getTotal()+"%'";
		}
        if(!isEmpty(itemOrder.getIsDelete())){
        	sql += " and isDelete like '%"+itemOrder.getIsDelete()+"%'";
		}
        if(!isEmpty(itemOrder.getStatus())){
        	sql += " and status like '%"+itemOrder.getStatus()+"%'";
		}
       sql += " ORDER BY ID DESC ";
		Pager<ItemOrder> pagers = itemOrderService.findBySqlRerturnEntity(sql);
		model.addAttribute("pagers", pagers);
		//存储查询条件
		model.addAttribute("obj", itemOrder);
		return "itemOrder/itemOrder";
	}
	
	
	
	@RequestMapping(value = "/my")
	public String my(ItemOrder itemOrder, Model model, HttpServletRequest request, HttpServletResponse response) {
		//分页查询
		Object attribute = request.getSession().getAttribute("userId");
		if (attribute == null){
			return "redirect:/login/uLogin";
		}
		JSONObject js = new JSONObject();
		Integer userId = Integer.valueOf(attribute.toString());
		String sql = "SELECT * FROM item_order WHERE 1=1 and user_id="+userId;
        sql += " ORDER BY ID DESC ";
		
      //  0.新建代发货1.已取消 2已发货3.到收货
        
		List<ItemOrder> all = itemOrderService.listBySqlReturnEntity(sql);
		
		//待发货
		String sql2 = "SELECT * FROM item_order WHERE status = 0 and user_id="+userId;
        sql2 += " ORDER BY ID DESC ";
        List<ItemOrder> dfh = itemOrderService.listBySqlReturnEntity(sql2);
        
        //已取消
    	String sql3 = "SELECT * FROM item_order WHERE status = 1 and user_id="+userId;
        sql3 += " ORDER BY ID DESC ";
        List<ItemOrder> yqx = itemOrderService.listBySqlReturnEntity(sql3);
        
        
        //已发货
    	String sql4 = "SELECT * FROM item_order WHERE status = 2 and user_id="+userId;
        sql4 += " ORDER BY ID DESC ";
        List<ItemOrder> yfh = itemOrderService.listBySqlReturnEntity(sql4);
        
        
        //已收货
    	String sql5 = "SELECT * FROM item_order WHERE status = 3 and user_id="+userId;
        sql5 += " ORDER BY ID DESC ";
        List<ItemOrder> ysh = itemOrderService.listBySqlReturnEntity(sql5);
        
        //已评价
        String sql6 = "SELECT * FROM item_order WHERE status = 4 and user_id="+userId;
        sql6 += " ORDER BY ID DESC ";
        List<ItemOrder> ypj = itemOrderService.listBySqlReturnEntity(sql6);
        
        //退货待确认
        String sql7 = "SELECT * FROM item_order WHERE status = 5 and user_id="+userId;
        sql7 += " ORDER BY ID DESC ";
        List<ItemOrder> dth = itemOrderService.listBySqlReturnEntity(sql7);
        
        //退货已确认
        String sql8 = "SELECT * FROM item_order WHERE status = 6 and user_id="+userId;
        sql8 += " ORDER BY ID DESC ";
        List<ItemOrder> yth = itemOrderService.listBySqlReturnEntity(sql8);
        
		model.addAttribute("all", all);
		model.addAttribute("dfh", dfh);
		model.addAttribute("yqx", yqx);
		model.addAttribute("yfh", yfh);
		model.addAttribute("ysh", ysh);
		model.addAttribute("ypj", ypj);
		model.addAttribute("dth", dth);
		model.addAttribute("yth", yth);
		//存储查询条件
		model.addAttribute("obj", itemOrder);
		return "itemOrder/my";
	}
	
	
	/**
	 * 分页查询 返回list对象(通过Map)
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/findByMap")
	public String findByMap(ItemOrder itemOrder, Model model, HttpServletRequest request, HttpServletResponse response) {
		//通过map查询
		Map<String,Object> params = new HashMap<String,Object>();
        if(!isEmpty(itemOrder.getItemId())){
        	params.put("itemId", itemOrder.getItemId());
		}
        if(!isEmpty(itemOrder.getUserId())){
        	params.put("userId", itemOrder.getUserId());
		}
        if(!isEmpty(itemOrder.getCode())){
        	params.put("code", itemOrder.getCode());
		}
        if(!isEmpty(itemOrder.getAddTime())){
        	params.put("addTime", itemOrder.getAddTime());
		}
        if(!isEmpty(itemOrder.getTotal())){
        	params.put("total", itemOrder.getTotal());
		}
        if(!isEmpty(itemOrder.getIsDelete())){
        	params.put("isDelete", itemOrder.getIsDelete());
		}
        if(!isEmpty(itemOrder.getStatus())){
        	params.put("status", itemOrder.getStatus());
		}
		//分页查询
		Pager<ItemOrder> pagers = itemOrderService.findByMap(params);
		model.addAttribute("pagers", pagers);
		//存储查询条件
		model.addAttribute("obj", itemOrder);
		return "itemOrder/itemOrder";
	}
	
	/**********************************【增删改】******************************************************/
	
	/**
	 * 跳至添加页面
	 * @return
	 */
	@RequestMapping(value = "/add")
	public String add() {
		return "itemOrder/add";
	}

	/**
	 * 跳至详情页面
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String view(Integer id,Model model) {
		ItemOrder obj = itemOrderService.load(id);
		model.addAttribute("obj",obj);
		return "itemOrder/view";
	}
	@RequestMapping(value = "/qx")
	public String qx(Integer id,Model model) {
		ItemOrder obj = itemOrderService.load(id);
		obj.setStatus(1);
		itemOrderService.updateById(obj);
		model.addAttribute("obj",obj);
		return "redirect:/itemOrder/my";
	}
	
	@RequestMapping(value = "/sh")
	public String sh(Integer id,Model model) {
		ItemOrder obj = itemOrderService.load(id);
		obj.setStatus(3);
		itemOrderService.updateById(obj);
		model.addAttribute("obj",obj);
		return "redirect:/itemOrder/my";
	}
	
	@RequestMapping(value = "/th")
	public String th(Integer id,Model model) {
		model.addAttribute("id",id);
		return "itemOrder/th";
	}
	@RequestMapping(value = "/thDetail")
	public String thDetail(Integer id,Model model) {
		ItemOrder itemOrder = itemOrderService.load(id);
		model.addAttribute("itemOrder",itemOrder);
		return "itemOrder/thDetail";
	}
	@RequestMapping(value = "/thUpadte")
	public String thUpadte(Integer id,String refundWay,String remark,String content,Model model) {
		//将该订单状态设为5 退货待确认
		ItemOrder load = itemOrderService.load(id);
		load.setStatus(5);
		load.setContent(content);
		load.setRefundWay(refundWay);
		load.setRemark(remark.trim());
		itemOrderService.updateById(load);
		Map<String , Object> map = new HashMap<String,Object>();
		map.put("orderId", id);
		List<OrderDetail> listByMap = orderDetailService.listByMap(map);
		for(OrderDetail orderDetail:listByMap){
			//已退货待卖家确认
			orderDetail.setStatus(1);
			orderDetailService.updateById(orderDetail);
		}
		return "redirect:/itemOrder/my";
	}
	
	
	@RequestMapping(value = "/fh")
	public String fh(Integer id,Model model) {
		ItemOrder obj = itemOrderService.load(id);
		obj.setStatus(2);
		itemOrderService.updateById(obj);
		model.addAttribute("obj",obj);
		return "redirect:/itemOrder/findBySql";
	}
	@RequestMapping(value = "/thConfirm")
	public String thConfirm(Integer id,Model model) {
		ItemOrder obj = itemOrderService.load(id);
		obj.setStatus(6);
		itemOrderService.updateById(obj);
		model.addAttribute("obj",obj);
		return "redirect:/itemOrder/findBySql";
	}
	
	
	@RequestMapping(value = "/pj")
	public String pj(Integer id,Integer orderId, Model model) {
		model.addAttribute("id",id);
		model.addAttribute("orderId",orderId);
		return "itemOrder/pj";
	}
	
	/**
	 * 添加执行
	 * @return
	 */
	@RequestMapping(value = "/exAdd")
	@ResponseBody
	public String exAdd(@RequestBody List<CarDto> list, Model model, HttpServletRequest request, HttpServletResponse response) {
		
		
		//itemOrderService.insert(itemOrder);
		Object attribute = request.getSession().getAttribute("userId");
		JSONObject js = new JSONObject();
		if (attribute == null){
			js.put("res", 0);
			return js.toJSONString();
		}
		Integer userId = Integer.valueOf(attribute.toString());
		User byId = userService.getById(userId);
		
		if (StringUtils.isEmpty(byId.getAddress())){
			js.put("res", 2);
			return js.toJSONString();
		}
		List<Integer> ids = new ArrayList<Integer>();
		
		double to = 0.0;
		for (CarDto c : list){
			ids.add(c.getId());
			Car load = carService.load(c.getId());
			to += load.getPrice()*c.getNum();
		}
		ItemOrder order= new ItemOrder();
		order.setStatus(0);
		order.setCode(getOrderNo());
		order.setIsDelete(0);
		order.setTotal(String.valueOf(to));
		order.setUserId(userId);
		order.setAddTime(new Date());
		itemOrderService.insert(order);
		//删除购车
		if (!CollectionUtils.isEmpty(ids)){
			for (CarDto c : list){
				Car load = carService.load(c.getId());
				OrderDetail de = new OrderDetail();
				de.setItemId(load.getItemId());
				de.setOrderId(order.getId());
				de.setStatus(0);
				de.setNum(c.getNum());
				de.setTotal(String.valueOf(c.getNum()*c.getNum()));
				orderDetailService.insert(de);
				//修改成交数
				Item load2 = itemService.load(load.getItemId());
				load2.setGmNum(load2.getGmNum()+c.getNum());
				//设置库存数
				load2.setStock(load2.getStock()-c.getNum());;
				itemService.updateById(load2);
				carService.deleteById(c.getId());
			}
		}
		js.put("res", 1);
		js.put("id", order.getId());
		js.put("code", order.getCode());
		return js.toJSONString();
	}
	private static String date ;
	private static long orderNum = 0l; 
     public static synchronized String getOrderNo() {    
         String str = new SimpleDateFormat("yyyyMMddHHmm").format(new Date());    
         if(date==null||!date.equals(str)){    
             date = str;    
             orderNum  = 0l;    
         }    
         orderNum ++;    
         long orderNo = Long.parseLong((date)) * 10000;    
         orderNo += orderNum;;    
         return orderNo+"";    
     }    
	
	/**
	 * 跳至修改页面
	 * @return
	 */
	@RequestMapping(value = "/update")
	public String update(Integer id,Model model) {
		ItemOrder obj = itemOrderService.load(id);
		model.addAttribute("obj",obj);
		return "itemOrder/update";
	}
	@RequestMapping(value = "/pay")
	public String pay(Integer id,Model model) {
		ItemOrder obj = itemOrderService.load(id);
	//	Integer addressId = obj.getAddressId();
//		Address load = addressService.load(addressId);
//		model.addAttribute("obj",obj);
//		model.addAttribute("address", load);
		return "itemOrder/pay";
	}
	
	/**
	 * 添加修改
	 * @return
	 */
	@RequestMapping(value = "/exUpdate")
	public String exUpdate(ItemOrder itemOrder, Model model, HttpServletRequest request, HttpServletResponse response) {
		//1.通过实体类修改，可以多传修改条件
		itemOrderService.updateById(itemOrder);
		//2.通过主键id修改
		//itemOrderService.updateById(itemOrder);
		return "redirect:/itemOrder/findBySql.action";
	}
	
	/**
	 * 删除通过主键
	 * @return
	 */
	@RequestMapping(value = "/delete")
	public String delete(Integer id, Model model, HttpServletRequest request, HttpServletResponse response) {
		///1.通过主键删除
		itemOrderService.deleteById(id);
		/*以下是多种删除方式*/
//		//2.通过实体条件删除
//		itemOrderService.deleteByEntity(itemOrder);
//		//3.通过参数删除
//     //通过map查询
//		Map<String,Object> params = new HashMap<String,Object>();
//		
//        if(!isEmpty(itemOrder.getItemId())){
//        	params.put("itemId", itemOrder.getItemId());
//		}
//       
//        if(!isEmpty(itemOrder.getUserId())){
//        	params.put("userId", itemOrder.getUserId());
//		}
//       
//        if(!isEmpty(itemOrder.getCode())){
//        	params.put("code", itemOrder.getCode());
//		}
//       
//        if(!isEmpty(itemOrder.getAddTime())){
//        	params.put("addTime", itemOrder.getAddTime());
//		}
//       
//        if(!isEmpty(itemOrder.getTotal())){
//        	params.put("total", itemOrder.getTotal());
//		}
//       
//        if(!isEmpty(itemOrder.getIsDelete())){
//        	params.put("isDelete", itemOrder.getIsDelete());
//		}
//       
//        if(!isEmpty(itemOrder.getStatus())){
//        	params.put("status", itemOrder.getStatus());
//		}
//       
//		itemOrderService.deleteByMap(params);
//		//4.状态删除
//		ItemOrder load = itemOrderService.getById(itemOrder.getId())
//		load.setIsDelete(1);
//		itemOrderService.update(load);
		//5.状态删除
		//ItemOrder load = itemOrderService.load(id);
		//load.setIsDelete(1);
		//itemOrderService.update(load);
		return "redirect:/itemOrder/findBySql.action";
	}
	
	// --------------------------------------- 华丽分割线 ------------------------------
	// --------------------------------------- 【下面是ajax操作的方法。】 ------------------------------

	/*********************************查询列表【不分页】***********************************************/
	
	/**
	 * 【不分页 => 查询列表 => 无条件】
	* @Title: listAll 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @return 设定文件 
	* @author
	* @return String 返回类型 
	* @throws
	 */
	@RequestMapping(value = "/listAllJson", method = RequestMethod.POST)
	@ResponseBody
	public String listAllJson(ItemOrder itemOrder, HttpServletRequest request, HttpServletResponse response){
		List<ItemOrder> listAll = itemOrderService.listAll();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("list", listAll);
		jsonObject.put("obj", itemOrder);
		return jsonObject.toString();
	}
	
	/**
	 *  【不分页=》查询列表=>有条件】
	* @Title: listByEntity 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @return 设定文件 
	* @author
	* @return String 返回类型 
	* @throws
	 */
	@RequestMapping(value = "/listByEntityJson", method = RequestMethod.POST)
	@ResponseBody
	public String listByEntityJson(ItemOrder itemOrder,  HttpServletRequest request, HttpServletResponse response){
		List<ItemOrder> listAll = itemOrderService.listAllByEntity(itemOrder);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("list", listAll);
		jsonObject.put("obj", itemOrder);
		return jsonObject.toString();
	}
	
	/**
	 *  【不分页=》查询列表=>有条件】
	* @Title: listByMap 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @return 设定文件 
	* @author 
	* @return String 返回类型 
	* @throws
	 */
	@RequestMapping(value = "/listByMapJson", method = RequestMethod.POST)
	@ResponseBody
	public String listByMapJson(ItemOrder itemOrder,HttpServletRequest request, HttpServletResponse response){
		//通过map查询
		Map<String,Object> params = new HashMap<String,Object>();
	        if(!isEmpty(itemOrder.getItemId())){
	        	params.put("itemId", itemOrder.getItemId());
			}
	        if(!isEmpty(itemOrder.getUserId())){
	        	params.put("userId", itemOrder.getUserId());
			}
	        if(!isEmpty(itemOrder.getCode())){
	        	params.put("code", itemOrder.getCode());
			}
	        if(!isEmpty(itemOrder.getAddTime())){
	        	params.put("addTime", itemOrder.getAddTime());
			}
	        if(!isEmpty(itemOrder.getTotal())){
	        	params.put("total", itemOrder.getTotal());
			}
	        if(!isEmpty(itemOrder.getIsDelete())){
	        	params.put("isDelete", itemOrder.getIsDelete());
			}
	        if(!isEmpty(itemOrder.getStatus())){
	        	params.put("status", itemOrder.getStatus());
			}
	    List<ItemOrder> listAll = itemOrderService.listByMap(params);
	    JSONObject jsonObject = new JSONObject();
		jsonObject.put("list", listAll);
		jsonObject.put("obj", itemOrder);
		return jsonObject.toString();
	}
	
	
	/**
	 * 分页查询 返回list json(通过对象)
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/findByObjJson", method = RequestMethod.POST)
	@ResponseBody
	public String findByObjByEntityJson(ItemOrder itemOrder, HttpServletRequest request, HttpServletResponse response) {
		//分页查询
		Pager<ItemOrder> pagers = itemOrderService.findByEntity(itemOrder);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("pagers", pagers);
		jsonObject.put("obj", itemOrder);
		return jsonObject.toString();
	}
	
	  
	/**
	 * 分页查询 返回list json(通过Map)
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/findByMapJson",  method = RequestMethod.POST)
	@ResponseBody
	public String findByMapJson(ItemOrder itemOrder,HttpServletRequest request, HttpServletResponse response) {
		//通过map查询
		Map<String,Object> params = new HashMap<String,Object>();
        if(!isEmpty(itemOrder.getItemId())){
        	params.put("itemId", itemOrder.getItemId());
		}
        if(!isEmpty(itemOrder.getUserId())){
        	params.put("userId", itemOrder.getUserId());
		}
        if(!isEmpty(itemOrder.getCode())){
        	params.put("code", itemOrder.getCode());
		}
        if(!isEmpty(itemOrder.getAddTime())){
        	params.put("addTime", itemOrder.getAddTime());
		}
        if(!isEmpty(itemOrder.getTotal())){
        	params.put("total", itemOrder.getTotal());
		}
        if(!isEmpty(itemOrder.getIsDelete())){
        	params.put("isDelete", itemOrder.getIsDelete());
		}
        if(!isEmpty(itemOrder.getStatus())){
        	params.put("status", itemOrder.getStatus());
		}
		//分页查询
		Pager<ItemOrder> pagers = itemOrderService.findByMap(params);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("pagers", pagers);
		jsonObject.put("obj", itemOrder);
		return jsonObject.toString();
	}
	
	
	/**
	 * ajax 添加
	 * @param 
	 * @return
	 */
	@RequestMapping(value = "/exAddJson", method = RequestMethod.POST)
	@ResponseBody
	public String exAddJson(ItemOrder itemOrder, Model model, HttpServletRequest request, HttpServletResponse response) {
		itemOrderService.insert(itemOrder);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("message", "添加成功");
		return jsonObject.toString();
	}
	

	/**
	 * ajax 修改
	 * @param 
	 * @return
	 */
	@RequestMapping(value = "/exUpdate.json", method = RequestMethod.POST)
	@ResponseBody
	public String exUpdateJson(ItemOrder itemOrder, Model model, HttpServletRequest request, HttpServletResponse response) {
		//1.通过实体类修改，可以多传修改条件
		itemOrderService.updateById(itemOrder);
		//2.通过主键id修改
		//itemOrderService.updateById(itemOrder);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("message", "修改成功");
		return jsonObject.toString();
	}

	/**
	 * ajax 删除
	 * @return
	 */
	@RequestMapping(value = "/delete.json", method = RequestMethod.POST)
	@ResponseBody
	public String exDeleteJson(Integer id, Model model, HttpServletRequest request, HttpServletResponse response) {
		///1.通过主键删除
		itemOrderService.deleteById(id);
		/*以下是多种删除方式*/
//		//2.通过实体条件删除
//		itemOrderService.deleteByEntity(itemOrder);
//		//3.通过参数删除
//        //通过map查询
//		Map<String,Object> params = new HashMap<String,Object>();
//		
//        if(!isEmpty(itemOrder.getItemId())){
//        	params.put("itemId", itemOrder.getItemId());
//		}
//       
//        if(!isEmpty(itemOrder.getUserId())){
//        	params.put("userId", itemOrder.getUserId());
//		}
//       
//        if(!isEmpty(itemOrder.getCode())){
//        	params.put("code", itemOrder.getCode());
//		}
//       
//        if(!isEmpty(itemOrder.getAddTime())){
//        	params.put("addTime", itemOrder.getAddTime());
//		}
//       
//        if(!isEmpty(itemOrder.getTotal())){
//        	params.put("total", itemOrder.getTotal());
//		}
//       
//        if(!isEmpty(itemOrder.getIsDelete())){
//        	params.put("isDelete", itemOrder.getIsDelete());
//		}
//       
//        if(!isEmpty(itemOrder.getStatus())){
//        	params.put("status", itemOrder.getStatus());
//		}
//       
//		itemOrderService.deleteByMap(params);
//		//4.状态删除
//		ItemOrder load = itemOrderService.getById(itemOrder.getId())
//		load.setIsDelete(1);
//		itemOrderService.updateById(load);
		//5.状态删除
		//ItemOrder load = itemOrderService.load(id);
		//load.setIsDelete(1);
		//itemOrderService.updateById(load);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("message", "删除成功");
		return jsonObject.toString();
	}
	/**
	 * 单文件上传
	 * @param file
	 * @param request
	 * @param model
	 * @return
	 */
    @RequestMapping(value = "/saveFile")  
    public String saveFile(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request, Model model) {  
  
        System.out.println("开始");  
        String path = request.getSession().getServletContext().getRealPath("/upload");  
        String fileName = file.getOriginalFilename();  
        System.out.println(path);  
        File targetFile = new File(path, fileName);  
        if(!targetFile.exists()){  
            targetFile.mkdirs();  
        }  
        //保存  
        try {  
            file.transferTo(targetFile);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
  
        return "";  
    }  
	
	
	/**
	 * springMvc多文件上传
	 * @param files
	 * @param id
	 * @return
	 */
    @RequestMapping(value = "/saveFiles")
    public String saveFiles(@RequestParam("file") CommonsMultipartFile[] files,Integer id,HttpServletRequest request){
		for(int i = 0;i<files.length;i++){
	      	System.out.println("fileName---------->" + files[i].getOriginalFilename());
		  if(!files[i].isEmpty()){
            int pre = (int) System.currentTimeMillis();
	     	try {
			//拿到输出流，同时重命名上传的文件
			 String filePath = request.getRealPath("/upload");
			 File f=new File(filePath);
			 if(!f.exists()){
				f.mkdirs();
			 }
		     String fileNmae=new Date().getTime() + files[i].getOriginalFilename();
		     File file=new File(filePath+"/"+pre + files[i].getOriginalFilename());
			  if(!file.exists()){
				  file.createNewFile();
			 }
			  files[i].transferTo(file);
		     } catch (Exception e) {
				e.printStackTrace();
				System.out.println("上传出错");
			 }
		  }
		}
	  return "";
	}
 // --------------------------------------- 华丽分割线 ------------------------------
	
	
}
