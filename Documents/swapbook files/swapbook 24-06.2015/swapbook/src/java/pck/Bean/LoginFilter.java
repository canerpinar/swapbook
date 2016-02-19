/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pck.Bean;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author can
 */
public class LoginFilter implements Filter{

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        
        
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        
        HttpServletRequest request=(HttpServletRequest) req;
        HttpServletResponse response=(HttpServletResponse)res;
        HttpSession session=request.getSession();
        String url=request.getServletPath();        
        if(url.equals("/profil.jsp") && session.getAttribute("session_name")==null || url.equals("/kitapbilgi.jsp") && session.getAttribute("session_name")==null || url.equals("/uyeol.jsp") && session.getAttribute("session_name")!=null)
        {
            request.getRequestDispatcher("/index.jsp").forward(request, response);                       
        }        
        else
        {
        chain.doFilter(request, response); 
        }        
    }
    @Override
    public void destroy() {
        
        
    }
    
}
