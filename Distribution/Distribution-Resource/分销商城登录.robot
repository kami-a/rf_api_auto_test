*** Settings ***
Resource          ../../Common/底层接口.robot

*** Variables ***
${user}           18813760631
${finalpwd}       LOGINPASSWORDLNQRcBEcowLqu0fBH5gNdZ6zlJf2yrbq5gAa0HeHr1JYcgxYINFOQYTULqZ3zC8Ck7Qo7k382OKP52yBmVH4WC%2FpWg17GC%2Fawbtnl6ZdYbORzPu22MY44xIXqDXPjmim0etaz%2BaqjAeoMcqrOAfYBbjNBmEAa2t0%2F1PCjFeQKIM%3D

*** Keywords ***
分销商城登录
    [Arguments]    ${user}=${user}    ${finalpwd}=${finalpwd}
    ${response}    Post    fmall    /mobile/login    {"loginname":"${user}","loginpwd":"${finalpwd}","userFlage":1}
    [Return]    ${response}
