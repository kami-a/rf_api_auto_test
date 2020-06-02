*** Settings ***
Resource          ../Distribution-Resource/分销商城登录.robot

*** Test Cases ***
分销商城登录（正常）
    ${resp}    分销商城登录    10100000001    gree123456
    接口调用是否成功    ${resp}

分销商城登录（未填写密码）
    ${resp}    分销商城登录    10100000001    ''
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Be Equal As Strings    ${resp.json()["message"]}    用户名或密码不正确

分销商城登录（填写错误密码）
    ${resp}    分销商城登录    10100000001    q
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Be Equal As Strings    ${resp.json()["message"]}    用户名或密码不正确

分销商城登录（未填写用户名）
    ${resp}    分销商城登录    \    qwe123
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Be Equal As Strings    ${resp.json()["message"]}    用户名或密码不正确

分销商城登录（填写不存在的用户名）
    ${resp}    分销商城登录    101000000011    ''
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Be Equal As Strings    ${resp.json()["message"]}    用户不存在
