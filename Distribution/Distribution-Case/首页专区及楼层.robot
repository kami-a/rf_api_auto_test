*** Settings ***
Resource          ../Distribution-Resource/HomepageAndCategory.robot

*** Test Cases ***
获取专区（防护净化专区）
    ${resp}    获取推荐列表    19
    接口调用是否成功    ${resp}

获取楼层（全民健康）
    ${resp}    获取推荐列表    18
    接口调用是否成功    ${resp}
