package com.zhao.control;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhao.bean.Book;
import com.zhao.bean.Msg;
import com.zhao.service.Bookservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
public class Bookcontrol {
    @Autowired
    Bookservice bookservice;
    //查询所有书籍
    @RequestMapping("/findall")
    @ResponseBody
    public Msg findall(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        //pn表示起始页，
        PageHelper.startPage(pn,5);
        List<Book> books = bookservice.findall();
        PageInfo page=new PageInfo(books,3);
        return Msg.success().add("page",page);
    }
    //检验bid是否存在
    @RequestMapping("/checkbid")
    @ResponseBody
    public Msg checkbid(@RequestParam(value = "bid") Integer bid){
        //先判断书籍号是否合法
        if(bid<1000||bid>9999){
            return Msg.error().add("msg","对不起，书籍号必须是1000到9999之间的数");
        }
        List<Book> books = bookservice.findall();
        List list=new ArrayList();
        for(Book b:books){
            list.add(b.getBid());
        }
        if(list.contains(bid)){
            return Msg.error().add("msg","对不起，书籍号为"+bid+"的书籍已存在");
        }
        return Msg.success().add("msg","");
    }
    //书籍添加
    @RequestMapping("addbook")
    @ResponseBody
    public Msg add(Book book){
        bookservice.add(book);
        return Msg.success();
    }
    //查询书籍的书室信息
    @RequestMapping("/findroom")
    @ResponseBody
    public Msg checkbook(){
        List<Book> rooms = bookservice.find_room();
        return Msg.success().add("book",rooms);
    }
    //根据bid查询书籍信息
    @RequestMapping("find_book")
    @ResponseBody
    public Msg find_byid(@RequestParam("bid") Integer bid){
        Book book = bookservice.find_bid(bid);
        if(book==null){
            return Msg.error().add("msg","对不起书籍号"+bid+"不存在");
        }
        return Msg.success().add("books",book);
    }

    //查询所有书籍信息
    @RequestMapping("/findbooks")
    @ResponseBody
    public Msg findbooks(@RequestParam("bid")Integer bid){
        Book book = bookservice.find_bid(bid);
        return Msg.success().add("b",book);
    }
    //修改图书信息
    @RequestMapping("/updatebook")
    @ResponseBody
    public Msg updatebook(Book book){
        int i=bookservice.update(book);
        return Msg.success().add("msg","跟新已完成");
    }
    //删除单个图书
    @RequestMapping("/delbook")
    @ResponseBody
    public Msg del(@RequestParam("bid")Integer bid){
        bookservice.delbook(bid);
        return Msg.success().add("msg","删除成功");
    }

    //删除多个图书
    @RequestMapping("delbooks")
    @ResponseBody
    public Msg delbooks(@RequestParam("bid") String ids){
        List list=new ArrayList();
        String[] split = ids.split("-");
        for(String s:split){
            list.add(Integer.valueOf(s));
        }
        int i = bookservice.delbooks(list);
        System.out.println("i="+i);
        return Msg.success().add("msg","删除成功");
    }
}

