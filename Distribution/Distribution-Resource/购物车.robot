*** Settings ***
Resource          ../../Common/底层接口.robot

*** Keywords ***
购物车列表
    [Arguments]    ${token}
    ${resp}    Post    fmall    /mobile/shopCart/list    \    ${token}
    [Return]    ${resp}

购物车选择商品
    [Arguments]    ${token}    ${choose}    ${skuid}
    [Documentation]    choose：是否选中
    ...
    ...    true：选中
    ...
    ...    false：取消选中
    ${resp}    Post    fmall    /mobile/shopCart/checkProduct    {"check":"${choose}","skuId":"${skuid}"}    ${token}
    [Return]    ${resp}

添加商品到购物车
    [Arguments]    ${token}    ${distributionShopId}    ${distributionItemId}    ${sellerId}    ${shopid}    ${skuid}    ${uid}
    ${resp}    Post    fmall    /mobile/shopCart/add    {"distributionRequest":{"distributionId":null,"distributionItemId":"${distributionItemId}","distributionShopId":"${distributionShopId}"},"product":{"qty":"9789","advanceActivitySellerId":"","depositValue":"","itemId":"1000135269","payType":0,"quantity":1,"regionId":"11","sellerId":"${sellerId}","shopId":"${shopid}","skuId":"${skuid}"},"quantityNum":"undefined","uid":"${uid}"}    ${token}
    [Return]    ${resp}

购物车删除商品
    [Arguments]    ${token}    ${skuid}
    ${resp}    Post    fmall    /mobile/shopCart/del    {"skuId":"${skuid}"}    ${token}
    [Return]    ${resp}

购物车列表-无需登录
    ${resp}    Post    fmall    /mobile/shop/list
    [Return]    ${resp}

购物车选择商品-无需登录
    [Arguments]    ${choose}    ${skuid}
    [Documentation]    choose：是否选中
    ...
    ...    true：选中
    ...
    ...    false：取消选中
    ${resp}    Post    fmall    /mobile/shop/checkProduct    {"check":"${choose}","skuId":"${skuid}"}
    [Return]    ${resp}

添加商品到购物车-无需登录
    [Arguments]    ${distributionShopId}    ${distributionItemId}    ${sellerId}    ${shopid}    ${skuid}    ${uid}
    ${resp}    Post    fmall    /mobile/shop/addToCart    {"distributionRequest":{"distributionId":null,"distributionItemId":"${distributionItemId}","distributionShopId":"${distributionShopId}"},"product":{"qty":"9789","advanceActivitySellerId":"","depositValue":"","itemId":"1000135269","payType":0,"quantity":1,"regionId":"11","sellerId":"${sellerId}","shopId":"${shopid}","skuId":"${skuid}"},"quantityNum":"undefined","uid":"null"}
    [Return]    ${resp}

购物车删除商品-无需登录
    [Arguments]    ${skuid}
    ${resp}    Post    fmall    /mobile/shop/del    {"skuId":"${skuid}"}
    [Return]    ${resp}
