package com.swz637.Dao;

import com.swz637.Bean.Book;
import com.swz637.Bean.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @ author: lsq637
 * @ since: 2022-08-22 16:52:05
 * @ describe:
 */
public interface BookMapper {
    void addBook(Book book);
    void deleteById(int bookId);
    void updateBook(Book book);
    List<Book> selectAll();
    Book selectById(int bookId);
    List<Book> queryBookByName(@Param("queryName") String queryName);

    User selectU(@Param("uName")String uName, @Param("pwd") String pwd);
}
