package cn.porkchop.domain;


import java.util.Date;

public class Product {
    private String pid;
    private String pname;
    private double market_price;
    private String shop_price;
    private String pimage;
    private Date pdate;
    private int is_hot;
    private String pdesc;
    private int pflag;
    private Category category;

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public double getMarket_price() {
        return market_price;
    }

    public void setMarket_price(double market_price) {
        this.market_price = market_price;
    }

    public String getShop_price() {
        return shop_price;
    }

    public void setShop_price(String shop_price) {
        this.shop_price = shop_price;
    }

    public String getPimage() {
        return pimage;
    }

    public void setPimage(String pimage) {
        this.pimage = pimage;
    }

    public Date getPdate() {
        return pdate;
    }

    public void setPdate(Date pdate) {
        this.pdate = pdate;
    }

    public int getIs_hot() {
        return is_hot;
    }

    public void setIs_hot(int is_hot) {
        this.is_hot = is_hot;
    }

    public String getPdesc() {
        return pdesc;
    }

    public void setPdesc(String pdesc) {
        this.pdesc = pdesc;
    }

    public int getPflag() {
        return pflag;
    }

    public void setPflag(int pflag) {
        this.pflag = pflag;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Product product = (Product) o;

        if (Double.compare(product.market_price, market_price) != 0) return false;
        if (is_hot != product.is_hot) return false;
        if (pflag != product.pflag) return false;
        if (pid != null ? !pid.equals(product.pid) : product.pid != null) return false;
        if (pname != null ? !pname.equals(product.pname) : product.pname != null) return false;
        if (shop_price != null ? !shop_price.equals(product.shop_price) : product.shop_price != null) return false;
        if (pimage != null ? !pimage.equals(product.pimage) : product.pimage != null) return false;
        if (pdate != null ? !pdate.equals(product.pdate) : product.pdate != null) return false;
        if (pdesc != null ? !pdesc.equals(product.pdesc) : product.pdesc != null) return false;
        return category != null ? category.equals(product.category) : product.category == null;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = pid != null ? pid.hashCode() : 0;
        result = 31 * result + (pname != null ? pname.hashCode() : 0);
        temp = Double.doubleToLongBits(market_price);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        result = 31 * result + (shop_price != null ? shop_price.hashCode() : 0);
        result = 31 * result + (pimage != null ? pimage.hashCode() : 0);
        result = 31 * result + (pdate != null ? pdate.hashCode() : 0);
        result = 31 * result + is_hot;
        result = 31 * result + (pdesc != null ? pdesc.hashCode() : 0);
        result = 31 * result + pflag;
        result = 31 * result + (category != null ? category.hashCode() : 0);
        return result;
    }
}
