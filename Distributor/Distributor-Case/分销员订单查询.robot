*** Settings ***
Resource          ../Distributor-Resource/分销员订单.robot
Resource          ../Distributor-Resource/分销员登录.robot

*** Test Cases ***
查询店铺所有状态订单数量
    分销员所有状态订单数量    2000002215

待发货订单
    ${resp}    分销员订单列表    2000002215    2
    ${orderid}    set variable    ${resp.json()['data'][0]['order_id']}
    ${resp}    分销员订单详情    ${orderid}
    log    ${resp.content}

已发货订单
    ${resp}    分销员订单列表    2000002215    3
    ${orderid}    set variable    ${resp.json()['data'][0]['order_id']}
    ${itemid}    set variable    ${resp.json()['data'][0]['items'][0]['order_item_id']}
    分销员订单详情    ${orderid}
    ${resp1}    分销员登录
    接口调用是否成功    ${resp1}
    ${token}    set variable    ${resp1.json()['result']['token']}
    查询物流信息    ${token}    ${orderid}    ${itemid}

客户已收货订单
    ${resp}    分销员订单列表    2000002215    4,5,6
    ${orderid}    set variable    ${resp.json()['data'][0]['order_id']}
    ${itemid}    set variable    ${resp.json()['data'][0]['items'][0]['order_item_id']}
    分销员订单详情    ${orderid}
    ${resp1}    分销员登录
    接口调用是否成功    ${resp1}
    ${token}    set variable    ${resp1.json()['result']['token']}
    查询物流信息    ${token}    ${orderid}    ${itemid}

售后/退货订单
    ${resp}    分销员订单列表    2000002215    8,9
    ${orderid}    set variable    ${resp.json()['data'][0]['order_id']}
    分销员订单详情    ${orderid}

全部订单
    ${resp}    分销员订单列表    2000002215    2,3,4,5
    ${orderid}    set variable    ${resp.json()['data'][0]['order_id']}
    ${resp}    分销员订单详情    ${orderid}
    log    ${resp.content}
