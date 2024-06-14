package com.heima.pay;

import com.heima.api.client.CartClient;
import com.heima.api.client.ItemClient;
import com.heima.api.client.TradeClient;
import com.heima.api.client.UserClient;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@EnableFeignClients(clients = {UserClient.class, TradeClient.class})
@MapperScan("com.heima.pay.mapper")
@SpringBootApplication
public class PayApplication {
    public static void main(String[] args) {
        SpringApplication.run(PayApplication.class, args);
    }
}
