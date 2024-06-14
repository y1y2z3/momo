package com.heima.item.fallback;

import com.heima.item.domain.dto.ItemDTO;
import com.hmall.common.utils.CollUtils;
import lombok.extern.slf4j.Slf4j;
import java.util.List;

@Slf4j
public class ItemControllerFallback {
    public static List<ItemDTO> queryItemByIdsFallback(List<Long> ids, Throwable e) throws InterruptedException {
        log.error("调用queryItemByIds方法发生了异常，异常参数为:{}", ids, e);
        return CollUtils.emptyList();
    }
}
