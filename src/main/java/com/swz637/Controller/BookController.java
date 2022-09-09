package com.swz637.Controller;

import com.swz637.Bean.Book;
import com.swz637.Bean.Icon;
import com.swz637.Bean.User;
import com.swz637.Service.BookService;
import com.swz637.Service.IconService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;

/**
 * @ author: lsq637
 * @ since: 2022-08-22 17:56:57
 * @ describe:
 */
@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
//    @Qualifier("bookService")
    private BookService bookService;

    @Autowired
    private IconService iconService;

    @GetMapping("/listAll")
    public String listAll(Model model) {
        List<Book> bookList = bookService.selectAll();
        model.addAttribute("bookList", bookList);
        return "listAll";
    }

    @GetMapping("/toAddBook")
    public String toAddBook(Model model) {
        return "addBook";
    }

    @PostMapping("/addBook")
    public String addBook(Book book) {//spring能自动将表单提交的数据封装到Book对象里
        bookService.addBook(book);
        return "redirect:/book/listAll";
    }

    @GetMapping("/delete/{id}")
    public String delete(Model model, @PathVariable int id) {
        bookService.deleteById(id);
        return "redirect:/book/listAll";
    }

    @RequestMapping("/toUpdate/{id}")
    public String toUpdate(Model model, @PathVariable int id) {
        Book book = bookService.selectById(id);
        model.addAttribute("aBook", book);
        return "update";
    }

    @RequestMapping("/update")
    public String update(Book book) {
        bookService.updateBook(book);
        return "redirect:/book/listAll";
    }

    @RequestMapping("/queryBookByName")
    public String queryBookByName(Model model, String queryName) {
        List<Book> books = bookService.queryBookByName(queryName);
        if (books.isEmpty()) {
            model.addAttribute("error", "未查询到相关书籍");
        } else {
            model.addAttribute("bookList", books);
        }
        return "listAll";
    }

    @RequestMapping("/toLogin")
    public String toLogin(Model model) {
        return "login";
    }

    @RequestMapping("/Login")
    public String login(String uName, String pwd, HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
        User user = bookService.selectU(uName, pwd);
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("u", uName);
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } else {
            model.addAttribute("msg", false);

        }
        return "login";
    }

    @RequestMapping("/signOut")
    public void signOut(String uName, String pwd, HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().removeAttribute("u");
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }

    @RequestMapping("/uploadImg")
    @ResponseBody
    public void uploadImg(@RequestParam MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws IOException {
        //获取前端传来的图片文件，及登录的用户名
        String uName = (String) request.getSession().getAttribute("u");
        byte[] fileBytes = file.getBytes();
        //查询图片数据库是否已经存在该用户
        Icon oldIcon = iconService.getById(uName);

        Icon newIcon = new Icon(uName, fileBytes);
        if (oldIcon!=null){//存在则更新该用户头像
            iconService.updateImg(newIcon);
        }else {//否则在数据库存入数据
            iconService.save(newIcon);
        }
    }

    @RequestMapping(value = "imageDisplay")
    public void showImage(HttpServletResponse response, HttpServletRequest request)
            throws ServletException, IOException, SQLException {
        String uName = (String)request.getSession().getAttribute("u");
        Icon icon = iconService.getById(uName);
        byte[] bytes = icon.getData(); // blob.getBytes

        response.setContentType("image/jpeg, image/jpg, image/png, image/gif");  //设置输出流内容格式为图片格式
        InputStream in1 = new ByteArrayInputStream(bytes);  //将字节流转换为输入流
        IOUtils.copy(in1, response.getOutputStream());//将字节从 InputStream复制到OutputStream中

    }

    @RequestMapping(value = "isLogged")
    @ResponseBody
    public String isLogged(HttpServletResponse response, HttpServletRequest request) {
        HttpSession session = request.getSession();
        if (session != null && session.getAttribute("u") != null) {
            return "true";
        }
        return "false";
    }
}
