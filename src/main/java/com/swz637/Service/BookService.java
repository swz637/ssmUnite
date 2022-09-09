package com.swz637.Service;

import com.swz637.Bean.Book;
import com.swz637.Bean.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @ author: lsq637
 * @ since: 2022-08-22 17:46:24
 * @ describe:
 */
public interface BookService {
    void addBook(Book book);

    void deleteById(int bookId);

    void updateBook(Book book);

    List<Book> selectAll();

    Book selectById(int bookId);

    List<Book> queryBookByName(String queryName);

    User selectU(String uName, String pwd);

}
