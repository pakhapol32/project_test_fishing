*** Settings ***
Library  AppiumLibrary
Library  ExcelLibrary
Library    Collections
Library    ScreenCapLibrary
Library        openpyxl
Resource    ../Resource/RS_AndroidConfiguration.robot
Resource    ../Resource/RS_TC11_Summary_Event_Fishing.robot
*** Variables ***
${excel_path}    C:/Users/MSI/Desktop/Test_Projact/TestData/TC11_Summary_Event_Fishing.xlsx

*** Test Cases ***
TC11_Summary_Event_Fishing
    Start Video Recording   alias=None  name=C:/Users/MSI/Desktop/Test_Projact/Result/Video/TC11_Summary_Event_Fishing  fps=None    size_percentage=1   embed=True  embed_width=100px   monitor=1
    Open Excel Document    ${excel_path}    doc_id=TestData
    ${excel}    Get Sheet   TestData
    Open Test Application
    #ล็อคอิน
    Click Login Pow page

    Sleep    2s

    Wait Until Page Contains Element    ${DaTA_POMENU}    20s
    Click Element    ${DaTA_POMENU}
    Wait Until Page Contains Element    ${HIS_EVE}    20s
    Click Element    ${HIS_EVE}

    FOR    ${i}    IN RANGE   2    ${excel.max_row+1}
        ${tcid}     Set Variable if    '${excel.cell(${i},1).value}'=='None'    ${Empty}     ${excel.cell(${i},1).value}
        Set Suite Variable   ${testcaseData}  ${tcid}
        ${EXE}    Set Variable if    '${excel.cell(${i},2).value}'=='None'    ${Empty}     ${excel.cell(${i},2).value}
        ${WEF}    Set Variable If    '${excel.cell(${i},3).value}'=='None'    ${Empty}     ${excel.cell(${i},3).value}
        ${EXP}    Set Variable if    '${excel.cell(${i},4).value}'=='None'    ${Empty}     ${excel.cell(${i},4).value}

        IF    "${EXE}" == "Y"

        Sleep    2s
        
        Wait Until Element Is Visible    ${POUN}    20s
        Click Element    ${POUN}
        Wait Until Element Is Visible    ${Summary}    20s
        Input Text    ${Summary}    ${WEF}
        Wait Until Element Is Visible    ${Submit1}    20s
        Click Element    ${Submit1}

        Sleep    2s

        ${is_vis3}=    Run Keyword And Return Status    Element Should Be Visible    ${alet_mes_path}    20s
        Log To Console    ${is_vis3}
            IF  ${is_vis3} == True
                Wait Until Page Contains Element    ${alet_mes_path}    20s
                ${ACTUAL_RESULT}=    Get Text    ${alet_mes_path}
                IF    "${ACTUAL_RESULT}" == "${EXP}"
                    Write Excel Cell    ${i}    5    value=${ACTUAL_RESULT}      sheet_name=TestData
                    Write Excel Cell    ${i}    6    value=PASS    sheet_name=TestData
                    Write Excel Cell    ${i}    7    value=No Error    sheet_name=TestData
                ELSE
                    Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png 
                    Write Excel Cell    ${i}    5    value=${ACTUAL_RESULT}    sheet_name=TestData
                    Write Excel Cell    ${i}    6    value=FAIL    sheet_name=TestData
                    Write Excel Cell    ${i}    7    value=Error    sheet_name=TestData
                    Write Excel Cell    ${i}    8    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData  
                END
                Wait Until Page Contains Element    ${alet_ok}    20s
                Click Element    ${alet_ok}
                Sleep    2s
                Wait Until Page Contains Element    ${KAKA}    20s
                Click Element    ${KAKA}
            ELSE
                ${COM1}    Set Variable    เพิ่มน้ำหนักปลาของงานตกปลาสำเร็จ
                ${ACTUAL_RESULT1}    Set Variable    Not Found Alert Element
                IF    '${COM1}' == '${EXP}'
                    Write Excel Cell    ${i}    5    value=${COM1}    sheet_name=TestData
                    Write Excel Cell    ${i}    6    value=PASS    sheet_name=TestData
                    Write Excel Cell    ${i}    7    value=No Error    sheet_name=TestData
                ELSE
                    Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                    Write Excel Cell    ${i}    5    value=${ACTUAL_RESULT1}    sheet_name=TestData
                    Write Excel Cell    ${i}    6    value=FAIL    sheet_name=TestData
                    Write Excel Cell    ${i}    7    value=Error    sheet_name=TestData
                    Write Excel Cell    ${i}    8    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                END
                
            END
        END
    END
    
    
    Save Excel Document       C:/Users/MSI/Desktop/Test_Projact/Result/WriteExcel/TC11_Summary_Event_Fishing_result.xlsx
    Close Application
    Stop Video Recording      alias=None
*** Keywords ***
Open Test Application
  Open Application  http://localhost:4723/wd/hub  automationName=${ANDROID_AUTOMATION_NAME}
  ...  platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}
  ...  app=${ANDROID_APP}  appPackage=com.prohect_fishing   appActivity=.MainActivity


Click Login Pow page
        Wait Until Page Contains Element    ${EXIT_MAIN_BTN_PATH}    15s
        Click Element    ${EXIT_MAIN_BTN_PATH}

        Wait Until Page Contains Element    ${INPUT_USER}    20s
        Input Text    ${INPUT_USER}    Tesf1
        Wait Until Page Contains Element    ${INPUT_PASS}    20s
        Input Text    ${INPUT_PASS}    1234
            
        Click Element    ${Candidatetype_SPN}
        Wait Until Page Contains Element    ${fishpond_owner}    20s
        Click Element    ${fishpond_owner}

        #กดปุ่มตกลง
        Click Element    ${CL_Submit}