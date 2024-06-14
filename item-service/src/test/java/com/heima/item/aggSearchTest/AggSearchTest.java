package com.heima.item.aggSearchTest;

import com.heima.item.ItemApplication;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.HttpHost;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.Aggregations;
import org.elasticsearch.search.aggregations.BucketOrder;
import org.elasticsearch.search.aggregations.bucket.terms.Terms;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.IOException;
import java.util.List;

@SpringBootTest(classes = ItemApplication.class)
@RunWith(SpringRunner.class)
@Slf4j
@ActiveProfiles("test")
public class AggSearchTest {

    private RestHighLevelClient client;

    @Before
    public void setUp() {
        client = new RestHighLevelClient(RestClient.builder(HttpHost.create("http://192.168.124.4:9200")));
    }

    @Test
    public void aggSearchTest() throws IOException {
        SearchRequest request = new SearchRequest("items");
        BoolQueryBuilder bool = QueryBuilders.boolQuery();
        bool.filter(QueryBuilders.termQuery("category", "手机"));
        bool.filter(QueryBuilders.rangeQuery("price").gte(300000));
        request.source().query(bool).size(0);
        request.source().aggregation(AggregationBuilders.terms("brand_agg").field("brand").size(5).order(BucketOrder.count(true)));
        SearchResponse response = client.search(request, RequestOptions.DEFAULT);
        Aggregations aggregations = response.getAggregations();
        Terms brandTerms = aggregations.get("brand_agg");
        List<? extends Terms.Bucket> buckets = brandTerms.getBuckets();
        for (Terms.Bucket bucket : buckets) {
            String brand = bucket.getKeyAsString();
            System.out.print("brand = " + brand);
            long docCount = bucket.getDocCount();
            System.out.println("; count = " + docCount);
        }
    }

    @After
    public void tearDown() throws IOException {
        client.close();
    }
}
