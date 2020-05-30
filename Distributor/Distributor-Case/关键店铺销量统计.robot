*** Settings ***
Resource          ../Distributor-Resource/关键店铺销量.robot

*** Test Cases ***
关键店铺
    ${currentDate}    Get Current Date    result_format=%Y-%m-%d
    #八号店
    查询店铺订单商品总数和价格    fmall    2000114400    ${currentDate}
    查询店铺订单商品总数和价格    fmall    2000092034    ${currentDate}
    查询店铺订单商品总数和价格    fmall    2000092125    ${currentDate}
    查询店铺订单商品总数和价格    fmall    2000092124    ${currentDate}
    查询店铺订单商品总数和价格    fmall    2000090208    ${currentDate}
    查询店铺订单商品总数和价格    fmall    2000109586    ${currentDate}
    查询店铺订单商品总数和价格    fmall    2000115925    ${currentDate}
    查询店铺订单商品总数和价格    fmall    2000115926    ${currentDate}
    查询店铺订单商品总数和价格    fmall    2000092035    ${currentDate}
    查询店铺订单商品总数和价格    fmall    2000100942    ${currentDate}
    查询店铺订单商品总数和价格    fmall    2000115639    ${currentDate}
    查询店铺订单商品总数和价格    fmall    2000116106    ${currentDate}
    查询店铺订单商品总数和价格    fmall    2000116319    ${currentDate}
    查询店铺订单商品总数和价格    fmall    2000090204    ${currentDate}
    查询店铺订单商品总数和价格    fmall    2000092032    ${currentDate}
    查询店铺订单商品总数和价格    fmall    2000090347    ${currentDate}
    查询店铺订单商品总数和价格    fmall    2000092033    ${currentDate}
    #董明珠8号店
    查询店铺订单商品总数和价格    mall    2000100831    ${currentDate}

销售公司
    ${currentDate}    Get Current Date    result_format=%Y-%m-%d
    查询店铺订单商品总数和价格    mall    2000001095    ${currentDate}
    查询店铺订单商品总数和价格    mall    2000001051    ${currentDate}
    查询店铺订单商品总数和价格    mall    2000001009    ${currentDate}
    查询店铺订单商品总数和价格    mall    2000000956    ${currentDate}
    查询店铺订单商品总数和价格    mall    2000000960    ${currentDate}
    #海南格力旗舰店
    查询店铺订单商品总数和价格    mall    2000001047    ${currentDate}
    查询店铺订单商品总数和价格    mall    2000001053    ${currentDate}
    查询店铺订单商品总数和价格    mall    2000001007    ${currentDate}
    查询店铺订单商品总数和价格    mall    2000001036    ${currentDate}
    查询店铺订单商品总数和价格    mall    2000001013    ${currentDate}
    查询店铺订单商品总数和价格    mall    2000001135    ${currentDate}
    查询店铺订单商品总数和价格    mall    2000001174    ${currentDate}
    查询店铺订单商品总数和价格    mall    2000000990    ${currentDate}
    查询店铺订单商品总数和价格    mall    2000000963    ${currentDate}
    查询店铺订单商品总数和价格    mall    2000269073    ${currentDate}
    查询店铺订单商品总数和价格    mall    2000001110    ${currentDate}
    查询店铺订单商品总数和价格    mall    2000001184    ${currentDate}
    查询店铺订单商品总数和价格    mall    2000001059    ${currentDate}
    查询店铺订单商品总数和价格    mall    2000254207    ${currentDate}
    查询店铺订单商品总数和价格    mall    2000000967    ${currentDate}
    查询店铺订单商品总数和价格    mall    2000090344    ${currentDate}

董明珠8号店
    ${resp}    获取店铺信息    mall    2000035940
    #当日
    ${date}    Get Current Date    result_format=%Y-%m-%d
    查询店铺订单商品总数和价格    mall    2000100831    ${date}
    查询店铺每日订单数和价格    mall    2000100831    ${date}
    销量前五    mall    2000100831    ${date}
    #7日
    ${date1}    Subtract Time From Date    ${date}    7 days    %Y-%m-%d
    查询店铺订单商品总数和价格    mall    2000100831    ${date1}
    查询店铺每日订单数和价格    mall    2000100831    ${date1}
    销量前五    mall    2000100831    ${date1}
    #1个月
    ${date2}    Subtract Time From Date    ${date}    30 days    %Y-%m-%d
    查询店铺订单商品总数和价格    mall    2000100831    ${date2}
    查询店铺每日订单数和价格    mall    2000100831    ${date2}
    销量前五    mall    2000100831    ${date2}
    #总销售额
    ${creatDay}    Convert Date    ${resp.json()['result']['created']}    %Y-%m-%d
    ${resp2}    查询店铺订单商品总数和价格    mall    2000100831    ${creatDay}
    log    ${resp2.json()['result']['totalPrice']}
    查询店铺每日订单数和价格    mall    2000100831    ${creatDay}
    销量前五    mall    2000100831    ${creatDay}
    ${resp3}    查询店铺每页订单简况    mall    2000100831    ${creatDay}
    ${resp4}    获取店铺订单详情    mall    ${resp3.json()['result'][0]['orderId']}
    log    ${resp4.json()['result']['tradeOrder']['orderId']}

明珠学院店
    ${resp}    获取店铺信息    fmall    2000114400
    #当日
    ${date}    Get Current Date    result_format=%Y-%m-%d
    查询店铺订单商品总数和价格    fmall    2000114400    ${date}
    查询店铺每日订单数和价格    fmall    2000114400    ${date}
    销量前五    fmall    2000114400    ${date}
    #7日
    ${date1}    Subtract Time From Date    ${date}    7 days    %Y-%m-%d
    查询店铺订单商品总数和价格    fmall    2000114400    ${date1}
    查询店铺每日订单数和价格    fmall    2000114400    ${date1}
    销量前五    fmall    2000114400    ${date1}
    #1个月
    ${date2}    Subtract Time From Date    ${date}    30 days    %Y-%m-%d
    查询店铺订单商品总数和价格    fmall    2000114400    ${date2}
    查询店铺每日订单数和价格    fmall    2000114400    ${date2}
    销量前五    fmall    2000114400    ${date2}
    #1个年
    ${date3}    Get Current Date    result_format=%Y
    查询店铺订单商品总数和价格    fmall    2000114400    ${date3}-01-01
    查询店铺每日订单数和价格    fmall    2000114400    ${date3}-01-01
    销量前五    fmall    2000114400    ${date3}-01-01
    #总销售额
    ${creatDay}    Convert Date    ${resp.json()['result']['created']}    %Y-%m-%d
    查询店铺订单商品总数和价格    fmall    2000114400    ${creatDay}
    查询店铺每日订单数和价格    fmall    2000114400    ${creatDay}
    销量前五    fmall    2000114400    ${creatDay}
    ${resp3}    查询店铺每页订单简况    fmall    2000114400    ${creatDay}
    ${resp4}    获取店铺订单详情    fmall    ${resp3.json()['result'][0]['orderId']}
    log    ${resp4.json()['result']['tradeOrder']['orderId']}

海南格力旗舰店
    ${resp}    获取店铺信息    mall    2000001047
    #当日
    ${date}    Get Current Date    result_format=%Y-%m-%d
    查询店铺订单商品总数和价格    mall    2000001047    ${date}
    查询店铺每日订单数和价格    mall    2000001047    ${date}
    销量前五    mall    2000001047    ${date}
    #7日
    ${date1}    Subtract Time From Date    ${date}    7 days    %Y-%m-%d
    查询店铺订单商品总数和价格    mall    2000001047    ${date1}
    查询店铺每日订单数和价格    mall    2000001047    ${date1}
    销量前五    mall    2000001047    ${date1}
    #1个月
    ${date2}    Subtract Time From Date    ${date}    30 days    %Y-%m-%d
    查询店铺订单商品总数和价格    mall    2000001047    ${date2}
    查询店铺每日订单数和价格    mall    2000001047    ${date2}
    销量前五    mall    2000001047    ${date2}
    #1个年
    ${date3}    Get Current Date    result_format=%Y
    查询店铺订单商品总数和价格    mall    2000001047    ${date3}-01-01
    查询店铺每日订单数和价格    mall    2000001047    ${date3}-01-01
    销量前五    mall    2000001047    ${date3}-01-01
    #总销售额
    ${creatDay}    Convert Date    ${resp.json()['result']['created']}    %Y-%m-%d
    ${resp2}    查询店铺订单商品总数和价格    mall    2000001047    ${creatDay}
    log    ${resp2.json()['result']['totalPrice']}
    查询店铺每日订单数和价格    mall    2000001047    ${creatDay}
    销量前五    mall    2000001047    ${creatDay}
    ${resp3}    查询店铺每页订单简况    mall    2000001047    ${creatDay}
    ${resp4}    获取店铺订单详情    mall    ${resp3.json()['result'][0]['orderId']}
    log    ${resp4.json()['result']['tradeOrder']['orderId']}
