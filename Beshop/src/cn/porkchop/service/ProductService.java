package cn.porkchop.service;

import cn.porkchop.domain.Category;
import cn.porkchop.domain.PageBean;
import cn.porkchop.domain.Product;
import cn.porkchop.exception.NoSuchProductException;

import java.util.List;

public interface ProductService {
    List<Product> findNewProductsForIndex();

    List<Product> findHotProductsForIndex();

    Product findProductById(String pid) throws NoSuchProductException;

    Category findProductByCategory(PageBean<Product> pageBean, String cid);

}
