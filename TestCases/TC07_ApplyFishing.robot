*** Settings ***
Library        AppiumLibrary
Library        ExcelLibrary
Library        Collections
Library        ScreenCapLibrary
Library        openpyxl
Resource    ../Resource/RS_AndroidConfiguration.robot
Resource    ../Resource/RS_TC07_ApplyFishing.robot
*** Variables ***
${excel_path}    C:/Users/MSI/Desktop/Test_Projact/TestData/TD07_ApplyFishing.xlsx
*** Test Cases ***
TC07_AddEventFishing
    #-----------------------------------------------ยังแก้ไม่หมด------------------------------------------------------------
    Start Video Recording   alias=None  name=C:/Users/MSI/Desktop/Test_Projact/Result/Video/TD07_ApplyFishing  fps=None    size_percentage=1   embed=True  embed_width=100px   monitor=1
    #--------------------------------------------------------------------------------------------------------------------
    Open Excel Document    ${excel_path}    doc_id=TestData
    ${excel}    Get Sheet   TestData
    Open Test Application
    Click Login page

    FOR    ${i}    IN RANGE   2    ${excel.max_row+1}
        ${tcid}     Set Variable if    '${excel.cell(${i},1).value}'=='None'    ${Empty}     ${excel.cell(${i},1).value}
            Set Suite Variable   ${testcaseData}  ${tcid}
        ${EXE}    Set Variable if    '${excel.cell(${i},2).value}'=='None'    ${Empty}     ${excel.cell(${i},2).value}
        ${CTF}    Set Variable if    '${excel.cell(${i},3).value}'=='None'    ${Empty}     ${excel.cell(${i},3).value}
        ${EXP}     Set Variable if    '${excel.cell(${i},4).value}'=='None'    ${Empty}     ${excel.cell(${i},4).value}
    
        IF    "${EXE}" == "Y"

            Sleep    2s

            Wait Until Page Contains Element    ${Home}
            Click Element    ${Home}
            
            Sleep    2s

            Wait Until Page Contains Element    ${CL_POUN}
            Click Element    ${CL_POUN}

            Sleep    1s

            Wait Until Page Contains Element    ${CL_POUN}
            Click Element    ${CL_POUN}

            Sleep    3s

            ${AL}=    Run Keyword And Return Status    Element Should Be Visible    ${KAK_BAD}
            Log To Console    ${AL}
            IF    ${AL} == True
            Wait Until Page Contains Element    ${KAK_BAD}
            Click Element    ${KAK_BAD}
            END

            Sleep    2s

            Swipe    0    800    0    100    1000

            Wait Until Page Contains Element    ${CL_SUMIT}
            Click Element    ${CL_SUMIT}

            Sleep    2s

            ${AL1}=    Run Keyword And Return Status    Element Should Be Visible    ${KAK_BAD}
            Log To Console    ${AL1}
            IF    ${AL1} == True
            Wait Until Page Contains Element    ${KAK_BAD}
            Click Element    ${KAK_BAD}
            END

            Sleep    3s

            IF    '${CTF}' == 'ฉมวก'
                Sleep    2s
                Wait Until Page Contains Element    ${CL_LADIO1}    20s
                Click Element    ${CL_LADIO1}
            ELSE IF    '${CTF}' == 'หว่านแห่'
                Sleep    2s
                Wait Until Page Contains Element    ${CL_LADIO2}    20s
                Click Element    ${CL_LADIO2}
            ELSE IF    '${CTF}' == 'สวิง'
                Sleep    2s
                Wait Until Page Contains Element    ${CL_LADIO3}    20s
                Click Element    ${CL_LADIO3}
            ELSE IF    '${CTF}' == 'ยกยอ'
                Sleep    2s
                Wait Until Page Contains Element    ${CL_LADIO4}    20s
                Click Element    ${CL_LADIO4}
            END

            Sleep    3s

            Click Element    ${CL_SUMIT2}
            

            # Check Error
            Sleep    3s
            ${is_vis}=    Run Keyword And Return Status    Element Should Be Visible    ${ALERT}    15s
            Log To Console    ${is_vis}
             IF    ${is_vis} == True
                Wait Until Page Contains Element     ${ALERT}
                ${ACTUAL_RESULT}=    Get Text     ${ALERT}
                IF    "${ACTUAL_RESULT}" == "${EXP}"
                    Write Excel Cell    ${i}    5    value=${ACTUAL_RESULT}    sheet_name=TestData
                    Write Excel Cell    ${i}    6    value=PASS    sheet_name=TestData
                    Write Excel Cell    ${i}    7    value=No Error    sheet_name=TestData
                ELSE
                    Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                    Write Excel Cell    ${i}    5    value=${ACTUAL_RESULT}    sheet_name=TestData
                    Write Excel Cell    ${i}    6    value=FAIL    sheet_name=TestData
                    Write Excel Cell    ${i}    7    value=Error    sheet_name=TestData
                    Write Excel Cell    ${i}    8    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                END
                Sleep    2s
                Click Element    ${EXRT}
                Sleep    2s
                ${AL1}=    Run Keyword And Return Status    Element Should Be Visible    ${KAK_BAD}
                Log To Console    ${AL1}
                IF    ${AL1} == True
                Wait Until Page Contains Element    ${KAK_BAD}
                Click Element    ${KAK_BAD}
                END
            ELSE
                ${COMP}    Set Variable    //*[@text='${CTF}']

                Click Element    ${PAS}

                Sleep    2s

                ${AL2}=    Run Keyword And Return Status    Element Should Be Visible    ${COMP}    15s
                Log To Console    ${AL2}

                Sleep    2s

                
                IF    ${AL2} == True

                    Wait Until Page Contains Element     ${COMP}
                    ${ACTUAL_RESULT1}=    Get Text     ${COMP}

                    IF    '${ACTUAL_RESULT1}' == '${CTF}'
                        Write Excel Cell    ${i}    5    value=${ACTUAL_RESULT1}    sheet_name=TestData
                        Write Excel Cell    ${i}    6    value=PASS    sheet_name=TestData
                        Write Excel Cell    ${i}    7    value=No Error    sheet_name=TestData
                    ELSE
                        Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                        Write Excel Cell    ${i}    5    value=${ACTUAL_RESULT1}    sheet_name=TestData
                        Write Excel Cell    ${i}    6    value=FAIL    sheet_name=TestData
                        Write Excel Cell    ${i}    7    value=Error    sheet_name=TestData
                        Write Excel Cell    ${i}    8    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                    END
                ELSE
                    ${ACTUAL_RESULT1}    Set Variable    Not Found Alert Element (NoUp)
                    
                    IF    '${ACTUAL_RESULT1}' == '${CTF}'
                        Write Excel Cell    ${i}    5    value=${ACTUAL_RESULT1}    sheet_name=TestData
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
    END
    Save Excel Document       C:/Users/MSI/Desktop/Test_Projact/Result/WriteExcel/TC07_ApplyFishing_result.xlsx
    Close Application
    Stop Video Recording      alias=None
 
*** Keywords ***
Open Test Application
  Open Application  http://localhost:4723/wd/hub  automationName=${ANDROID_AUTOMATION_NAME}
  ...  platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}
  ...  app=${ANDROID_APP}  appPackage=com.prohect_fishing   appActivity=.MainActivity

Click Login page
    Wait Until Page Contains Element    ${EXIT_MAIN_BTN_PATH}    15s
    Click Element    ${EXIT_MAIN_BTN_PATH}

    Wait Until Page Contains Element    ${INPUT_USER}
    Input Text    ${INPUT_USER}    Test1
    Wait Until Page Contains Element    ${INPUT_PASS}
    Input Text    ${INPUT_PASS}    1234
        
    Sleep    1s

    Click Element    ${Candidatetype_SPN}
    Wait Until Page Contains Element    ${fishing_participant}
    Click Element    ${fishing_participant}

    #กดปุ่มตกลง
    Click Element    ${CL_Submit}