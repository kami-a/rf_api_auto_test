*** Settings ***
Resource          ../../Common/底层接口.robot

*** Keywords ***
查询店铺订单商品总数和价格
    [Arguments]    ${url}    ${shopid}    ${date}
    ${currentDate}    Get Current Date    result_format=%Y-%m-%d
    ${resp}    Post    ${url}    /mobile/shop/queryShopStatusByDate    {"shopId":"${shopid}","startDate":"${date}","endDate":"${currentDate}","shipmentType":"89"}
    接口调用是否成功    ${resp}
    [Return]    ${resp}

查询店铺每日订单数和价格
    [Arguments]    ${url}    ${shopid}    ${date}
    ${currentDate}    Get Current Date    result_format=%Y-%m-%d
    ${resp}    Post    ${url}    /mobile/shop/queryShopOrderAndPriceByDay    {"shopId":"${shopid}","startDate":"${date}","endDate":"${currentDate}"}
    接口调用是否成功    ${resp}
    [Return]    ${resp}

销量前五
    [Arguments]    ${url}    ${shopid}    ${date}
    ${currentDate}    Get Current Date    result_format=%Y-%m-%d
    ${resp}    Post    ${url}    /mobile/shop/topFive    {"shopId":"${shopid}","startDate":"${date}","endDate":"${currentDate}"}
    接口调用是否成功    ${resp}
    [Return]    ${resp}

获取店铺信息
    [Arguments]    ${url}    ${shopid}
    ${resp}    Get    ${url}    /mobile/shop/getShopInfo?shopId=${shopid}
    接口调用是否成功    ${resp}
    [Return]    ${resp}

查询店铺每页订单简况
    [Arguments]    ${url}    ${shopid}    ${date}    ${page}=1
    ${currentDate}    Get Current Date    result_format=%Y-%m-%d
    ${resp}    Post    ${url}    /mobile/shop/queryShopOrderByDate    {"shopId":"${shopid}","startDate":"${date}","endDate":"${currentDate}","page":${page}}
    接口调用是否成功    ${resp}
    [Return]    ${resp}

获取店铺订单详情
    [Arguments]    ${url}    ${orderid}
    ${resp}    Post    ${url}    /mobile/shop/getShopOrderDetail    {"orderId":"${orderid}"}
    接口调用是否成功    ${resp}
    [Return]    ${resp}
