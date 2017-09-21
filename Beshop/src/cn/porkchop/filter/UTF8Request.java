package cn.porkchop.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.io.UnsupportedEncodingException;
import java.util.Map;

class UTF8Request extends HttpServletRequestWrapper {
    HttpServletRequest request;
    public UTF8Request(HttpServletRequest request) {
        super(request);
        this.request = request;
    }
    @Override
    public String getParameter(String name) {
        Map<String, String[]> map = getParameterMap();
        return map.get(name)[0];
    }
    @Override
    public String[] getParameterValues(String name) {
        Map<String, String[]> map = getParameterMap();
        return map.get(name);
    }
    private boolean flag = true;
    @Override
    public Map<String, String[]> getParameterMap() {
        Map<String, String[]> map = request.getParameterMap();// 乱码
        if (flag) {
            for (Map.Entry<String, String[]> m : map.entrySet()) {
                String[] values = m.getValue();
                for (int i = 0; i < values.length; i++) {
                    try {
                        values[i] = new String(values[i].getBytes("iso-8859-1"), "UTF-8");
                    } catch (UnsupportedEncodingException e) {
                        e.printStackTrace();
                    }
                }
            }
            flag = false;
        }
        return map;
    }
}
