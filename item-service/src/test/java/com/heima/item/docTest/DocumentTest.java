package com.heima.item.docTest;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.heima.item.ItemApplication;
import com.heima.item.domain.po.Item;
import com.heima.item.domain.po.ItemDoc;
import com.heima.item.service.impl.ItemServiceImpl;
import com.hmall.common.utils.CollUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.HttpHost;
import org.elasticsearch.action.bulk.BulkRequest;
import org.elasticsearch.action.get.GetRequest;
import org.elasticsearch.action.get.GetResponse;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.update.UpdateRequest;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.common.xcontent.XContentType;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.IOException;
import java.util.List;

@SpringBootTest(classes = ItemApplication.class)
@RunWith(SpringRunner.class)
@ActiveProfiles("test")
@Slf4j
public class DocumentTest {
    private RestHighLevelClient client;

    @Autowired
    ItemServiceImpl itemService;

    @Before
    public void setUp() {
        System.out.println(itemService);
        client = new RestHighLevelClient(RestClient.builder(HttpHost.create("http://192.168.124.4:9200")));
    }

    @Test
    public void addDocumentTest() throws IOException {
        Item item = itemService.getById(100001905417L);
//        System.out.println(item);
        ItemDoc itemDoc = BeanUtil.copyProperties(item, ItemDoc.class);
//        System.out.println(itemDoc);
        String doc = JSONUtil.toJsonStr(itemDoc);
        IndexRequest request = new IndexRequest("items").id(itemDoc.getId());
        request.source(doc, XContentType.JSON);
        client.index(request, RequestOptions.DEFAULT);
    }

    @Test
    public void getDocumentTest() throws IOException {
        GetRequest request = new GetRequest("items").id("100001905417");
        GetResponse response = client.get(request, RequestOptions.DEFAULT);
        String json = response.getSourceAsString();
        ItemDoc itemDoc = JSONUtil.toBean(json, ItemDoc.class);
        System.out.println("itemDoc = " + itemDoc);
    }

    @Test
    public void updateDocumentTest() throws IOException {
        UpdateRequest request = new UpdateRequest("items", "100001905417");
        request.doc(
                "price", 58800,
                "commentCount", 1
        );
        client.update(request, RequestOptions.DEFAULT);
    }

    @Test
    public void loadItemDocsTest() throws IOException {
        int pageNum = 1;
        int pageSize = 1000;
        while (true) {
            Page<Item> page = itemService.lambdaQuery().eq(Item::getStatus, 1).page(new Page<>(pageNum, pageSize));
            List<Item> items = page.getRecords();
            if (CollUtils.isEmpty(items)) {
                return;
            }
            log.info("加载第{}页数据，共{}条", pageNum, items.size());
            BulkRequest request = new BulkRequest("items");
            for (Item item : items) {
                ItemDoc itemDoc = BeanUtil.copyProperties(item, ItemDoc.class);
                request.add(new IndexRequest()
                        .id(itemDoc.getId())
                        .source(JSONUtil.toJsonStr(itemDoc), XContentType.JSON));
            }
            client.bulk(request, RequestOptions.DEFAULT);
            pageNum++;
        }
    }

    @After
    public void tearDown() throws IOException {
        client.close();
    }
}
