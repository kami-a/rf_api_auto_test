*** Settings ***
Resource          ../../Common/底层接口.robot

*** Keywords ***
获取一级类目
    ${response}    post    fmall    /mobile/category/getFirstCategory
    [Return]    ${response}

获取二级类目
    [Arguments]    ${requestBody}
    ${response}    post    fmall    /mobile/category/getChildCategory    ${requestBody}
    [Return]    ${response}

获取类目广告位
    [Arguments]    ${cid}
    ${response}    get    fmall    /mobile/category/advertisement?cid=${cid}
    [Return]    ${response}

获取类目推荐位
    [Arguments]    ${cid}
    ${response}    get    fmall    /mobile/category/recommendation?cid=${cid}
    [Return]    ${response}

查询商品列表
    [Arguments]    ${cid}
    ${response}    post    fmall    /mobile/shop/toDisIndex    {"attributeValues":"","attributes":"","brandId":null,"cid":${cid},"keyword":"","orderSort":6,"page":1,"payType":0,"shopId":"2000001629","price1":"","price2":"","intelligenceType":""}
    [Return]    ${response}

查询商品促销信息
    [Arguments]    ${requestBody}
    ${response}    post    fmall    /mobile/goods/getPromotionMessage    ${requestBody}
    [Return]    ${response}

获取推荐列表
    [Arguments]    ${recommendFlag}
    ${response}    post    fmall    /mobile/shop/recommendLists    {"distributorShopId":"2000001629","recommendFlag":${recommendFlag},"page":1}
    [Return]    ${response}
