*** Settings ***
Resource          ../../Common/底层接口.robot

*** Keywords ***
获取收货地址
    [Arguments]    ${token}    ${userAddressId}
    ${resp}    Post    fmall    mobile/user/address/getDetail    {"userAddressId":"${userAddressId}"}    ${token}
    [Return]    ${resp}

获取订单详情
    [Arguments]    ${token}    ${distributionId}    ${distributionItemId}    ${distributionShopId}    ${itemId}    ${sellerId}    ${shopId}    ${skuId}    ${provinceId}    ${cityId}    ${countyId}
    ${resp}    Post    fmall    mobile/shopCart/toOrderDetail    { \    "couponInfoDTOList": null, \    "credit": "0", \    "distributionRequest": { \    \    "distributionId": "${distributionId}", \    \    "distributionItemId": "${distributionItemId}", \    \    "distributionShopId": "${distributionShopId}", \    \    "giftOrderFlag": null \    }, \
    ...    "product": { \    \    "advanceActivitySellerId": null, \    \    "depositValue": null, \    \    "itemId": "${itemId}", \    \    "payType": 0, \    \    "quantity": 1, \    \    "regionId": "11", \    \    "sellerId": "${sellerId}", \    ${EMPTY}
    ...    "shopId": "${shopId}", \    \    "skuId": "${skuId}", \    \    "shopInfoDTOList": null \    }, \    "tradeOrdersDTO": { \    \    "provinceId": "${provinceId}", \    \    "cityId": "${cityId}", \    \    "countyId": "${countyId}" \    } }    ${token}
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
    [Arguments]    ${token}    ${distributionId}    ${distributionItemId}    ${distributionShopId}    ${sellerId}    ${shopId}    ${skuId}    ${cityId}    ${countyId}    ${detailAddress}    ${fullAddress}    ${mobile}    ${name}    ${provinceId}    ${townId}
    ${resp}    Post    fmall    mobile/shopCart/orderSubmitMQ    {"orderDetailRequest":{"couponInfoDTOList":[],"credit":"","distributionRequest":{"distributionId":"${distributionId}","distributionItemId":"${distributionItemId}","distributionShopId":"${distributionShopId}"},"distributorShopId":"${distributionShopId}","gbean":"","giftOrderFlag":"","product":{"advanceActivitySellerId":null,"depositValue":null,"itemId":"${itemId}","payType":"0","quantity":"1","regionId":"11","sellerId":"${sellerId}","shopId":"${shopId}","skuId":"${skuId}"},"shopInfoDTOList":[{"shopId":"${shopId}","deliveryFreightDTOList":[{}],"promotionDTOList":[{"id":"1"}],"skuInfoDTOList":[]}],"useRecognitionCode":""},"tradeOrdersDTO":{"cityId":"${cityId}","countyId":"${countyId}","detailAddress":"${detailAddress}","estimate":null,"fullAddress":"${fullAddress}","invoice":"2","invoiceTaxpayer":null,"invoiceUserName":"测试人员，请勿发货","memo":"","mobile":"${mobile}","name":"${name}","provinceId":"${provinceId}","registeredAddress":null,"shipmentType":"1","ticketAddress":null,"townId":"${townId}","tradeSource":"2"}}    ${token}
    [Return]    ${resp}
