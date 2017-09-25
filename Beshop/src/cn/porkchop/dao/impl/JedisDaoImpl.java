package cn.porkchop.dao.impl;

import cn.porkchop.dao.JedisDao;
import cn.porkchop.util.JedisPoolUtils;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class JedisDaoImpl implements JedisDao {
    /**
     * @description 查询类型的缓存
     * @author porkchop
     * @date 2017/9/24 13:16
     * @return null表示为空
     */
    @Override
    public String findAllCategoriesJson() {
        JedisPool jedisPool = JedisPoolUtils.getJedisPool();
        Jedis jedis = jedisPool.getResource();
        String categoriesJson = jedis.get("categoriesJson");
        jedis.close();
        return categoriesJson;
    }

    @Override
    public void insertAllCategoriesJson(String categoriesJson) {
        JedisPool jedisPool = JedisPoolUtils.getJedisPool();
        Jedis jedis = jedisPool.getResource();
        jedis.set("categoriesJson",categoriesJson);
        jedis.close();
    }
}
