*** Settings ***
Resource          ../../Common/底层接口.robot

*** Keywords ***
分销商城登录
    [Arguments]    ${requestBody}
    ${response}    Post    fmall    /distribution-shop/login    ${requestBody}
    [Return]    ${response}
