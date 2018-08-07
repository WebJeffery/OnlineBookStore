package com.bookStore.goods.Utils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class EntranceFilter implements Filter {
    private String charset = "UTF-8";

    public EntranceFilter() { }

    public void destroy() { }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest)request;
        if (((HttpServletRequest)req).getMethod().equalsIgnoreCase("GET")) {//如果是get方法时
            if (!(req instanceof RightRequest)) {
                req = new RightRequest((HttpServletRequest)req, charset);//将请求变成GetRequest类型
            }
        } else {
            ((HttpServletRequest)req).setCharacterEncoding(charset);
        }
        chain.doFilter((ServletRequest)req, response);
    }

    public void init(FilterConfig fConfig) throws ServletException {
        String charset = fConfig.getInitParameter("charset");
        if (charset != null && !charset.isEmpty()) {
            this.charset = charset;
        }
    }
}