package com.neusoft.controller;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.neusoft.base.BaseController;
import com.neusoft.po.User;
import com.neusoft.po.UserPost;
import com.neusoft.po.UserPostComment;
import com.neusoft.service.ItemService;
import com.neusoft.service.UserPostCommentService;
import com.neusoft.service.UserPostService;
import com.neusoft.utils.Pager;

@Controller
@RequestMapping("/userPostComment")
public class UserPostCommentController extends BaseController {
	

	@Autowired
	private UserPostCommentService userPostCommentService;
	
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
	public String listAll(UserPostComment userPostComment, Model model, HttpServletRequest request, HttpServletResponse response){
		List<UserPostComment> listAll = userPostCommentService.listAll();
		model.addAttribute("list", listAll);
		return "userPostComment/userPostComment";
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
	public String listByEntity(UserPostComment userPostComment, Model model, HttpServletRequest request, HttpServletResponse response){
		List<UserPostComment> listAll = userPostCommentService.listAllByEntity(userPostComment);
		model.addAttribute("list", listAll);
		return "userPostComment/userPostComment";
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
	public String listByMap(UserPostComment userPostComment, Model model, HttpServletRequest request, HttpServletResponse response){
		//通过map查询
		Map<String,Object> params = new HashMap<String,Object>();
        if(!isEmpty(userPostComment.getContent())){
        	params.put("content", userPostComment.getContent());
		}
	    List<UserPostComment> listAll = userPostCommentService.listByMap(params);
		model.addAttribute("list", listAll);
		return "userPostComment/userPostComment";
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
	public String findByObj(UserPostComment userPostComment, Model model, HttpServletRequest request, HttpServletResponse response) {
		//分页查询
		Pager<UserPostComment> pagers = userPostCommentService.findByEntity(userPostComment);
		model.addAttribute("pagers", pagers);
		//存储查询条件
		model.addAttribute("obj", userPostComment);
		return "userPostComment/userPostComment";
	}
	//从评论列表到--评论详情
	@RequestMapping(value = "/findByObjHome")
	public String findByObjHome(UserPostComment userPostComment, Model model, HttpServletRequest request, HttpServletResponse response) {
		
		UserPost userPost = userPostService.load(userPostComment.getPostId());
		model.addAttribute("userPost",userPost);
		//分页查询
		Pager<UserPostComment> pagers = userPostCommentService.findByEntity(userPostComment);
		model.addAttribute("pagers", pagers);
		//存储查询条件
		model.addAttribute("obj", userPostComment);
		return "userPost/homeview";
	}

	
	/**
	 * 分页查询 返回list对象(通过Map)
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/findByMap")
	public String findByMap(UserPostComment userPostComment, Model model, HttpServletRequest request, HttpServletResponse response) {
		//通过map查询
		Map<String,Object> params = new HashMap<String,Object>();
        if(!isEmpty(userPostComment.getContent())){
        	params.put("content", userPostComment.getContent());
		}
		//分页查询
		Pager<UserPostComment> pagers = userPostCommentService.findByMap(params);
		model.addAttribute("pagers", pagers);
		//存储查询条件
		model.addAttribute("obj", userPostComment);
		return "userPostComment/userPostComment";
	}
	
	/**********************************【增删改】******************************************************/
	
	/**
	 * 跳至添加页面
	 * @return
	 */
	@RequestMapping(value = "/add")
	public String add() {
		return "userPostComment/add";
	}
	

	/**
	 * 跳至详情页面
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String view(Integer id,Model model) {
		UserPostComment obj = userPostCommentService.load(id);
		model.addAttribute("obj",obj);
		return "userPostComment/view";
	}
	
	/**
	 * 添加执行
	 * @return
	 */
	@RequestMapping(value = "/exAdd")
	public String exAdd(UserPostComment userPostComment, Model model, HttpServletRequest request, HttpServletResponse response) {
		userPostCommentService.insert(userPostComment);
				
		return "redirect:/userPostComment/findByObj.action";
	}
	
	/**
	 * 跳至修改页面
	 * @return
	 */
	@RequestMapping(value = "/update")
	public String update(Integer id,Model model) {
		UserPostComment obj = userPostCommentService.load(id);
		model.addAttribute("obj",obj);
		return "userPostComment/update";
	}
	

	/**
	 * 添加修改
	 * @return
	 */
	@RequestMapping(value = "/exUpdate")
	public String exUpdate(UserPostComment userPostComment, Model model, HttpServletRequest request, HttpServletResponse response) {
		//1.通过实体类修改，可以多传修改条件
		userPostCommentService.updateById(userPostComment);
		return "redirect:/userPostComment/findByObj.action";
	}
	
	
	/**
	 * 删除通过主键
	 * @return
	 */
	@RequestMapping(value = "/delete")
	public String delete(Integer id, Model model, HttpServletRequest request, HttpServletResponse response) {
		///1.通过主键删除
		userPostCommentService.deleteById(id);
		return "redirect:/userPostComment/findByObj.action";
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
	public String listAllJson(UserPostComment userPostComment, HttpServletRequest request, HttpServletResponse response){
		List<UserPostComment> listAll = userPostCommentService.listAll();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("list", listAll);
		jsonObject.put("obj", userPostComment);
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
	public String listByEntityJson(UserPostComment userPostComment,  HttpServletRequest request, HttpServletResponse response){
		List<UserPostComment> listAll = userPostCommentService.listAllByEntity(userPostComment);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("list", listAll);
		jsonObject.put("obj", userPostComment);
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
	public String findByObjByEntityJson(UserPostComment userPostComment, HttpServletRequest request, HttpServletResponse response) {
		//分页查询
		Pager<UserPostComment> pagers = userPostCommentService.findByEntity(userPostComment);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("pagers", pagers);
		jsonObject.put("obj", userPostComment);
		return jsonObject.toString();
	}
	
	
	
	/**
	 * ajax 添加
	 * @param 
	 * @return
	 */
	@RequestMapping(value = "/exAddJson", method = RequestMethod.POST)
	@ResponseBody
	public String exAddJson(UserPostComment userPostComment, Model model, HttpServletRequest request, HttpServletResponse response) {
		userPostComment.setCreateTime(new Date());
		Integer postId = userPostComment.getPostId();
		UserPost userPost = userPostService.getById(postId);
		userPostComment.setField0(userPost.getTitle());
		Object user = request.getSession().getAttribute("user");
		if(user==null){
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("message", "请先登录");
			jsonObject.put("code", "9999");
			return jsonObject.toString();
		}else{
			User loginUser=(User) user;
			userPostComment.setUserId(loginUser.getId());
			userPostComment.setUserName(loginUser.getUserName());
		}
		userPostCommentService.insert(userPostComment);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("message", "添加成功");
		jsonObject.put("code", "0000");
		return jsonObject.toString();
	}
	

	/**
	 * ajax 修改
	 * @param 
	 * @return
	 */
	@RequestMapping(value = "/exUpdate.json", method = RequestMethod.POST)
	@ResponseBody
	public String exUpdateJson(UserPostComment userPostComment, Model model, HttpServletRequest request, HttpServletResponse response) {
		//1.通过实体类修改，可以多传修改条件
		userPostCommentService.updateById(userPostComment);
		//2.通过主键id修改
		//userPostCommentService.updateById(userPostComment);
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
		userPostCommentService.deleteById(id);
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
