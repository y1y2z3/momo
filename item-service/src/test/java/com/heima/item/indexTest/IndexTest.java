package com.heima.item.indexTest;

import org.apache.http.HttpHost;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.client.indices.CreateIndexRequest;
import org.elasticsearch.client.indices.CreateIndexResponse;
import org.elasticsearch.common.xcontent.XContentType;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.IOException;

public class IndexTest {

    private RestHighLevelClient client;

    @BeforeEach
    void setUp() {
        client = new RestHighLevelClient(RestClient.builder(HttpHost.create("http://192.168.124.10:9200")));
    }

    @Test
    void testConnect() {
        System.out.println(client);
    }

    @Test
    void testCreatIndex() throws IOException {
        final String MAPPING_TEMPLATE = "{\n" +
                "  \"mappings\": {\n" +
                "    \"properties\": {\n" +
                "      \"id\": {\n" +
                "        \"type\": \"keyword\"\n" +
                "      },\n" +
                "      \"name\":{\n" +
                "        \"type\": \"text\",\n" +
                "        \"analyzer\": \"ik_max_word\"\n" +
                "      },\n" +
                "      \"price\":{\n" +
                "        \"type\": \"integer\"\n" +
                "      },\n" +
                "      \"stock\":{\n" +
                "        \"type\": \"integer\"\n" +
                "      },\n" +
                "      \"image\":{\n" +
                "        \"type\": \"keyword\",\n" +
                "        \"index\": false\n" +
                "      },\n" +
                "      \"category\":{\n" +
                "        \"type\": \"keyword\"\n" +
                "      },\n" +
                "      \"brand\":{\n" +
                "        \"type\": \"keyword\"\n" +
                "      },\n" +
                "      \"sold\":{\n" +
                "        \"type\": \"integer\"\n" +
                "      },\n" +
                "      \"commentCount\":{\n" +
                "        \"type\": \"integer\"\n" +
                "      },\n" +
                "      \"isAD\":{\n" +
                "        \"type\": \"boolean\"\n" +
                "      },\n" +
                "      \"updateTime\":{\n" +
                "        \"type\": \"date\"\n" +
                "      }\n" +
                "    }\n" +
                "  }\n" +
                "}";
        CreateIndexRequest request = new CreateIndexRequest("items");
        request.source(MAPPING_TEMPLATE, XContentType.JSON);
        CreateIndexResponse res = client.indices().create(request, RequestOptions.DEFAULT);
        System.out.println(res.isAcknowledged());
    }

    @AfterEach
    void tearDown() throws IOException {
        client.close();
    }
}
