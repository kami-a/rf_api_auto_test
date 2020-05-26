*** Settings ***
Resource          ../../Common/底层接口.robot
Library           md5Code

*** Keywords ***
分销员订单列表
    [Arguments]    ${url}    ${shopid}    ${states}    ${page}=1
    [Documentation]    店铺id|订单状态|页码
    ...
    ...    订单状态：
    ...    2 待发货
    ...    3 已发货
    ...    4,5,6 客户已收货
    ...    8,9 售后/退货
    ...    2,3,4,5 全部
    #获取token和用户实例名
    ${resp}    获取BI接口的token
    ${token}    Set Variable    ${resp.json()['token']['token']}
    ${userInstance}    Set Variable    ${resp.json()['token']['userInstance']}
    #获取当前时间
    ${time}    Get Current Date    result_format=epoch
    ${time}    evaluate    round(${time}*1000)
    ${time}    Convert To String    ${time}
    #获取checksum
    ${checksum}    get_md5    ${userInstance}_${time}_{"shopId":"${shopid}","orderItemStates":[${states}],"pageNumber":${page},"orderId":"","receiverMobile":"","receiverName":"","orderMobile":""}_orja3YG3ot0UqWnL
    #构建请求头
    ${header}    Create Dictionary    Content-Type=application/json    x-username=${userInstance}    x-now=${time}    x-checksum=${checksum}    x-token=${token}
    #发送请求
    ${resp}    Post    ${url}    /ms/bi_mall_app/OrderDetails    {"shopId":"${shopid}","orderItemStates":[${states}],"pageNumber":${page},"orderId":"","receiverMobile":"","receiverName":"","orderMobile":""}    header=${header}
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Be Equal As Strings    ${resp.json()['success']}    True
    [Return]    ${resp}

获取BI接口的token
    ${time}    Get Current Date    result_format=epoch
    ${time}    evaluate    round(${time}*1000)
    ${time}    Convert To String    ${time}
    ${checksum}    get_md5    bimallapp_${time}_orja3YG3ot0UqWnL
    ${header}    Create Dictionary    Content-Type=application/json    x-username=bimallapp    x-now=${time}    x-checksum=${checksum}
    ${resp}    Post    adpcloud    /ms/token/get    {"password": "Bimallapp@20200409"}    header=${header}
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Be Equal As Strings    ${resp.json()['success']}    True
    [Return]    ${resp}

分销员所有状态订单数量
    [Arguments]    ${shopid}
    #获取token和用户实例名
    ${resp}    获取BI接口的token
    ${token}    Set Variable    ${resp.json()['token']['token']}
    ${userInstance}    Set Variable    ${resp.json()['token']['userInstance']}
    #获取当前时间
    ${time}    Get Current Date    result_format=epoch
    ${time}    evaluate    round(${time}*1000)
    ${time}    Convert To String    ${time}
    #获取checksum
    ${checksum}    get_md5    ${userInstance}_${time}_{"shopId":"${shopid}"}_orja3YG3ot0UqWnL
    #构建请求头
    ${header}    Create Dictionary    Content-Type=application/json    x-username=${userInstance}    x-now=${time}    x-checksum=${checksum}    x-token=${token}
    #发送请求
    ${resp}    Post    adpcloud    /ms/bi_mall_app/OrderCount    {"shopId":"${shopid}"}    header=${header}
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Be Equal As Strings    ${resp.json()['success']}    True
    [Return]    ${resp}
