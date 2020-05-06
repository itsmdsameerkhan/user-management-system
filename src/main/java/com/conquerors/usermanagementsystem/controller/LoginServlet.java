/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.conquerors.usermanagementsystem.controller;

import com.conquerors.usermanagementsystem.dao.UserDao;
import com.conquerors.usermanagementsystem.model.User;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author iammd
 */
public class LoginServlet extends HttpServlet {

    private UserDao userDao = new UserDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String nextPage = "";
            HttpSession session = request.getSession(true);

            User checkUser = userDao.login(username, password);
            
            if (checkUser != null) {
                nextPage = "profile/dashboard.jsp";
                session.setAttribute("isLoggedIn", "true");
            } else {
                // This will redirect user to the login page telling that account was unable to login.
                session.setAttribute("loginuser", "Re-check your credentials.");
                nextPage = "index.jsp";
            }
            
            response.sendRedirect(nextPage);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "It's Login Page";
    }// </editor-fold>

}