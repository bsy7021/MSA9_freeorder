package com.aloha.freeorder.service;

import java.util.List;

import com.aloha.freeorder.domain.Category;

public interface CategoryService {

    public List<Category> list() throws Exception;

    public Category read(Long id) throws Exception;

    public int insert(Category category) throws Exception;

    public int update(Category category) throws Exception;

    public int delete(Long id) throws Exception;

    
}