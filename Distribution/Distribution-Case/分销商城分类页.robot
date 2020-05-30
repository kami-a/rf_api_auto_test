*** Settings ***
Resource          ../Distribution-Resource/HomepageAndCategory.robot

*** Test Cases ***
查询一级类目
    ${resp}    获取一级类目
    接口调用是否成功    ${resp}

查询二级类目（冰箱）
    ${resp1}    获取二级类目    {"cid":"863"}
    ${resp2}    获取类目广告位    863
    ${resp3}    获取类目推荐位    863
    接口调用是否成功    ${resp1}
    接口调用是否成功    ${resp2}
    接口调用是否成功    ${resp3}

查询二级类目（洗衣机）
    ${resp1}    获取二级类目    {"cid":"877"}
    ${resp2}    获取类目广告位    877
    ${resp3}    获取类目推荐位    877
    接口调用是否成功    ${resp1}
    接口调用是否成功    ${resp2}
    接口调用是否成功    ${resp3}

查询二级类目（热水器）
    ${resp1}    获取二级类目    {"cid":"916"}
    ${resp2}    获取类目广告位    916
    ${resp3}    获取类目推荐位    916
    接口调用是否成功    ${resp1}
    接口调用是否成功    ${resp2}
    接口调用是否成功    ${resp3}

查询二级类目（生活家电）
    ${resp1}    获取二级类目    {"cid":"895"}
    ${resp2}    获取类目广告位    895
    ${resp3}    获取类目推荐位    895
    接口调用是否成功    ${resp1}
    接口调用是否成功    ${resp2}
    接口调用是否成功    ${resp3}

查询二级类目（手机）
    ${resp1}    获取二级类目    {"cid":"882"}
    ${resp2}    获取类目广告位    882
    ${resp3}    获取类目推荐位    882
    接口调用是否成功    ${resp1}
    接口调用是否成功    ${resp2}
    接口调用是否成功    ${resp3}

查询二级类目（空调）
    ${resp1}    获取二级类目    {"cid":"849"}
    ${resp2}    获取类目广告位    849
    ${resp3}    获取类目推荐位    849
    接口调用是否成功    ${resp1}
    接口调用是否成功    ${resp2}
    接口调用是否成功    ${resp3}

查询二级类目（中央空调）
    ${resp1}    获取二级类目    {"cid":"856"}
    ${resp2}    获取类目广告位    856
    ${resp3}    获取类目推荐位    856
    接口调用是否成功    ${resp1}
    接口调用是否成功    ${resp2}
    接口调用是否成功    ${resp3}

查询二级类目（常用配件）
    ${resp1}    获取二级类目    {"cid":"923"}
    ${resp2}    获取类目广告位    923
    ${resp3}    获取类目推荐位    923
    接口调用是否成功    ${resp1}
    接口调用是否成功    ${resp2}
    接口调用是否成功    ${resp3}

查询二级类目（智能家居）
    ${resp1}    获取二级类目    {"cid":"984"}
    ${resp2}    获取类目广告位    984
    ${resp3}    获取类目推荐位    984
    接口调用是否成功    ${resp1}
    接口调用是否成功    ${resp2}
    接口调用是否成功    ${resp3}

查询二级类目（增值服务）
    ${resp1}    获取二级类目    {"cid":"1067"}
    ${resp2}    获取类目广告位    1067
    ${resp3}    获取类目推荐位    1067
    接口调用是否成功    ${resp1}
    接口调用是否成功    ${resp2}
    接口调用是否成功    ${resp3}

查询二级类目（工业制品）
    ${resp1}    获取二级类目    {"cid":"1099"}
    ${resp2}    获取类目广告位    1099
    ${resp3}    获取类目推荐位    1099
    接口调用是否成功    ${resp1}
    接口调用是否成功    ${resp2}
    接口调用是否成功    ${resp3}
