*** Settings ***
Resource          ../Distribution-Resource/HomepageAndCategory.robot

*** Test Cases ***
分类页类目商品列表（三门冰箱）
    ${resp}    查询商品列表    1072
    接口调用是否成功    ${resp}
