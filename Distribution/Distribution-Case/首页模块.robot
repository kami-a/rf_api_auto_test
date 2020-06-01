*** Settings ***
Resource          ../Distribution-Resource/HomepageAndCategory.robot

*** Test Cases ***
获取首页顶部轮播图
    ${resp}    获取首页轮播图    2000001629
    接口调用是否成功    ${resp}

获取首页蒙层
    ${resp}    获取首页蒙层    2000001629
    接口调用是否成功    ${resp}

获取首页楼层
    ${resp}    获取首页楼层    2000001629
    接口调用是否成功    ${resp}

获取首页快报及快报列表
    ${resp1}    获取首页快报
    ${resp2}    获取快报列表
    接口调用是否成功    ${resp1}
    接口调用是否成功    ${resp2}

关键字查询
    ${resp}    根据关键字查询商品列表    keyword=冰箱
    接口调用是否成功    ${resp}
