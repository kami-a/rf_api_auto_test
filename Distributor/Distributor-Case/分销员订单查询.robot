*** Settings ***
Resource          ../Distributor-Resource/分销员订单.robot
Resource          ../Distributor-Resource/分销员登录.robot

*** Test Cases ***
查询店铺所有状态订单数量
    ${resp}    分销员登录
    接口调用是否成功    ${resp}
    ${token}    设置变量    ${resp.json()['result']['token']}
    ${resp1}    分销员所有状态订单数量    ${token}    2000002215
    接口调用是否成功    ${resp1}

待发货订单
    ${resp}    分销员登录
    接口调用是否成功    ${resp}
    ${token}    设置变量    ${resp.json()['result']['token']}
    ${resp1}    分销员订单列表    ${token}    2000002215    2
    接口调用是否成功    ${resp1}
    ${orderid}    设置变量    ${resp1.json()['result'][0]['order_id']}
    ${resp2}    分销员订单详情    ${token}    ${orderid}
    接口调用是否成功    ${resp2}

已发货订单
    ${resp}    分销员登录
    接口调用是否成功    ${resp}
    ${token}    set variable    ${resp.json()['result']['token']}
    ${resp1}    分销员订单列表    ${token}    2000002215    3
    ${orderid}    set variable    ${resp1.json()['result'][0]['order_id']}
    ${itemid}    set variable    ${resp1.json()['result'][0]['items'][0]['order_item_id']}
    ${resp2}    分销员订单详情    ${token}    ${orderid}
    接口调用是否成功    ${resp2}
    ${resp3}    查询物流信息    ${token}    ${orderid}    ${itemid}
    接口调用是否成功    ${resp3}

客户已收货订单
    ${resp}    分销员登录
    接口调用是否成功    ${resp}
    ${token}    设置变量    ${resp.json()['result']['token']}
    ${resp1}    分销员订单列表    ${token}    2000002215    4,5,6
    ${orderid}    设置变量    ${resp1.json()['result'][0]['order_id']}
    ${itemid}    设置变量    ${resp1.json()['result'][0]['items'][0]['order_item_id']}
    ${resp2}    分销员订单详情    ${token}    ${orderid}
    接口调用是否成功    ${resp2}
    ${resp3}    查询物流信息    ${token}    ${orderid}    ${itemid}
    接口调用是否成功    ${resp3}

售后/退货订单
    ${resp}    分销员登录
    接口调用是否成功    ${resp}
    ${token}    设置变量    ${resp.json()['result']['token']}
    ${resp1}    分销员订单列表    ${token}    2000002215    8,9
    ${orderid}    设置变量    ${resp1.json()['result'][0]['order_id']}
    ${resp2}    分销员订单详情    ${token}    ${orderid}
    接口调用是否成功    ${resp2}

全部订单
    ${resp}    分销员登录
    接口调用是否成功    ${resp}
    ${token}    设置变量    ${resp.json()['result']['token']}
    ${resp1}    分销员订单列表    ${token}    2000002215    2,3,4,5
    ${orderid}    设置变量    ${resp1.json()['result'][0]['order_id']}
    ${resp2}    分销员订单详情    ${token}    ${orderid}
    接口调用是否成功    ${resp2}
