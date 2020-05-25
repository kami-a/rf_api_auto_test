*** Settings ***
Resource          ../Distributor-Resource/Login.robot

*** Test Cases ***
分销员登录
    ${resp}    分销商城登录    {"loginname":"15116467517","loginpwd":"LOGINPWDcXdlMTIz","userFlage":1}
    接口调用是否成功    ${resp}
