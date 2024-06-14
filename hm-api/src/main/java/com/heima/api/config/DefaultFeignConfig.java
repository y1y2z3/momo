package com.heima.api.config;

import cn.hutool.core.util.ObjectUtil;
import com.heima.api.client.fallback.ItemClientFallback;
import com.hmall.common.utils.UserContext;
import feign.RequestInterceptor;
import feign.RequestTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class DefaultFeignConfig {

    private static final String USER_INFO = "userInfo";

    @Bean
    public RequestInterceptor userInfoRequestInterceptor() {
        return new RequestInterceptor() {
            @Override
            public void apply(RequestTemplate requestTemplate) {
                Long userId = UserContext.getUser();
                if (ObjectUtil.isNull(userId)) {
                    return;
                }
                requestTemplate.header(USER_INFO, userId.toString());
            }
        };
    }

    @Bean
    public ItemClientFallback itemClientFallback() {
        return new ItemClientFallback();
    }
}
