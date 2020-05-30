*** Settings ***
Resource          ../Distributor-Resource/分销员登录.robot

*** Test Cases ***
分销员登录
    ${resp}    分销员登录
    接口调用是否成功    ${resp}
