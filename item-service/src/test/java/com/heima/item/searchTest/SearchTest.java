package com.heima.item.searchTest;


import cn.hutool.core.collection.CollUtil;
import cn.hutool.json.JSONUtil;
import com.heima.item.ItemApplication;
import com.heima.item.domain.po.ItemDoc;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.HttpHost;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightField;
import org.elasticsearch.search.sort.SortOrder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.IOException;
import java.util.Map;

@SpringBootTest(classes = ItemApplication.class)
@RunWith(SpringRunner.class)
@Slf4j
@ActiveProfiles("test")
public class SearchTest {

    private RestHighLevelClient client;

    @Before
    public void setUp() {
        client = new RestHighLevelClient(RestClient.builder(HttpHost.create("http://192.168.124.4:9200")));
    }

    @Test
    public void searchTest() throws IOException {
        int pageNum = 51, pageSize = 10;
        SearchRequest request = new SearchRequest("items");
        BoolQueryBuilder bool = QueryBuilders.boolQuery();
        bool.must(QueryBuilders.matchQuery("name", "手机"));
        bool.filter(QueryBuilders.rangeQuery("price").gte(5000).lte(50000));
        bool.filter(QueryBuilders.termQuery("brand", "小米"));
        request.source().query(bool);
        request.source().sort("price", SortOrder.ASC);
        request.source().from((pageNum - 1) * pageSize).size(pageSize);
        request.source().highlighter(SearchSourceBuilder.highlight().field("name").preTags("<em>").postTags("</em>"));
        SearchResponse response = client.search(request, RequestOptions.DEFAULT);
        handleResponse(response);
    }

    private void handleResponse(SearchResponse response) {
        SearchHits searchHits = response.getHits();
        long total = searchHits.getTotalHits().value;
        System.out.println("共搜索到" + total + "条记录");
        for (SearchHit hit : searchHits.getHits()) {
            String source = hit.getSourceAsString();
            ItemDoc itemDoc = JSONUtil.toBean(source, ItemDoc.class);
            Map<String, HighlightField> hfs = hit.getHighlightFields();
            if (CollUtil.isNotEmpty(hfs)) {
                HighlightField hf = hfs.get("name");
                if (hf != null) {
                    String hfName = hf.getFragments()[0].toString();
                    itemDoc.setName(hfName);
                }
            }
            System.out.println(itemDoc);
        }
    }

    @After
    public void tearDown() throws IOException {
        client.close();
    }
}
