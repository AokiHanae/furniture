package com.neusoft.controller;

import java.io.File;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.neusoft.base.BaseController;
import com.neusoft.po.CategoryDto;
import com.neusoft.po.Item;
import com.neusoft.po.UserPost;
import com.neusoft.po.TjDto;
import com.neusoft.po.User;
import com.neusoft.service.UserPostService;
import com.neusoft.service.ItemService;
import com.neusoft.utils.Pager;
import com.neusoft.utils.RedisUtil;

@Controller
@RequestMapping("/userPost")
public class UserPostController extends BaseController {
	

	@Autowired
	private UserPostService userPostService;
	
	
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
	public String listAll(UserPost userPost, Model model, HttpServletRequest request, HttpServletResponse response){
		List<UserPost> listAll = userPostService.listAll();
		model.addAttribute("list", listAll);
		return "userPost/userPost";
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
	public String listByEntity(UserPost userPost, Model model, HttpServletRequest request, HttpServletResponse response){
		List<UserPost> listAll = userPostService.listAllByEntity(userPost);
		model.addAttribute("list", listAll);
		return "userPost/userPost";
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
	public String listByMap(UserPost userPost, Model model, HttpServletRequest request, HttpServletResponse response){
		//通过map查询
		Map<String,Object> params = new HashMap<String,Object>();
	        if(!isEmpty(userPost.getTitle())){
	        	params.put("title", userPost.getTitle());
			}
	    List<UserPost> listAll = userPostService.listByMap(params);
		model.addAttribute("list", listAll);
		return "userPost/userPost";
	}
	
	
	/*********************************查询列表【分页】***********************************************/
	@Autowired
	private ItemService itemService;
	
	
	/**
	 * 分页查询 返回list对象(通过对象)
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/findByObj")
	public String findByObj(UserPost userPost, Model model, HttpServletRequest request, HttpServletResponse response) {
		//分页查询
		Pager<UserPost> pagers = userPostService.findByEntity(userPost);
		model.addAttribute("pagers", pagers);
		//存储查询条件
		model.addAttribute("obj", userPost);
		return "userPost/userPost";
	}
	//前台-买家交流列表
	@RequestMapping(value = "/homelist")
	public String homelist(UserPost userPost, Model model, HttpServletRequest request, HttpServletResponse response) {
		//分页查询
		Pager<UserPost> pagers = userPostService.findByEntity(userPost);
		model.addAttribute("pagers", pagers);
		//存储查询条件
		model.addAttribute("obj", userPost);
		return "userPost/homelist";
	}

	
	/**
	 * 分页查询 返回list对象(通过Map)
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/findByMap")
	public String findByMap(UserPost userPost, Model model, HttpServletRequest request, HttpServletResponse response) {
		//通过map查询
		Map<String,Object> params = new HashMap<String,Object>();
        if(!isEmpty(userPost.getTitle())){
        	params.put("title", userPost.getTitle());
		}
		//分页查询
		Pager<UserPost> pagers = userPostService.findByMap(params);
		model.addAttribute("pagers", pagers);
		//存储查询条件
		model.addAttribute("obj", userPost);
		return "userPost/userPost";
	}
	
	/**********************************【增删改】******************************************************/
	
	/**
	 * 跳至添加页面
	 * @return
	 */
	@RequestMapping(value = "/add")
	public String add() {
		return "userPost/add";
	}
	/**
	 * 跳到前台-我要发帖
	 * @return
	 */
	@RequestMapping(value = "/homeadd")
	public String homeadd() {
		return "userPost/homeadd";
	}
	

	/**
	 * 跳至前台帖子详情页面
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String view(Integer id,Model model) {
		UserPost obj = userPostService.load(id);
		model.addAttribute("obj",obj);
		return "userPost/view";
	}
	@RequestMapping(value = "/homeview")
	public String homeview(Integer id,Model model) {
		UserPost obj = userPostService.load(id);
		model.addAttribute("obj",obj);
		return "userPost/homeview";
	}
	//管理员后台查看帖子详情
	@RequestMapping(value = "/viewBack")
	public String viewBack(Integer id,Model model) {
		UserPost obj = userPostService.load(id);
		model.addAttribute("obj",obj);
		return "userPost/viewBack";
	}
	
	/**
	 * 添加执行
	 * @return
	 */
	@RequestMapping(value = "/exAdd")
	public String exAdd(UserPost userPost, Model model, HttpServletRequest request, HttpServletResponse response) {
		userPostService.insert(userPost);
				
		return "redirect:/userPost/findByObj.action";
	}
	/**
	 * 添加执行
	 * @return
	 */
	@RequestMapping(value = "/homeExAdd")
	public String homeExAdd(UserPost userPost, Model model, HttpServletRequest request, HttpServletResponse response) {
		Object attribute = request.getSession().getAttribute("user");
		userPost.setCreateTime(new Date());
		if(attribute!=null){
			User loginUser=(User) attribute;
			userPost.setUserId(loginUser.getId());
			userPost.setField0(loginUser.getUserName());
		}
		userPostService.insert(userPost);
		
		return "redirect:/userPost/homelist.action";
	}
	@RequestMapping(value = "/homeExUpdate")
	public String homeExUpdate(UserPost userPost, Model model, HttpServletRequest request, HttpServletResponse response) {
		//1.通过实体类修改，可以多传修改条件
		userPostService.updateById(userPost);
		
		return "redirect:/userPost/homelist.action";
	}
	
	
	/**
	 * 跳至修改页面
	 * @return
	 */
	@RequestMapping(value = "/update")
	public String update(Integer id,Model model) {
		UserPost obj = userPostService.load(id);
		model.addAttribute("obj",obj);
		return "userPost/update";
	}
	@RequestMapping(value = "/homeupdate")
	public String homeupdate(Integer id,Model model) {
		UserPost obj = userPostService.load(id);
		model.addAttribute("obj",obj);
		return "userPost/homeupdate";
	}
	

	/**
	 * 添加修改
	 * @return
	 */
	@RequestMapping(value = "/exUpdate")
	public String exUpdate(UserPost userPost, Model model, HttpServletRequest request, HttpServletResponse response) {
		//1.通过实体类修改，可以多传修改条件
		userPostService.updateById(userPost);
		return "redirect:/userPost/findByObj.action";
	}
	
	
	/**
	 * 删除通过主键
	 * @return
	 */
	@RequestMapping(value = "/delete")
	public String delete(Integer id, Model model, HttpServletRequest request, HttpServletResponse response) {
		///1.通过主键删除
		userPostService.deleteById(id);
		return "redirect:/userPost/findByObj.action";
	}
	
	
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
	public String listAllJson(UserPost userPost, HttpServletRequest request, HttpServletResponse response){
		List<UserPost> listAll = userPostService.listAll();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("list", listAll);
		jsonObject.put("obj", userPost);
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
	public String listByEntityJson(UserPost userPost,  HttpServletRequest request, HttpServletResponse response){
		List<UserPost> listAll = userPostService.listAllByEntity(userPost);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("list", listAll);
		jsonObject.put("obj", userPost);
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
	public String listByMapJson(UserPost userPost,HttpServletRequest request, HttpServletResponse response){
		//通过map查询
		Map<String,Object> params = new HashMap<String,Object>();
	        if(!isEmpty(userPost.getTitle())){
	        	params.put("title", userPost.getTitle());
			}
	       
	    List<UserPost> listAll = userPostService.listByMap(params);
	    JSONObject jsonObject = new JSONObject();
		jsonObject.put("list", listAll);
		jsonObject.put("obj", userPost);
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
	public String findByObjByEntityJson(UserPost userPost, HttpServletRequest request, HttpServletResponse response) {
		//分页查询
		Pager<UserPost> pagers = userPostService.findByEntity(userPost);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("pagers", pagers);
		jsonObject.put("obj", userPost);
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
	public String findByMapJson(UserPost userPost,HttpServletRequest request, HttpServletResponse response) {
		//通过map查询
		Map<String,Object> params = new HashMap<String,Object>();
        if(!isEmpty(userPost.getTitle())){
        	params.put("name", userPost.getTitle());
		}
     
		//分页查询
		Pager<UserPost> pagers = userPostService.findByMap(params);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("pagers", pagers);
		jsonObject.put("obj", userPost);
		return jsonObject.toString();
	}
	
	
	/**
	 * ajax 添加
	 * @param 
	 * @return
	 */
	@RequestMapping(value = "/exAddJson", method = RequestMethod.POST)
	@ResponseBody
	public String exAddJson(UserPost userPost, Model model, HttpServletRequest request, HttpServletResponse response) {
		userPostService.insert(userPost);
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
	public String exUpdateJson(UserPost userPost, Model model, HttpServletRequest request, HttpServletResponse response) {
		//1.通过实体类修改，可以多传修改条件
		userPostService.updateById(userPost);
		//2.通过主键id修改
		//userPostService.updateById(userPost);
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
		userPostService.deleteById(id);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("message", "删除成功");
		jsonObject.put("code", "0000");
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
