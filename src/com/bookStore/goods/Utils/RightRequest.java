package com.bookStore.goods.Utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.Map;
//再doilter中可能用到
public class RightRequest extends HttpServletRequestWrapper {
    private HttpServletRequest request;
    private String charset;

    public RightRequest(HttpServletRequest request, String charset) {
        super(request);
        this.request = request;
        this.charset = charset;
    }

    public String getParameter(String name) {
        String value = this.request.getParameter(name);
        if (value == null) {
            return null;
        } else {
            try {
                return new String(value.getBytes("ISO-8859-1"), this.charset);
            } catch (UnsupportedEncodingException var4) {
                throw new RuntimeException(var4);
            }
        }
    }

    public Map getParameterMap() {
        Map<String, String[]> map = this.request.getParameterMap();
        if (map == null) {
            return map;
        } else {
            Iterator var3 = map.keySet().iterator();

            while(var3.hasNext()) {
                String key = (String)var3.next();
                String[] values = (String[])map.get(key);

                for(int i = 0; i < values.length; ++i) {
                    try {
                        values[i] = new String(values[i].getBytes("ISO-8859-1"), this.charset);
                    } catch (UnsupportedEncodingException var7) {
                        throw new RuntimeException(var7);
                    }
                }
            }

            return map;
        }
    }

    public String[] getParameterValues(String name) {
        String[] values = super.getParameterValues(name);

        for(int i = 0; i < values.length; ++i) {
            try {
                values[i] = new String(values[i].getBytes("ISO-8859-1"), this.charset);
            } catch (UnsupportedEncodingException var5) {
                throw new RuntimeException(var5);
            }
        }

        return values;
    }
}
