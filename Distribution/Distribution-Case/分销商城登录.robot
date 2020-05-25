*** Settings ***
Resource          ../Distribution-Resource/Login.robot

*** Test Cases ***
分销商城登录
    ${resp}    分销商城登录    {"loginname":"15116467517","loginpwd":"LOGINPASSWORDHGkrAv6z3vQL9pCc8RWumFgx4PxVdJkqGS66KFW5ONx2WEM%2F%2F3kfuLK4C2SJ%2F3gIx%2BBCQ8DXEIBrMGWIYroPNsKUshZiav%2B7pdkcCTlRI3c%2FBOLatEBjKRsWXOnUrqEb2DjZJz0T4FAsEq4q2OaYMuBDPadk70TayWPnLAqaJng%3D","userFlage":1}
    接口调用是否成功    ${resp}
