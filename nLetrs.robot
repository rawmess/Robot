*** Settings ***
Library           Selenium2Library

*** Variables ***
${Intro}          xpath=//*[@id="sidebar-cubes"]/div[1]    # Introduction
${PreTest}        xpath=//*[@id="sidebar-cubes"]/div    # Click PresTest
${PreTestExit}    xpath=//*[@id="sidebar-cubes"]/div/div[1]/div/div[3]/div/div/div/div[2]    # Exit PreTest Session
${TextArea}       xpath=//*[@id="sidebar-cubes"]/div[1]/div[2]/div[2]/div/textarea    # Click on Text Area
${WaitIntro}      xpath=//*[@id="sidebar-cubes"]/div[1]/div[1]/div    # wait intro layout(popup)
${ExitIntro}      xpath=//*[@id="sidebar-cubes"]/div[1]/div[1]/div/div[3]/div/div/div/div[7]/a    # Exit Session Introduction
${ClassRoom}      xpath=//*[@id="sidebar-cubes"]/div[2]    # Click Classroom Management
${ExitClassroom}    xpath=//*[@id="sidebar-cubes"]/div[2]/div[1]/div/div[3]/div/div/div/div[3]/a    # Exit session
${Curriculum}     xpath=//*[@id="sidebar-cubes"]/div[3]    # Click Curriculum
${ExitCurriculum}    xpath=//*[@id="sidebar-cubes"]/div[3]/div[1]/div/div[3]/div/div/div/div[2]/a    # Exit Session
${Assessment}     xpath=//*[@id="sidebar-cubes"]/div[4]    # Click Assessment
${ExitAssessement}    xpath=//*[@id="sidebar-cubes"]/div[4]/div[1]/div/div[3]/div/div/div/div[2]/a    # Exit Session
${Implementation}    xpath=//*[@id="sidebar-cubes"]/div[5]    # Click Implementation
${ExitImplementation}    xpath=//*[@id="sidebar-cubes"]/div[5]/div[1]/div/div[3]/div/div/div/div[3]/a    # Exit Session
${PostTest}       xpath=//*[@id="sidebar-cubes"]/div    # Click Post Test
${ExitPost}       xpath=//*[@id="sidebar-cubes"]/div/div[1]/div/div[3]/div/div/div/div[2]/a    # Exit Session
${Ham}            xpath=//*[@id="sideBarContent"]/div/div/div    # Click Hamburger Menu
${waitLogout}     xpath=//*[@id="sideBarContent"]/div/div/div/div    # Wait for Logout Css
${Logout}         id=logout    # Logout
${Writer}         xpath=//*[@id="sidebar-cubes"]/div[1]    # Click Writer Session
${ExitWriter}     xpath=//*[@id="sidebar-cubes"]/div[1]/div[1]/div/div[3]/div/div/div/div[2]/a    # Exit Session
${Differentiating}    xpath=//*[@id="sidebar-cubes"]/div[2]    # Click Differentiation Session
${ExitDiff}       xpath=//*[@id="sidebar-cubes"]/div[2]/div[1]/div/div[3]/div/div/div/div[3]/a    # Exit Diff Session
${Username}       id=username    # Username Id
${Password}       id=password    # Password
${LoginBtn}       id=loginBtn    # Click Login

*** Test Cases ***
Login
    Open Browser    https://qa.lp.voyagersopris.com/#nletrs    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    loginBtn    30s
    Input Text    ${Username}    ramesh
    Input Password    ${Password}    ramesh
    Click Button    ${LoginBtn}

LetrPre
    [Setup]
    Wait Until Element Is Visible    ${PreTest}    30s
    Click Element    ${PreTest}
    Wait Until Element Is Visible    ${PreTestExit}    30s
    Click Element    ${PreTestExit}
    Sleep    5s
    [Teardown]

Intro
    Wait Until Element Is Visible    ${Intro}    30s
    Click Element    ${Intro}

Journal
    Wait Until Element Is Visible    ${TextArea}    30s
    Click Element    ${TextArea}
    Input Text    ${TextArea}    THIS IS NEW POST
    Press Key    ${TextArea}    \\13

IntroExitSession
    Wait Until Element Is Visible    ${ExitIntro}    30s
    Click Element    ${ExitIntro}
    Sleep    3s

ClassManage
    Wait Until Element Is Visible    ${ClassRoom}    30s
    Click Element    ${ClassRoom}
    Wait Until Element Is Visible    ${ExitClassroom}    30s
    Click Element    ${ExitClassroom}
    Sleep    3s

Curriculum
    Wait Until Element Is Visible    ${Curriculum}    30s
    Click Element    ${Curriculum}
    Wait Until Element Is Visible    ${ExitCurriculum}    30s
    Click Element    ${ExitCurriculum}
    Sleep    3s

Assessment
    Wait Until Element Is Visible    ${Assessment}    30s
    Click Element    ${Assessment}
    Wait Until Element Is Visible    ${ExitAssessement}    30s
    Click Element    ${ExitAssessement}
    Sleep    3s

Implementation
    Wait Until Element Is Visible    ${Implementation}    30s
    Click Element    ${Implementation}
    Wait Until Element Is Visible    ${ExitImplementation}    30s
    Click Element    ${ExitImplementation}
    Sleep    5s

PostTest
    Wait Until Element Is Visible    ${PostTest}    30s
    Click Element    ${PostTest}
    Wait Until Element Is Visible    ${ExitPost}    30s
    Click Element    ${ExitPost}
    Sleep    5s

Writer
    Wait Until Element Is Visible    ${Writer}    30s
    Click Element    ${Writer}
    Wait Until Element Is Visible    ${ExitWriter}    30s
    Click Element    ${ExitWriter}
    Sleep    3s

Differentiating
    Wait Until Element Is Visible    ${Differentiating}    30s
    Click Element    ${Differentiating}
    Wait Until Element Is Visible    ${ExitDiff}    30s
    Click Element    ${ExitDiff}
    Sleep    3s

Logout
    Wait Until Element Is Visible    ${Ham}    30s
    Click Element    ${Ham}
    Wait Until Element Is Visible    ${waitLogout}    30s
    Click Link    logout

ScrollBar
    ${width}    ${height}=    Get Window Size
    Log    ${width},${height}
    Sleep    10s
    Wait Until Element Is Visible    xpath=//*[@id="sidebar-cubes"]/div[1]/div[1]/div    30s
    Scroll Page To Location    \    5000

*** Keywords ***
Scroll To Page Location
    [Arguments]    ${x_location}    ${y_location}
    Execute Javascript    window.scrollTo(${x_location}, ${y_location})

I login to the sidebar app
    [Arguments]    ${uname}='nitesh'    ${password}='nitesh'
    Open Browser    https://qa.lp.voyagersopris.com/#nletrs    ff
    Maximize Browser Window
    Wait Until Element Is Visible    loginBtn    30s
    Input Text    username    ${uname}
    Input Password    password    ${password}
    Click Button    loginBtn
