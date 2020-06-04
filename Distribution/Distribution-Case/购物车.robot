*** Settings ***
Resource          ../Distribution-Resource/HomepageAndCategory.robot
Resource          ../Distribution-Resource/购物车.robot
Resource          ../Distribution-Resource/分销商城登录.robot

*** Test Cases ***
购物车添加删除
    ${resp0}    分销商城登录
    接口调用是否成功    ${resp0}
    ${token}    set variable    ${resp0.json()['result']['token']}
    ${uid}    set variable    ${resp0.json()['result']['uid']}
    #获取添加购物车商品信息
    ${resp}    查询商品列表    null    2000002215    ${token}
    接口调用是否成功    ${resp}
    ${distributionShopId}    set variable    ${resp.json()['result']['searchGoodsResponse']['skuDTOList'][0]['distributionShopId']}
    ${distributionItemId}    set variable    ${resp.json()['result']['searchGoodsResponse']['skuDTOList'][0]['distributionItemId']}
    ${itemid}    set variable    ${resp.json()['result']['searchGoodsResponse']['skuDTOList'][0]['itemId']}
    ${shopId}    set variable    ${resp.json()['result']['searchGoodsResponse']['skuDTOList'][0]['shopId']}
    ${skuId}    set variable    ${resp.json()['result']['searchGoodsResponse']['skuDTOList'][0]['skuId']}
    ${sellerId}    set variable    ${resp.json()['result']['searchGoodsResponse']['skuDTOList'][0]['sellerId']}
    ${resp1}    添加商品到购物车    ${token}    ${distributionShopId}    ${distributionItemId}    ${itemid}    ${sellerId}    ${shopId}    ${skuId}    ${uid}
    接口调用是否成功    ${resp1}
    ${resp5}    购物车删除商品    ${token}    ${skuId}
    接口调用是否成功    ${resp5}

购物车选中取消选中
    ${resp0}    分销商城登录
    接口调用是否成功    ${resp0}
    ${token}    set variable    ${resp0.json()['result']['token']}
    ${uid}    set variable    ${resp0.json()['result']['uid']}
    #获取添加购物车商品信息
    ${resp}    查询商品列表    null    2000002215    ${token}
    接口调用是否成功    ${resp}
    ${distributionShopId}    set variable    ${resp.json()['result']['searchGoodsResponse']['skuDTOList'][0]['distributionShopId']}
    ${distributionItemId}    set variable    ${resp.json()['result']['searchGoodsResponse']['skuDTOList'][0]['distributionItemId']}
    ${itemid}    set variable    ${resp.json()['result']['searchGoodsResponse']['skuDTOList'][0]['itemId']}
    ${shopId}    set variable    ${resp.json()['result']['searchGoodsResponse']['skuDTOList'][0]['shopId']}
    ${skuId}    set variable    ${resp.json()['result']['searchGoodsResponse']['skuDTOList'][0]['skuId']}
    ${sellerId}    set variable    ${resp.json()['result']['searchGoodsResponse']['skuDTOList'][0]['sellerId']}
    ${resp1}    添加商品到购物车    ${token}    ${distributionShopId}    ${distributionItemId}    ${itemid}    ${sellerId}    ${shopId}    ${skuId}    ${uid}
    接口调用是否成功    ${resp1}
    #购物车商品选中状态
    ${resp2}    购物车列表    ${token}
    接口调用是否成功    ${resp2}
    ${skuId2}    set variable    ${resp2.json()['result']['shops'][0]['products'][0]['skuId']}
    ${checked2}    set variable    ${resp2.json()['result']['shops'][0]['products'][0]['checked']}
    #取消选中商品
    ${resp3}    购物车选择商品    ${token}    False    ${skuId2}
    接口调用是否成功    ${resp3}
    #商品是否取消选中
    ${resp4}    购物车列表    ${token}
    接口调用是否成功    ${resp4}
    ${checked4}    set variable    ${resp4.json()['result']['shops'][0]['products'][0]['checked']}
    Should Be Equal As Strings    ${checked4}    False
    #选中商品
    ${resp3}    购物车选择商品    ${token}    True    ${skuId2}
    接口调用是否成功    ${resp3}
    #商品是否选中
    ${resp4}    购物车列表    ${token}
    接口调用是否成功    ${resp4}
    ${checked4}    set variable    ${resp4.json()['result']['shops'][0]['products'][0]['checked']}
    Should Be Equal As Strings    ${checked4}    True
    ${resp5}    购物车删除商品    ${token}    ${skuId}
    接口调用是否成功    ${resp5}
