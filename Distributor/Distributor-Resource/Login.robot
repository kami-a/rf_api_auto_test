*** Settings ***
Resource          ../../Common/底层接口.robot

*** Keywords ***
分销商城登录
    [Arguments]    ${loginname}    ${password}
    ${pwd}    evaluate    base64.b64encode(b'${password}')    base64
    ${response}    Post    fmall    /mobile/login    {"loginname":"${loginname}","loginpwd":"LOGINPWD${pwd}","userFlage":1}
    [Return]    ${response}
