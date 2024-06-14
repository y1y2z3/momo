package com.heima.item.service.impl;

import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONUtil;
import com.heima.item.domain.po.ItemDoc;
import com.heima.item.domain.query.ItemPageQuery;
import com.heima.item.service.SearchService;
import com.hmall.common.domain.PageDTO;
import lombok.RequiredArgsConstructor;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.sort.SortOrder;
import org.springframework.stereotype.Service;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class SearchServiceImpl implements SearchService {

    private final RestHighLevelClient client;

    @Override
    public PageDTO<ItemDoc> search(ItemPageQuery query) throws IOException {
        SearchRequest request = new SearchRequest("items");
        BoolQueryBuilder bool = QueryBuilders.boolQuery();
        if (StrUtil.isNotBlank(query.getKey())) {
            bool.must(QueryBuilders.matchQuery("name", query.getKey()));
        }
        if (query.getBrand() != null) {
            bool.filter(QueryBuilders.termQuery("brand", query.getBrand()));
        }
        if (query.getCategory() != null) {
            bool.filter(QueryBuilders.termQuery("category", query.getCategory()));
        }
        long minPrice = query.getMinPrice() == null ? 0L : query.getMinPrice();
        long maxPrice = query.getMaxPrice() == null ? 999999999L : query.getMaxPrice();
        bool.filter(QueryBuilders.rangeQuery("price").gte(minPrice).lte(maxPrice));
        request.source().query(bool)
                .sort(StrUtil.isBlank(query.getSortBy()) ? "update_time" : query.getSortBy(), query.getIsAsc() ? SortOrder.ASC : SortOrder.DESC)
                .from(query.from())
                .size(query.getPageSize());
        // 查询数量超过10000时，显示具体的数量，而不是 gt 10000
        request.source().trackTotalHits(true);
        SearchResponse response = client.search(request, RequestOptions.DEFAULT);
        List<ItemDoc> records = handleResponse(response);
        long total = response.getHits().getTotalHits().value;
        long pages = (total - 1) / query.getPageSize() + 1;
        return new PageDTO<>(total, pages, records);
    }

    private List<ItemDoc> handleResponse(SearchResponse response) {
        return Arrays.stream(response.getHits().getHits())
                .map(hit -> JSONUtil.toBean(hit.getSourceAsString(), ItemDoc.class))
                .collect(Collectors.toList());
    }
}
