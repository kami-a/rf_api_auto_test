*** Settings ***
Resource          ../../Common/底层接口.robot

*** Variables ***
${user}           10100000001
${finalpwd}       gree123456

*** Keywords ***
分销商城登录
    [Arguments]    ${user}=${user}    ${finalpwd}=${finalpwd}
    ${response}    Post    fmall    /mobile/login    {"loginname":"${user}","loginpwd":"${finalpwd}","userFlage":1}
    [Return]    ${response}
