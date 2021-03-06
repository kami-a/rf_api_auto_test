*** Settings ***
Library           RequestsLibrary
Library           Collections
Library           DateTime

*** Variables ***
${urlfmall}       https://fmall.gree.com
${urlmall}        https://mall.gree.com
${adpcloud}       https://adpcloud.gree.com
${dm}             https://dm.gree.com

*** Keywords ***
Post
    [Arguments]    ${url}    ${uri}    ${body}=    ${token}=    ${header}=
    ${status}    Run Keyword And Return Status    Evaluate    isinstance(${header},dict)
    ${header1}    create dictionary    Content-Type=application/json
    ${header}    Set Variable If    ${status}    ${header}    ${header1}
    ${cookies}    create dictionary    mobile_login_token=${token}
    Run Keyword If    '${url}'=='fmall' and '${token}'==''    create session    event    ${urlfmall}    ${header}    verify=true
    ...    ELSE IF    '${url}'=='fmall' and '${token}'!=''    create session    event    ${urlfmall}    ${header}    ${cookies}    verify=true
    Run Keyword If    '${url}'=='mall' and '${token}'==''    create session    event    ${urlmall}    ${header}    verify=true
    ...    ELSE IF    '${url}'=='mall' and '${token}'!=''    create session    event    ${urlmall}    ${header}    ${cookies}    verify=true
    Run Keyword If    '${url}'=='adpcloud'    create session    event    ${adpcloud}    ${header}    verify=true
    Run Keyword If    '${url}'=='dm' and '${token}'==''    create session    event    ${dm}    ${header}    verify=true
    ...    ELSE IF    '${url}'=='dm' and '${token}'!=''    create session    event    ${dm}    ${header}    ${cookies}    verify=true
    ${body}    Set Variable    ${body}
    ${resp}    Post Request    event    ${uri}    ${body}
    [Return]    ${resp}

Get
    [Arguments]    ${url}    ${uri}    ${token}=    ${header}=
    ${status}    Run Keyword And Return Status    Evaluate    isinstance(${header},dict)
    ${header1}    create dictionary    Content-Type=application/json
    ${header}    Set Variable If    ${status}    ${header}    ${header1}
    ${cookies}    create dictionary    mobile_login_token=${token}
    Run Keyword If    '${url}'=='fmall' and '${token}'==''    create session    event    ${urlfmall}    ${header}    verify=true
    ...    ELSE IF    '${url}'=='fmall' and '${token}'!=''    create session    event    ${urlfmall}    ${header}    ${cookies}    verify=true
    Run Keyword If    '${url}'=='mall' and '${token}'==''    create session    event    ${urlmall}    ${header}    verify=true
    ...    ELSE IF    '${url}'=='mall' and '${token}'!=''    create session    event    ${urlmall}    ${header}    ${cookies}    verify=true
    Run Keyword If    '${url}'=='adpcloud'    create session    event    ${adpcloud}    ${header}    verify=true
    Run Keyword If    '${url}'=='dm' and '${token}'==''    create session    event    ${dm}    ${header}    verify=true
    ...    ELSE IF    '${url}'=='dm' and '${token}'!=''    create session    event    ${dm}    ${header}    ${cookies}    verify=true
    ${resp}    Get Request    event    ${uri}
    [Return]    ${resp}

Put
    [Arguments]    ${url}    ${uri}    ${body}=    ${token}=    ${header}=
    ${status}    Run Keyword And Return Status    Evaluate    isinstance(${header},dict)
    ${header1}    create dictionary    Content-Type=application/json
    ${header}    Set Variable If    ${status}    ${header}    ${header1}
    ${cookies}    create dictionary    mobile_login_token=${token}
    Run Keyword If    '${url}'=='fmall' and '${token}'==''    create session    event    ${urlfmall}    ${header}    verify=true
    ...    ELSE IF    '${url}'=='fmall' and '${token}'!=''    create session    event    ${urlfmall}    ${header}    ${cookies}    verify=true
    Run Keyword If    '${url}'=='mall' and '${token}'==''    create session    event    ${urlmall}    ${header}    verify=true
    ...    ELSE IF    '${url}'=='mall' and '${token}'!=''    create session    event    ${urlmall}    ${header}    ${cookies}    verify=true
    Run Keyword If    '${url}'=='adpcloud'    create session    event    ${adpcloud}    ${header}    verify=true
    Run Keyword If    '${url}'=='dm' and '${token}'==''    create session    event    ${dm}    ${header}    verify=true
    ...    ELSE IF    '${url}'=='dm' and '${token}'!=''    create session    event    ${dm}    ${header}    ${cookies}    verify=true
    ${body}    Set Variable    ${body}
    ${resp}    Put Request    event    ${uri}    ${body}
    [Return]    ${resp}

Delete
    [Arguments]    ${url}    ${uri}    ${body}=    ${token}=    ${header}=
    ${status}    Run Keyword And Return Status    Evaluate    isinstance(${header},dict)
    ${header1}    create dictionary    Content-Type=application/json
    ${header}    Set Variable If    ${status}    ${header}    ${header1}
    ${cookies}    create dictionary    mobile_login_token=${token}
    Run Keyword If    '${url}'=='fmall' and '${token}'==''    create session    event    ${urlfmall}    ${header}    verify=true
    ...    ELSE IF    '${url}'=='fmall' and '${token}'!=''    create session    event    ${urlfmall}    ${header}    ${cookies}    verify=true
    Run Keyword If    '${url}'=='mall' and '${token}'==''    create session    event    ${urlmall}    ${header}    verify=true
    ...    ELSE IF    '${url}'=='mall' and '${token}'!=''    create session    event    ${urlmall}    ${header}    ${cookies}    verify=true
    Run Keyword If    '${url}'=='adpcloud'    create session    event    ${adpcloud}    ${header}    verify=true
    Run Keyword If    '${url}'=='dm' and '${token}'==''    create session    event    ${dm}    ${header}    verify=true
    ...    ELSE IF    '${url}'=='dm' and '${token}'!=''    create session    event    ${dm}    ${header}    ${cookies}    verify=true
    ${body}    Set Variable    ${body}
    ${resp}    Delete Request    event    ${uri}    ${body}
    [Return]    ${resp}

接口调用是否成功
    [Arguments]    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Be Equal As Strings    ${resp.json()['message']}    OK

md5加密
    [Arguments]    ${code}
    ${md5code}    Evaluate    hashlib.md5('${code}'.encode(encoding='utf-8')).hexdigest()    hashlib
    [Return]    ${md5code}

base64加密
    [Arguments]    ${code}
    ${base64code}    Evaluate    base64.b64encode(b'${code}')    base64
    [Return]    ${base64code}

设置变量
    [Arguments]    ${value}
    [Documentation]    空转为null非空直接输出
    ${variable}    Set Variable If    '${value}'=='${None}'    null    ${value}
    [Return]    ${variable}
