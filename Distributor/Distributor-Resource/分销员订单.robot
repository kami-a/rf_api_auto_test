*** Settings ***
Resource          ../../Common/底层接口.robot

*** Keywords ***
分销员订单列表
    [Arguments]    ${token}    ${shopid}    ${states}    ${page}=1
    [Documentation]    端 | 店铺id | 订单状态 | 页码
    ...
    ...    订单状态：
    ...    2 待发货
    ...    3 已发货
    ...    4,5,6 客户已收货
    ...    8,9 售后/退货
    ...    2,3,4,5 全部
    Comment    #获取token和用户实例名
    Comment    ${resp}    获取BI接口的token
    Comment    ${token}    Set Variable    ${resp.json()['token']['token']}
    Comment    ${userInstance}    Set Variable    ${resp.json()['token']['userInstance']}
    Comment    #获取当前时间
    Comment    ${time}    Get Current Date    result_format=epoch
    Comment    ${time}    evaluate    round(${time}*1000)
    Comment    ${time}    Convert To String    ${time}
    Comment    #获取checksum
    Comment    ${checksum}    md5加密    ${userInstance}_${time}_{"shopId":"${shopid}","orderItemStates":[${states}],"pageNumber":${page},"orderId":"","receiverMobile":"","receiverName":"","orderMobile":""}_orja3YG3ot0UqWnL
    Comment    #构建请求头
    Comment    ${header}    Create Dictionary    Content-Type=application/json    x-username=${userInstance}    x-now=${time}    x-checksum=${checksum}    x-token=${token}
    #发送请求
    ${resp}    Post    fmall    /distribution-shop/orderDetails    {"shopId":"${shopid}","orderItemStates":"${states}","pageNumber":${page},"orderId":"","receiverMobile":"","receiverName":"","orderMobile":""}    ${token}
    [Return]    ${resp}

获取BI接口的token
    ${time}    Get Current Date    result_format=epoch
    ${time}    evaluate    round(${time}*1000)
    ${time}    Convert To String    ${time}
    ${checksum}    md5加密    bimallapp_${time}_orja3YG3ot0UqWnL
    ${header}    Create Dictionary    Content-Type=application/json    x-username=bimallapp    x-now=${time}    x-checksum=${checksum}
    ${resp}    Post    adpcloud    /ms/token/get    {"password": "Bimallapp@20200409"}    header=${header}
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Be Equal As Strings    ${resp.json()['success']}    True
    [Return]    ${resp}

分销员所有状态订单数量
    [Arguments]    ${token}    ${shopid}
    Comment    #获取token和用户实例名
    Comment    ${resp}    获取BI接口的token
    Comment    ${token}    Set Variable    ${resp.json()['token']['token']}
    Comment    ${userInstance}    Set Variable    ${resp.json()['token']['userInstance']}
    Comment    #获取当前时间
    Comment    ${time}    Get Current Date    result_format=epoch
    Comment    ${time}    evaluate    round(${time}*1000)
    Comment    ${time}    Convert To String    ${time}
    Comment    #获取checksum
    Comment    ${checksum}    md5加密    ${userInstance}_${time}_{"shopId":"${shopid}"}_orja3YG3ot0UqWnL
    Comment    #构建请求头
    Comment    ${header}    Create Dictionary    Content-Type=application/json    x-username=${userInstance}    x-now=${time}    x-checksum=${checksum}    x-token=${token}
    #发送请求
    ${resp}    Get    fmall    /distribution-shop/shopReport/orderCount?shopId=${shopid}    ${token}
    [Return]    ${resp}

分销员订单详情
    [Arguments]    ${token}    ${orderid}
    [Documentation]    端 | 订单id
    Comment    #获取token和用户实例名
    Comment    ${resp}    获取BI接口的token
    Comment    ${token}    Set Variable    ${resp.json()['token']['token']}
    Comment    ${userInstance}    Set Variable    ${resp.json()['token']['userInstance']}
    Comment    #获取当前时间
    Comment    ${time}    Get Current Date    result_format=epoch
    Comment    ${time}    evaluate    round(${time}*1000)
    Comment    ${time}    Convert To String    ${time}
    Comment    #获取checksum
    Comment    ${checksum}    md5加密    ${userInstance}_${time}_{"orderId":"${orderid}"}_orja3YG3ot0UqWnL
    Comment    #构建请求头
    Comment    ${header}    Create Dictionary    Content-Type=application/json    x-username=${userInstance}    x-now=${time}    x-checksum=${checksum}    x-token=${token}
    #发送请求
    ${resp}    Post    fmall    /distribution-shop/orderDetails    {"orderId":"${orderid}"}    ${token}
    [Return]    ${resp}

查询物流信息
    [Arguments]    ${token}    ${orderid}    ${itemid}
    ${resp}    Get    fmall    /distribution-shop/user/order/deliveryTrack?orderId=${orderid}&orderItemId=${itemid}    ${token}
    [Return]    ${resp}
