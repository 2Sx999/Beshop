package cn.porkchop.domain;

import java.util.HashMap;
import java.util.Map;

public class Cart {
    private Map<String,CartItem> map = new HashMap<>();
    private double total;

    public Map<String, CartItem> getMap() {
        return map;
    }

    public void setMap(Map<String, CartItem> map) {
        this.map = map;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
}
