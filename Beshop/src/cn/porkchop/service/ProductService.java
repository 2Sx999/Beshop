package cn.porkchop.service;

import cn.porkchop.domain.Product;

import java.util.List;

public interface ProductService {
    List<Product> findNewProductsForIndex();

    List<Product> findHotProductsForIndex();

    Product findProductById(String pid);
}
