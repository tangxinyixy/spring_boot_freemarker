package com.example.demo.jpa;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.demo.entity.BookEntity;
import com.example.demo.page.Page;


public interface BookJpa extends JpaRepository<BookEntity,Integer> {
	
	//https://blog.csdn.net/lv_hang515888/article/details/80463227 一些方法的命名规则
	
	/**
	 * 模糊查询
	 * @param name
	 * @return
	 */
	List<BookEntity> findByNameContaining(String name);
	

}
