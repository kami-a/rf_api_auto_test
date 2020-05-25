*** Settings ***
Library           RequestsLibrary
Library           Collections
Library           DateTime

*** Variables ***
${urlfmall}       https://fmall.gree.com
${urlmall}        https://mall.gree.com

*** Keywords ***
Post
    [Arguments]    ${url}    ${uri}    ${body}=    ${token}=
    ${header}    create dictionary    Content-Type=application/json
    ${cookies}    create dictionary    mobile_login_token=${token}
    Run Keyword If    '${url}'=='fmall' and '${token}'==''    create session    event    ${urlfmall}    ${header}
    ...    ELSE IF    '${url}'=='fmall' and '${token}'!=''    create session    event    ${urlfmall}    ${header}    ${cookies}
    Run Keyword If    '${url}'=='mall' and '${token}'==''    create session    event    ${urlmall}    ${header}
    ...    ELSE IF    '${url}'=='mall' and '${token}'!=''    create session    event    ${urlmall}    ${header}    ${cookies}
    ${body}    Set Variable    ${body}
    ${resp}    Post Request    event    ${uri}    ${body}
    [Return]    ${resp}

Get
    [Arguments]    ${url}    ${uri}    ${token}=
    ${header}    create dictionary    Content-Type=application/json
    ${cookies}    create dictionary    mobile_login_token=${token}
    Run Keyword If    '${url}'=='fmall' and '${token}'==''    create session    event    ${urlfmall}    ${header}
    ...    ELSE IF    '${url}'=='fmall' and '${token}'!=''    create session    event    ${urlfmall}    ${header}    ${cookies}
    Run Keyword If    '${url}'=='mall' and '${token}'==''    create session    event    ${urlmall}    ${header}
    ...    ELSE IF    '${url}'=='mall' and '${token}'!=''    create session    event    ${urlmall}    ${header}    ${cookies}
    ${resp}    Get Request    event    ${uri}
    [Return]    ${resp}

Put
    [Arguments]    ${url}    ${uri}    ${body}=    ${token}=
    ${header}    create dictionary    Content-Type=application/json
    ${cookies}    create dictionary    mobile_login_token=${token}
    Run Keyword If    '${url}'=='fmall' and '${token}'==''    create session    event    ${urlfmall}    ${header}
    ...    ELSE IF    '${url}'=='fmall' and '${token}'!=''    create session    event    ${urlfmall}    ${header}    ${cookies}
    Run Keyword If    '${url}'=='mall' and '${token}'==''    create session    event    ${urlmall}    ${header}
    ...    ELSE IF    '${url}'=='mall' and '${token}'!=''    create session    event    ${urlmall}    ${header}    ${cookies}
    ${body}    Set Variable    ${body}
    ${resp}    Put Request    event    ${uri}    ${body}
    [Return]    ${resp}

Delete
    [Arguments]    ${url}    ${uri}    ${body}=    ${token}=
    ${header}    create dictionary    Content-Type=application/json
    ${cookies}    create dictionary    mobile_login_token=${token}
    Run Keyword If    '${url}'=='fmall' and '${token}'==''    create session    event    ${urlfmall}    ${header}
    ...    ELSE IF    '${url}'=='fmall' and '${token}'!=''    create session    event    ${urlfmall}    ${header}    ${cookies}
    Run Keyword If    '${url}'=='mall' and '${token}'==''    create session    event    ${urlmall}    ${header}
    ...    ELSE IF    '${url}'=='mall' and '${token}'!=''    create session    event    ${urlmall}    ${header}    ${cookies}
    ${body}    Set Variable    ${body}
    ${resp}    Delete Request    event    ${uri}    ${body}
    [Return]    ${resp}

接口调用是否成功
    [Arguments]    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Be Equal As Strings    ${resp.json()['message']}    OK
