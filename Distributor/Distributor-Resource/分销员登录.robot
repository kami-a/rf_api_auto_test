*** Settings ***
Resource          ../../Common/底层接口.robot

*** Variables ***
${name}           18529618868
${finalpwd}       LOGINPWDMDAwMzY3

*** Keywords ***
分销员登录
    [Arguments]    ${name}=${name}    ${finalpwd}=${finalpwd}
    [Documentation]    用户名 | 加密后的密码
    ${response}    Post    fmall    /distribution-shop/login    {"loginname":"${name}","loginpwd":"${finalpwd}","userFlage":1}
    [Return]    ${response}
