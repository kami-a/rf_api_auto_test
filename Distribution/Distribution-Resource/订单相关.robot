*** Settings ***
Resource          ../../Common/底层接口.robot

*** Keywords ***
获取收货地址
    [Arguments]    ${token}    ${userAddressId}
    ${resp}    Post    fmall    mobile/user/address/getDetail    {"userAddressId":"${userAddressId}"}    ${token}
    [Return]    ${resp}

获取订单详情
    [Arguments]    ${token}    ${distributionId}    ${distributionItemId}    ${distributionShopId}    ${itemId}    ${sellerId}    ${shopId}    ${skuId}    ${provinceId}    ${cityId}    ${countyId}
    ${resp}    Post    fmall    mobile/shopCart/toOrderDetail    {"couponInfoDTOList":[],"credit":"0","distributionRequest":{"distributionId":"${distributionId}","distributionItemId":"${distributionItemId}","distributionShopId":"${distributionShopId}"},"distributorShopId":"${distributionShopId}","giftOrderFlag":"","product":{"advanceActivitySellerId":null,"depositValue":null,"itemId":"${itemId}","payType":"0","quantity":"1","regionId":"11","sellerId":"${sellerId}","shopId":"${shopId}","skuId":"${skuId}"},"shopInfoDTOList":[],"tradeOrdersDTO":{"provinceId":"${provinceId}","cityId":"${cityId}","countyId":"${countyId}"}}    ${token}
    [Return]    ${resp}

检查店铺配送区域
    [Arguments]    ${token}    ${shopId}    ${code}
    ${resp}    Post    fmall    mobile/goods/checkShopTerritory    {"code":"${code}","shopId":"${shopId}"}    ${token}
    [Return]    ${resp}

获取个人收货地址列表
    [Arguments]    ${token}
    ${resp}    Post    fmall    mobile/user/address/getList    \    ${token}
    [Return]    ${resp}

提交订单
    [Arguments]    ${token}    ${distributionId}    ${distributionItemId}    ${distributionShopId}    ${itemId}    ${sellerId}    ${shopId}    ${skuId}    ${cityId}    ${countyId}    ${detailAddress}    ${fullAddress}    ${mobile}    ${name}    ${provinceId}    ${townId}
    ${resp}    Post    fmall    mobile/shopCart/orderSubmitMQ    {"orderDetailRequest":{"couponInfoDTOList":[],"credit":"","distributionRequest":{"distributionId":"${distributionId}","distributionItemId":"${distributionItemId}","distributionShopId":"${distributionShopId}"},"distributorShopId":"${distributionShopId}","gbean":"","giftOrderFlag":"","product":{"advanceActivitySellerId":null,"depositValue":null,"itemId":"${itemId}","payType":"0","quantity":"1","regionId":"11","sellerId":"${sellerId}","shopId":"${shopId}","skuId":"${skuId}"},"shopInfoDTOList":[{"shopId":"${shopId}","deliveryFreightDTOList":[{}],"promotionDTOList":[{"id":"1"}],"skuInfoDTOList":[]}],"useRecognitionCode":""},"tradeOrdersDTO":{"cityId":"${cityId}","countyId":"${countyId}","detailAddress":"${detailAddress}","estimate":null,"fullAddress":"${fullAddress}","invoice":"2","invoiceTaxpayer":null,"invoiceUserName":"测试人员，请勿发货","memo":"","mobile":"${mobile}","name":"${name}","provinceId":"${provinceId}","registeredAddress":null,"shipmentType":"1","ticketAddress":null,"townId":"${townId}","tradeSource":"2"}}    ${token}
    [Return]    ${resp}

检查注册手机历史订单
    [Arguments]    ${token}    ${orderId}
    ${resp}    Post    fmall    mobile/shopCart/verifyOrderSubmitMobile    {"orderId":"${orderId}"}    ${token}
    [Return]    ${resp}

获取用户信息
    [Arguments]    ${token}
    ${resp}    Post    fmall    mobile/user/getUserInfo    \    ${token}
    [Return]    ${resp}

检查订单数量限制
    [Arguments]    ${token}    ${orderId}
    ${resp}    Post    fmall    mobile/purchaseItemLimit/check    {"orderId":"${orderId}"}    ${token}
    [Return]    ${resp}

检查是否是以旧换新订单
    [Arguments]    ${token}    ${orderId}
    ${resp}    Post    fmall    mobile/questionnaire/oldForNew/check    {"orderId":"${orderId}"}    ${token}
    [Return]    ${resp}

获取微信支付配置
    [Arguments]    ${token}
    ${resp}    Post    fmall    mobile/shopCart/getWeiXinJSConfig?url=https:%2F%2Ffmall.gree.com%2Fmobile%2Findex.html%23%2Fcar%2Fpay    \    ${token}
    [Return]    ${resp}

获取钱包账户
    [Arguments]    ${token}    ${walletId}
    ${resp}    Post    fmall    mobile/wallet/myBankAccounts    {"walletId":"${walletId}"}    ${token}
    [Return]    ${resp}

获取钱包详情
    [Arguments]    ${token}    ${walletId}
    ${resp}    Post    fmall    mobile/wallet/walletInfo    {"isNeedPwd":0,"walletId":"${walletId}"}    ${token}
    [Return]    ${resp}

格力调用银行请求是否正常
    [Arguments]    ${token}    ${skuId}    ${mobile}    ${total}    ${order_id}
    ${resp}    Post    dm    common-log/api/v1/log/gree    {"account_id":"","activity_id":"","channel":"H5","cmd_count":"1","commodity_id":"${skuId}","member_id":"${mobile}","money":"${total}","order_id":"${order_id}","type":"unpay"}    ${token}
    [Return]    ${resp}

查看所有订单
    [Arguments]    ${token}
    ${resp}    Post    fmall    mobile/user/order/getBuyerOrderList    {"page":"1","state":""}    ${token}
    [Return]    ${resp}

查看订单详情
    [Arguments]    ${token}    ${orderId}
    ${resp}    Post    fmall    mobile/user/order/getDetail    {"orderId":"${orderId}"}    ${token}
    [Return]    ${resp}

取消订单
    [Arguments]    ${token}    ${orderId}
    ${resp}    Post    fmall    mobile/user/order/getDetail    {"orderId":"${orderId}"}    ${token}
    [Return]    ${resp}

搜索订单
    [Arguments]    ${token}    ${keyword}
    ${resp}    Post    fmall    mobile/user/order/getBuyerOrderList    {"keyword":"${keyword}"}    ${token}
    [Return]    ${resp}
