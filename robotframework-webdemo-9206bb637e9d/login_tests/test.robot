*** Settings ***
Documentation     A test suite containing tests related to invalid login.
...         #注释
Library         Builtin
Library           Selenium2Library

#变量声明
***Variables***
${url}  http://118.31.19.120:3000

#用户自定义关键字
***Keywords***                      
用户登录
    open browser    url=${url}   browser=chrome
    Maximize Browser Window
    click Element   link:登录
    Input Text      id:name     testuser1
    Input Text      id:pass     123456                   
    click Element   class:span-primary
    #打印
    Log to Console  ------helloworld-----
    S{time}=    Get time
    Log to Console     ${time}
***Test Cases***
发帖操作
    用户登录
删帖操作
    用户登录
