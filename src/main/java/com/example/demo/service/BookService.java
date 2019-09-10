package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.BookDao;
import com.example.demo.entity.BookEntity;

@Service
public class BookService {
	
	@Autowired
	private BookDao bookDao;
	
	/**
	 * 查询所有
	 */
	public List<BookEntity> list(String name) {
		return bookDao.list(name);
	}
	
	/**
	 * 添加
	 * @param bookEntity
	 */
	public void add(BookEntity bookEntity) {
		bookDao.add(bookEntity);
	}
	
	/**
	 * 删除
	 * @param id
	 */
	public void delete(Integer id) {
		bookDao.delete(id);
	}
	
	/**
	 * 查询单个
	 * @param id
	 */
	public BookEntity selectById(Integer id) {
		return bookDao.selectById(id);
	}
	
	/**
	 * 修改
	 * @param bookEntity
	 */
	public void update(BookEntity bookEntity) {
		bookDao.update(bookEntity);
	}
	
	
}
