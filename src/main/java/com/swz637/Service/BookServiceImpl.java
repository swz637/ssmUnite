package com.swz637.Service;

import com.swz637.Bean.Book;
import com.swz637.Bean.User;
import com.swz637.Dao.BookMapper;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ author: lsq637
 * @ since: 2022-08-22 17:47:02
 * @ describe:
 */
public class BookServiceImpl implements BookService{

    @Autowired
    @Resource
    private BookMapper bookMapper;


    public BookMapper getBookMapper() {
        return bookMapper;
    }

    public void setBookMapper(BookMapper bookMapper) {
        this.bookMapper = bookMapper;
    }

    @Override
    public void addBook(Book book) {
        bookMapper.addBook(book);
    }

    @Override
    public void deleteById(int bookId) {
        bookMapper.deleteById(bookId);
    }

    @Override
    public void updateBook(Book book) {
        bookMapper.updateBook(book);
    }

    @Override
    public List<Book> selectAll() {
        return bookMapper.selectAll();
    }

    @Override
    public Book selectById(int bookId) {
        return bookMapper.selectById(bookId);
    }

    @Override
    public List<Book> queryBookByName(String queryName) {
       return bookMapper.queryBookByName(queryName);
    }

    @Override
    public User selectU(String uName, String pwd) {
        return bookMapper.selectU(uName, pwd);
    }
}
