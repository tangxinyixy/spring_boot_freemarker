package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.entity.BookEntity;
import com.example.demo.service.BookService;

import freemarker.template.Configuration;


@Controller
public class BookController {
	
	@Autowired
	private BookService bookService;
	
	/*
	 *查询
	 */
	@GetMapping(value = "/books")
	public String list(String bookName,Map<String,Object> map) {
		if(bookName == null) {
			bookName = "";
		}
		List<BookEntity> list = bookService.list(bookName);
		map.put("list",list);
		return "list";
	}
	
	/**
	 * 添加跳转
	 * @param map
	 * @return
	 */
	@GetMapping(value = "/bookAdd")
	public String addJump(Map<String,Object> map) {
		map.put("bookEntity",new BookEntity());
		return "add";
	}
	
	/**
	 * 添加
	 * @param bookEntity
	 * @return
	 */
	@PostMapping(value = "/book")
	public String add(BookEntity bookEntity) {
		bookService.add(bookEntity);
		return "redirect:books";
	}
	
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	@ResponseBody
	@DeleteMapping("/book/{id}")
	public Map< String, Object> delete(@PathVariable("id")Integer id) {
		int state;
		try {
			bookService.delete(id);
			state=1;
		} catch (Exception e) {
			state=0;
		}
		Map< String, Object> map=new HashMap<String, Object>();
		map.put("state", state);
		return map;
	}
	
	
	
	@ModelAttribute	
	public void getEmployee(@RequestParam(value ="id", required = false) Integer id, Map<String, Object> map) {
		if (id != null) {
			map.put("bookEntity", bookService.selectById(id));
		}
	}
	
	/**
	 *修改跳转
	 * @param id
	 * @param map
	 * @return
	 */
	@GetMapping(value = "/selectId/{id}")
	public String selectId(@PathVariable("id") Integer id,Map<String,Object> map) {
		map.put("bookEntity",bookService.selectById(id));
		return "update";
	}
	
	/**
	 * 修改
	 * @param bookEntity
	 * @return
	 */
	@PutMapping(value = "/book")
	public String update(BookEntity bookEntity) {
		bookService.update(bookEntity);
		return "redirect:books";
	}
	
	 @Autowired
	 private Configuration freemarkerConfiguration; // 注入bean，这里是属性注入，推荐构造注入
	
	 /**
	  * 导出excel表
	  * @param request
	  * @param response
	  */
	@RequestMapping("/downloadExcel")
    public void downloadExcel( HttpServletRequest request,HttpServletResponse response ){
		//让浏览器用utf8来解析返回的数据
		response.setHeader("Content-type", "text/html;charset=UTF-8");
		//告诉servlet用UTF-8转码，而不是用默认的ISO8859
		response.setCharacterEncoding("UTF-8");
        try {
            // 封装导出数据
            List<BookEntity> exportReviewList = bookService.list(""); 
            Map<String,Object> data=new HashMap();
            data.put("books",exportReviewList); //第一个worksheet的数据对象
            // 导出
//            request.setCharacterEncoding("UTF-8");//只对post请求起作用
            response.setContentType("application/x-download;");
            response.setHeader("Content-disposition", "attachment; filename="
                    + new String("springboot_ftl.xls".getBytes("GB2312"), "UTF-8"));
            freemarkerConfiguration.getTemplate("spirngboot_ftl.ftl").process(data,response.getWriter());
        }catch (Exception e){
            e.printStackTrace();
        }
	}
	
}
