package cn.porkchop.dao.impl;

import cn.porkchop.dao.JedisDao;
import cn.porkchop.util.JedisPoolUtils;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class JedisDaoImpl implements JedisDao {
    private JedisPool jedisPool = JedisPoolUtils.getJedisPool();


    @Override
    public String findAllCategoriesJson() {
        Jedis jedis = jedisPool.getResource();
        String categoriesJson = jedis.get("categoriesJson");
        jedis.close();
        return categoriesJson;
    }


    @Override
    public void insertAllCategoriesJson(String categoriesJson) {
        Jedis jedis = jedisPool.getResource();
        jedis.set("categoriesJson", categoriesJson);
        jedis.close();
    }


    @Override
    public void delCategoryJson() {
        Jedis jedis = jedisPool.getResource();
        jedis.del("categoriesJson");
        jedis.close();
    }
}
