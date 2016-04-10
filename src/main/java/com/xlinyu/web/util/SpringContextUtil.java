package com.xlinyu.web.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

public class SpringContextUtil implements ApplicationContextAware{

	// Spring应用上下文环境
    private static ApplicationContext applicationContext;
	
    public static final String KEY = "propertyConfigurer";
    
    @Override
    public void setApplicationContext(ApplicationContext applicationContext)
            throws BeansException {
        SpringContextUtil.applicationContext = applicationContext;
    }
    
    public static ApplicationContext getApplicationContext() {
        return applicationContext;
    }

    public static Object getBean(String name) throws BeansException {
        return applicationContext.getBean(name);
    }
    
    /**
     * 通过properties文件中的key获取value值
     * @param keyName
     * @return
     */
    public static String parseStr(String keyName) {
        CustomizedPropertyPlaceholderConfigurer cp = (CustomizedPropertyPlaceholderConfigurer) applicationContext.getBean(KEY);
        Object obj = cp.getContextProperty(keyName);
        String value = "";
        if (obj != null) {
            value = obj.toString();
        }
        return value;
    }
}