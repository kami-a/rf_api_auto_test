*** Settings ***
Resource          ../Distributor-Resource/分销员订单.robot

*** Test Cases ***
查询店铺所有状态订单数量
    ${resp}    分销员所有状态订单数量    2000002215

待发货订单
    ${resp}    分销员订单列表    adpcloud    2000002215    2

已发货订单
    ${resp}    分销员订单列表    adpcloud    2000002215    3

客户已收货订单
    ${resp}    分销员订单列表    adpcloud    2000002215    4,5,6

售后/退货订单
    ${resp}    分销员订单列表    adpcloud    2000002215    8,9

全部订单
    ${resp}    分销员订单列表    adpcloud    2000002215    2,3,4,5
