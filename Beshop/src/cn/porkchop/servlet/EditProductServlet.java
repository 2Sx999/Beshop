package cn.porkchop.servlet;

import cn.porkchop.domain.Category;
import cn.porkchop.domain.Product;
import cn.porkchop.service.ProductService;
import cn.porkchop.service.impl.ProductServiceImpl;
import cn.porkchop.util.TimeUtil;
import cn.porkchop.util.UUIDUtils;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.List;

public class EditProductServlet extends HttpServlet {
    ProductService productService = new ProductServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
        if (!isMultipartContent) {
            throw new RuntimeException("your form is not multipart/form-data");
        }
        // 创建一个DiskFileItemfactory工厂类
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(1024 * 1024);// 设置缓存大小
        factory.setRepository(new File(this.getServletContext().getRealPath("/temp")));// 指定临时文件的存储目录
        // 创建一个ServletFileUpload核心对象
        ServletFileUpload sfu = new ServletFileUpload(factory);
        // 解决上传表单项文件乱码问题
        sfu.setHeaderEncoding("UTF-8");

        try {
            List<FileItem> fileItems = sfu.parseRequest(request);
            Product product = new Product();
            product.setPid(request.getParameter("pid"));
            product.setPdate(new Date());

            // 遍历表单项数据
            for (FileItem fileitem : fileItems) {
                if (fileitem.isFormField()) {
                    // 普通表单项
                    processFormField(fileitem, product);
                } else {
                    // 上传表单项
                    processUploadField(fileitem, product);
                }
            }
            productService.updateProductById(product);
            response.sendRedirect(request.getContextPath() + "/admin.php?method=getProductsByPagination");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * @author porkchop
     * @date 2017/10/3 15:22
     * 上传的文件
     */
    private void processUploadField(FileItem fileitem, Product product) throws Exception {
        if ("".equals(fileitem.getName())) {
            return;
        }
        String fileName = UUIDUtils.getUUID() + "_" + TimeUtil.getFormattedContinueousTime(new Date()) + "_" + fileitem.getName();
        String filePath = this.getServletContext().getRealPath("/products") + "/" + fileName;
        fileitem.write(new File(filePath));
        BeanUtils.setProperty(product, "pimage", "products/"+fileName);
    }

    /**
     * 普通表单项
     * @author porkchop
     * @date 2017/10/3 15:22
     */
    private void processFormField(FileItem fileitem, Product product) throws InvocationTargetException, IllegalAccessException {
        try {
            String fieldname = fileitem.getFieldName();// 字段名
            String fieldvalue = fileitem.getString("UTF-8");// 字段值
            if ("cid".equals(fieldname)) {
                Category category = new Category();
                category.setCid(fieldvalue);
                product.setCategory(category);
                return;
            }
            BeanUtils.setProperty(product, fieldname, fieldvalue);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
