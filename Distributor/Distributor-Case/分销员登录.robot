*** Settings ***
Resource          ../Distributor-Resource/Login.robot

*** Test Cases ***
分销员登录
    ${resp}    分销商城登录    15116467517    qwe123
    接口调用是否成功    ${resp}
