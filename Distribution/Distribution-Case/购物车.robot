*** Settings ***
Resource          ../Distribution-Resource/HomepageAndCategory.robot
Resource          ../Distribution-Resource/购物车.robot
Resource          ../Distribution-Resource/分销商城登录.robot

*** Test Cases ***
购物车添加删除
    ${resp4}    分销商城登录
    接口调用是否成功    ${resp4}
    ${token}    set variable    ${resp4.json()['result']['token']}
    ${uid}    set variable    ${resp4.json()['result']['uid']}
    ${resp}    查询商品列表    null    2000002215    ${token}
    接口调用是否成功    ${resp}
    ${distributionShopId}    set variable    ${resp.json()['result']['searchGoodsResponse']['skuDTOList'][0]['distributionShopId']}
    ${distributionItemId}    set variable    ${resp.json()['result']['searchGoodsResponse']['skuDTOList'][0]['distributionItemId']}
    ${shopId}    set variable    ${resp.json()['result']['searchGoodsResponse']['skuDTOList'][0]['shopId']}
    ${skuId}    set variable    ${resp.json()['result']['searchGoodsResponse']['skuDTOList'][0]['skuId']}
    ${sellerId}    set variable    ${resp.json()['result']['searchGoodsResponse']['skuDTOList'][0]['sellerId']}
    ${resp1}    添加商品到购物车    ${token}    ${distributionShopId}    ${distributionItemId}    ${sellerId}    ${shopId}    ${skuId}    ${uid}
    接口调用是否成功    ${resp1}
    ${resp2}    购物车列表    ${token}
    接口调用是否成功    ${resp2}
    ${skuId1}    set variable    ${resp2.json()['result']['shops'][0]['products'][0]['skuId']}
    ${resp3}    购物车选择商品    ${token}    false    ${skuId1}
    接口调用是否成功    ${resp3}
    ${resp5}    购物车删除商品    ${token}    ${skuId}
    接口调用是否成功    ${resp5}
