package com.heima.item.service;

import com.heima.item.domain.po.ItemDoc;
import com.heima.item.domain.query.ItemPageQuery;
import com.hmall.common.domain.PageDTO;
import java.io.IOException;

public interface SearchService {
    PageDTO<ItemDoc> search(ItemPageQuery query) throws IOException;
}
