package com.bookStore.goods.Utils;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;

import java.util.Map;
import java.util.UUID;

public class CommonUtils {
    // 返回一个不重复的字符串
    public static String uuid() {
        return UUID.randomUUID().toString().replace("-", "").toUpperCase();
    }

    //把map转换成对象
    @SuppressWarnings("rawtypes")
    public static <T> T toBean(Map map, Class<T> clazz) {
        try {

            T bean = clazz.newInstance();//通过参数clazz创建实例
            ConvertUtils.register(new DateConverter(), java.util.Date.class);
            BeanUtils.populate(bean, map);//使用BeanUtils.populate把map的数据封闭到bean中
            return bean;
        } catch(Exception e) {
            throw new RuntimeException(e);
        }
    }
}
