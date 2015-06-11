/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package FILTER;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author Lester Chong
 */
public class LoggedUserFilter implements Filter {
    private ServletContext context;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        context = filterConfig.getServletContext();
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        RequestDispatcher rd = req.getServletContext().getRequestDispatcher("/./login.jsp");
        
        try(PrintWriter out = response.getWriter()){
            if(!req.getServletPath().equals("/Login.jsp") && !req.getServletPath().equals("/UserAuthenticationServlet") && !req.getServletPath().equals("/UserLogoutServlet")){
                if(req.getSession().getAttribute("isLogged")==null){
                    out.printf("<script>alert(\"You Must be Logged In to Continue\")</script>");
                    rd.include(req, res);
                    return;
                }else
                    chain.doFilter(req, res);
            }else
                chain.doFilter(req, res);
        }
    }

    @Override
    public void destroy() {
        
    }

}
