*** Settings ***
Resource          ../Distribution-Resource/HomepageAndCategory.robot

*** Variables ***
${disShopid}      2000002215

*** Test Cases ***
查询一级类目
    ${resp}    获取一级类目    ${disShopid}
    接口调用是否成功    ${resp}

查询二级类目（冰箱）
    ${resp1}    获取二级类目    863    ${disShopid}
    ${resp2}    获取类目广告位    863
    ${resp3}    获取类目推荐位    863
    接口调用是否成功    ${resp1}
    接口调用是否成功    ${resp2}
    接口调用是否成功    ${resp3}

查询二级类目（洗衣机）
    ${resp1}    获取二级类目    877    ${disShopid}
    ${resp2}    获取类目广告位    877
    ${resp3}    获取类目推荐位    877
    接口调用是否成功    ${resp1}
    接口调用是否成功    ${resp2}
    接口调用是否成功    ${resp3}

查询二级类目（热水器）
    ${resp1}    获取二级类目    916    ${disShopid}
    ${resp2}    获取类目广告位    916
    ${resp3}    获取类目推荐位    916
    接口调用是否成功    ${resp1}
    接口调用是否成功    ${resp2}
    接口调用是否成功    ${resp3}

查询二级类目（生活家电）
    ${resp1}    获取二级类目    895    ${disShopid}
    ${resp2}    获取类目广告位    895
    ${resp3}    获取类目推荐位    895
    接口调用是否成功    ${resp1}
    接口调用是否成功    ${resp2}
    接口调用是否成功    ${resp3}

查询二级类目（手机）
    ${resp1}    获取二级类目    882    ${disShopid}
    ${resp2}    获取类目广告位    882
    ${resp3}    获取类目推荐位    882
    接口调用是否成功    ${resp1}
    接口调用是否成功    ${resp2}
    接口调用是否成功    ${resp3}

查询二级类目（空调）
    ${resp1}    获取二级类目    849    ${disShopid}
    ${resp2}    获取类目广告位    849
    ${resp3}    获取类目推荐位    849
    接口调用是否成功    ${resp1}
    接口调用是否成功    ${resp2}
    接口调用是否成功    ${resp3}

查询二级类目（中央空调）
    ${resp1}    获取二级类目    856    ${disShopid}
    ${resp2}    获取类目广告位    856
    ${resp3}    获取类目推荐位    856
    接口调用是否成功    ${resp1}
    接口调用是否成功    ${resp2}
    接口调用是否成功    ${resp3}

查询二级类目（常用配件）
    ${resp1}    获取二级类目    923    ${disShopid}
    ${resp2}    获取类目广告位    923
    ${resp3}    获取类目推荐位    923
    接口调用是否成功    ${resp1}
    接口调用是否成功    ${resp2}
    接口调用是否成功    ${resp3}

查询二级类目（智能家居）
    ${resp1}    获取二级类目    984    ${disShopid}
    ${resp2}    获取类目广告位    984
    ${resp3}    获取类目推荐位    984
    接口调用是否成功    ${resp1}
    接口调用是否成功    ${resp2}
    接口调用是否成功    ${resp3}

查询二级类目（增值服务）
    ${resp1}    获取二级类目    1067    ${disShopid}
    ${resp2}    获取类目广告位    1067
    ${resp3}    获取类目推荐位    1067
    接口调用是否成功    ${resp1}
    接口调用是否成功    ${resp2}
    接口调用是否成功    ${resp3}

查询二级类目（工业制品）
    ${resp1}    获取二级类目    1099    ${disShopid}
    ${resp2}    获取类目广告位    1099
    ${resp3}    获取类目推荐位    1099
    接口调用是否成功    ${resp1}
    接口调用是否成功    ${resp2}
    接口调用是否成功    ${resp3}
