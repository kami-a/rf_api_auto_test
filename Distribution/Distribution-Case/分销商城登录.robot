*** Settings ***
Resource          ../Distribution-Resource/分销商城登录.robot

*** Test Cases ***
分销商城登录
    ${resp}    分销商城登录
    接口调用是否成功    ${resp}
