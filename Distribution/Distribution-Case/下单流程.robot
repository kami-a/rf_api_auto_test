*** Settings ***
Resource          ../Distribution-Resource/HomepageAndCategory.robot
Resource          ../Distribution-Resource/分销商城登录.robot
Resource          ../Distribution-Resource/下单流程.robot
Resource          ../Distribution-Resource/购物车.robot

*** Test Cases ***
直接提交订单
    ${resp0}    分销商城登录
    接口调用是否成功    ${resp0}
    ${token}    set variable    ${resp0.json()['result']['token']}
    ${resp}    查询商品列表    null    2000002215    ${token}
    接口调用是否成功    ${resp}
    ${distributionId}    set variable    ${resp.json()['result']['searchGoodsResponse']['skuDTOList'][0]['distributionId']}
    ${distributionShopId}    set variable    ${resp.json()['result']['searchGoodsResponse']['skuDTOList'][0]['distributionShopId']}
    ${distributionItemId}    set variable    ${resp.json()['result']['searchGoodsResponse']['skuDTOList'][0]['distributionItemId']}
    ${itemId}    set variable    ${resp.json()['result']['searchGoodsResponse']['skuDTOList'][0]['itemId']}
    ${shopId}    set variable    ${resp.json()['result']['searchGoodsResponse']['skuDTOList'][0]['shopId']}
    ${skuId}    set variable    ${resp.json()['result']['searchGoodsResponse']['skuDTOList'][0]['skuId']}
    ${sellerId}    set variable    ${resp.json()['result']['searchGoodsResponse']['skuDTOList'][0]['sellerId']}
    ${resp1}    获取个人收货地址列表    ${token}
    接口调用是否成功    ${resp1}
    ${cityId}    Set Variable    ${resp1.json()['result'][0]['citycode']}
    ${countyId}    Set Variable    ${resp1.json()['result'][0]['countrycode']}
    ${detailAddress}    Set Variable    ${resp1.json()['result'][0]['address']}
    ${fullAddress}    Set Variable    ${resp1.json()['result'][0]['fulladdress']}
    ${mobile}    Set Variable    ${resp1.json()['result'][0]['contactphone']}
    log    手机号是：${mobile}
    ${name}    Set Variable    ${resp1.json()['result'][0]['contactperson']}
    ${provinceId}    Set Variable    ${resp1.json()['result'][0]['provicecode']}
    ${townId}    Set Variable    ${resp1.json()['result'][0]['towncode']}
    ${userAddressId}    Set Variable    ${resp1.json()['result'][0]['id']}
    log    ${userAddressId}
    ${resp2}    获取收货地址    ${token}    ${userAddressId}
    接口调用是否成功    ${resp2}
    ${resp3}    检查店铺配送区域    ${token}    ${townId}    ${shopId}
    接口调用是否成功    ${resp3}
    #判断配送区域是true
    Should Be Equal As Strings    ${resp3.json()['result']['exitShopTerritory']}    True
    ${resp4}    获取订单详情    ${token}    ${distributionId}    ${distributionItemId}    ${distributionShopId}    ${itemId}    ${sellerId}    ${shopId}    ${skuId}    ${provinceId}    ${cityId}    ${countyId}
    接口调用是否成功    ${resp4}
    ${resp5}    提交订单    ${token}    ${distributionId}    ${distributionItemId}    ${distributionShopId}    ${itemId}    ${sellerId}    ${shopId}    ${skuId}    ${cityId}    ${countyId}    ${detailAddress}    ${fullAddress}    ${mobile}     ${name}    ${provinceId}
    ...    ${townId}
    接口调用是否成功    ${resp5}

通过购物车提交订单
