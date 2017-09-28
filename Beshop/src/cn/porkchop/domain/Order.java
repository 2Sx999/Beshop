package cn.porkchop.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Order {
    private String oid;
    private Date orderTime;
    private double total;
    private int state;//此订单的状态,0=未支付,1=支付
    private String address;//地址
    private String name;//收货人的名字
    private String telephone;//收货电话
    private User user;//下单的用户
    private List<OrderItem> orderItemList=new ArrayList<>();

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Order order = (Order) o;

        if (Double.compare(order.total, total) != 0) return false;
        if (state != order.state) return false;
        if (oid != null ? !oid.equals(order.oid) : order.oid != null) return false;
        if (orderTime != null ? !orderTime.equals(order.orderTime) : order.orderTime != null) return false;
        if (address != null ? !address.equals(order.address) : order.address != null) return false;
        if (name != null ? !name.equals(order.name) : order.name != null) return false;
        if (telephone != null ? !telephone.equals(order.telephone) : order.telephone != null) return false;
        if (user != null ? !user.equals(order.user) : order.user != null) return false;
        return orderItemList != null ? orderItemList.equals(order.orderItemList) : order.orderItemList == null;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = oid != null ? oid.hashCode() : 0;
        result = 31 * result + (orderTime != null ? orderTime.hashCode() : 0);
        temp = Double.doubleToLongBits(total);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        result = 31 * result + state;
        result = 31 * result + (address != null ? address.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (telephone != null ? telephone.hashCode() : 0);
        result = 31 * result + (user != null ? user.hashCode() : 0);
        result = 31 * result + (orderItemList != null ? orderItemList.hashCode() : 0);
        return result;
    }

    public List<OrderItem> getOrderItemList() {

        return orderItemList;
    }

    public void setOrderItemList(List<OrderItem> orderItemList) {
        this.orderItemList = orderItemList;
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

}
