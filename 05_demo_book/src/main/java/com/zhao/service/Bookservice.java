package com.zhao.service;

import com.zhao.bean.Book;
import com.zhao.dao.BookMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Bookservice {

    @Autowired
    BookMapper bookMapper;

    //查询所有学生信息
    public List<Book> findall(){
        List<Book> books = bookMapper.selectall();
        return books;
    }
    //查询所有图书的书室
    public List<Book> find_room() {
        return bookMapper.selectbyroom();
    }

    //学生添加
    public void add(Book book) {
       bookMapper.insertSelective(book);
    }

    public Book find_bid(Integer bid) {
        return bookMapper.selectByPrimaryKey(bid);
    }

    public int update(Book book) {
       return bookMapper.updateByPrimaryKey(book);
    }

    public void delbook(Integer bid) {
        bookMapper.deleteByPrimaryKey(bid);
    }

    public int delbooks(List list) {
      return bookMapper.deleteParamsByIds(list);
    }
}
