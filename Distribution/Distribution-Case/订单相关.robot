*** Settings ***
Resource          ../Distribution-Resource/HomepageAndCategory.robot
Resource          ../Distribution-Resource/分销商城登录.robot
Resource          ../Distribution-Resource/购物车.robot
Resource          ../Distribution-Resource/订单相关.robot
Library           String

*** Test Cases ***
直接提交订单
    ${resp0}    分销商城登录
    接口调用是否成功    ${resp0}
    ${token}    set variable    ${resp0.json()['result']['token']}
    ${resp}    查询商品列表    null    2000002215    ${token}
    接口调用是否成功    ${resp}
    log    ${resp.content}
    log    ${resp.json()['result']['searchGoodsResponse']['skuDTOList'][0]['distributionId']}
    ${distributionId}    空转为null非空直接输出    ${resp.json()['result']['searchGoodsResponse']['skuDTOList'][0]['distributionId']}
    ${distributionShopId}    空转为null非空直接输出    ${resp.json()['result']['searchGoodsResponse']['skuDTOList'][0]['distributionShopId']}
    ${distributionItemId}    空转为null非空直接输出    ${resp.json()['result']['searchGoodsResponse']['skuDTOList'][0]['distributionItemId']}
    ${itemId}    空转为null非空直接输出    ${resp.json()['result']['searchGoodsResponse']['skuDTOList'][0]['itemId']}
    ${shopId}    空转为null非空直接输出    ${resp.json()['result']['searchGoodsResponse']['skuDTOList'][0]['shopId']}
    ${skuId}    空转为null非空直接输出    ${resp.json()['result']['searchGoodsResponse']['skuDTOList'][0]['skuId']}
    ${sellerId}    空转为null非空直接输出    ${resp.json()['result']['searchGoodsResponse']['skuDTOList'][0]['sellerId']}
    ${resp1}    获取个人收货地址列表    ${token}
    接口调用是否成功    ${resp1}
    ${cityId}    空转为null非空直接输出    ${resp1.json()['result'][0]['citycode']}
    ${countyId}    空转为null非空直接输出    ${resp1.json()['result'][0]['countrycode']}
    ${detailAddress}    空转为null非空直接输出    ${resp1.json()['result'][0]['address']}
    ${fullAddress}    空转为null非空直接输出    ${resp1.json()['result'][0]['fulladdress']}
    ${mobile}    空转为null非空直接输出    ${resp1.json()['result'][0]['contactphone']}
    log    手机号是：${mobile}
    ${name}    空转为null非空直接输出    ${resp1.json()['result'][0]['contactperson']}
    ${provinceId}    空转为null非空直接输出    ${resp1.json()['result'][0]['provicecode']}
    ${townId}    空转为null非空直接输出    ${resp1.json()['result'][0]['towncode']}
    ${userAddressId}    空转为null非空直接输出    ${resp1.json()['result'][0]['id']}
    log    ${userAddressId}
    ${resp2}    获取收货地址    ${token}    ${userAddressId}
    接口调用是否成功    ${resp2}
    ${resp3}    检查店铺配送区域    ${token}    ${townId}    ${shopId}
    接口调用是否成功    ${resp3}
    #判断配送区域是true
    Should Be Equal As Strings    ${resp3.json()['result']['exitShopTerritory']}    True
    ${resp4}    获取订单详情    ${token}    ${distributionId}    ${distributionItemId}    ${distributionShopId}    ${itemId}    ${sellerId}    ${shopId}    ${skuId}    ${provinceId}    ${cityId}    ${countyId}
    接口调用是否成功    ${resp4}
    ${resp5}    提交订单    ${token}    ${distributionId}    ${distributionItemId}    ${distributionShopId}    ${itemId}    ${sellerId}    ${shopId}    ${skuId}    ${cityId}    ${countyId}    ${detailAddress}    ${fullAddress}    ${mobile}    ${name}    ${provinceId}
    ...    ${townId}
    接口调用是否成功    ${resp5}
    ${orderId}    空转为null非空直接输出    ${resp5.json()['result']}
    ${resp6}    检查注册手机历史订单    ${token}    ${orderId}
    Should Be Equal As Strings    ${resp6.json()['code']}    2200
    ${total}    空转为null非空直接输出    ${resp4.json()['result']['shopCartDTO']['payTotal']}
    ${order_Id}    空转为null非空直接输出    ${orderId}
    ${resp7}    格力调用银行请求是否正常    ${token}    ${skuId}    ${mobile}    ${total}    ${order_Id}
    Should Be Equal As Strings    ${resp7.status_code}    200
    ${resp8}    检查注册手机历史订单    ${token}    ${orderId}
    Should Be Equal As Strings    ${resp8.status_code}    200
    ${resp9}    获取用户信息    ${token}
    接口调用是否成功    ${resp9}
    ${resp10}    检查订单数量限制    ${token}    ${orderId}
    接口调用是否成功    ${resp10}
    ${resp11}    检查是否是以旧换新订单    ${token}    ${orderId}
    Should Be Equal As Strings    ${resp11.status_code}    200
    ${resp12}    获取微信支付配置    ${token}
    接口调用是否成功    ${resp12}
    ${resp13}    获取钱包账户    ${token}    ${resp9.json()['result']['walletId']}
    接口调用是否成功    ${resp13}
    ${resp14}    获取钱包详情    ${token}    ${resp9.json()['result']['walletId']}
    接口调用是否成功    ${resp14}

查看订单/取消订单/删除订单
    ${resp0}    分销商城登录
    接口调用是否成功    ${resp0}
    ${token}    set variable    ${resp0.json()['result']['token']}
    ${resp1}    查看所有订单    ${token}    ${EMPTY}
    接口调用是否成功    ${resp1}
    ${orderId}    set variable    ${resp1.json()['result'][0]['orderId']}
    ${resp2}    查看订单详情    ${token}    ${orderId}
    接口调用是否成功    ${resp2}
    ${resp3}    查看所有订单    ${token}    1
    接口调用是否成功    ${resp3}
    ${cancelOrderId}    set variable    ${resp3.json()['result'][0]['orderId']}
    ${resp4}    取消订单    ${token}    ${cancelOrderId}
    接口调用是否成功    ${resp4}
    #已取消订单可以删除
    ${resp5}    删除订单    ${token}    ${cancelOrderId}
    接口调用是否成功    ${resp5}

搜索订单
    ${resp0}    分销商城登录
    接口调用是否成功    ${resp0}
    ${token}    set variable    ${resp0.json()['result']['token']}
    log    token is :${token}
    ${resp1}    查看所有订单    ${token}    ${EMPTY}
    接口调用是否成功    ${resp1}
    ${orderId}    Set Variable    ${resp1.json()['result'][0]['orderId']}
    ${resp2}    搜索订单    ${token}    ${orderId}
    接口调用是否成功    ${resp2}
    ${itemName}    Set Variable    ${resp1.json()['result'][0]['itemInfoList'][0]['itemName']}
    ${subName}    String.Get Substring    ${itemName}    0    1
    ${resp3}    搜索订单    ${token}    ${subName}
    接口调用是否成功    ${resp3}
