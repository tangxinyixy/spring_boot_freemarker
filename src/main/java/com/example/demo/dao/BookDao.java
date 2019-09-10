package com.example.demo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.BookEntity;
import com.example.demo.jpa.BookJpa;

@Repository
public class BookDao {
	
	@Autowired
	private BookJpa bookJpa;
	
	/**
	 * 查询所有 模糊查询
	 */
	public List<BookEntity> list(String name) {
		return bookJpa.findByNameContaining(name);
	}
	
	/**
	 * 删除
	 * @param id
	 */
	public void delete(Integer id) {
		bookJpa.deleteById(id);
	}
	
	/**
	 * 查询单个
	 * @param id
	 */
	public BookEntity selectById(Integer id) {
		return bookJpa.getOne(id);
	}
	
	/**
	 * 修改
	 * @param bookEntity
	 */
	public void update(BookEntity bookEntity) {
		bookJpa.save(bookEntity);
	}
	
	
	/**
	 * 查出总条数
	 */
	public Integer count() {
		return null;
	}
	
	
	/**
	 * 添加
	 * @param bookEntity
	 */
	public void add(BookEntity bookEntity) {
		bookJpa.save(bookEntity);
	}
	//https://www.jianshu.com/p/3b31270a44b1  写的时候可以看下
	
}
