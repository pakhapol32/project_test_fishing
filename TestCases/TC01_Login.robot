*** Settings ***
Library  AppiumLibrary
Library  ExcelLibrary
Library    Collections
Library    ScreenCapLibrary
Library        openpyxl
Resource    ../Resource/RS_AndroidConfiguration.robot
Resource    ../Resource/RS_TC01_Login.robot
*** Variables ***
${excel_path}    C:/Users/MSI/Desktop/Test_Projact/TestData/TC01_Login.xlsx
*** Test Cases ***
TC01_LOGIN

    Start Video Recording   alias=None  name=C:/Users/MSI/Desktop/Test_Projact/Result/Video/TC01_Login     fps=None    size_percentage=1   embed=True  embed_width=100px   monitor=1

    Open Excel Document    ${excel_path}    doc_id=TestData
    ${excel}    Get Sheet   TestData

    FOR    ${i}    IN RANGE   2    ${excel.max_row+1}

        ${tcid}     Set Variable if    '${excel.cell(${i},1).value}'=='None'    ${Empty}     ${excel.cell(${i},1).value}
        Set Suite Variable   ${testcaseData}  ${tcid}
        ${EXE}    Set Variable if    '${excel.cell(${i},2).value}'=='None'    ${Empty}     ${excel.cell(${i},2).value}
        ${TF}    Set Variable if    '${excel.cell(${i},3).value}'=='None'    ${Empty}     ${excel.cell(${i},3).value}
        ${userr}     Set Variable if    '${excel.cell(${i},4).value}'=='None'    ${Empty}     ${excel.cell(${i},4).value}
        ${pass}     Set Variable if    '${excel.cell(${i},5).value}'=='None'    ${Empty}     ${excel.cell(${i},5).value}
        ${tou}    Set Variable if    '${excel.cell(${i},6).value}'=='None'    ${Empty}     ${excel.cell(${i},6).value}
        ${EXP}    Set Variable if    '${excel.cell(${i},7).value}'=='None'    ${Empty}     ${excel.cell(${i},7).value}
        
        IF    "${EXE}" == "Y"

            #Open App (เปิดแอพ)
            Open Test Application

            Wait Until Page Contains Element    ${EXIT_MAIN_BTN_PATH}    15s
            Click Element    ${EXIT_MAIN_BTN_PATH}

            Sleep    2s

            #กรอก 1
            Enter Login page    ${userr}    ${pass}

            Sleep    2s

            #เลือกประเภทการสมัคร
            Click Element    ${Candidatetype_SPN}
            IF    "${tou}" == "ผู้เข้าร่วมตกปลา"
                Wait Until Page Contains Element    ${fishing_participant}
                Click Element    ${fishing_participant}
            ELSE IF    "${tou}" == "เจ้าของบ่อตกปลา"
                Wait Until Page Contains Element    ${fishpond_owner}
                Click Element    ${fishpond_owner}
            END
            Sleep    2s
            #กดปุ่มตกลง
            Click Element    ${CL_Submit}
        
            Sleep    3s

            # Check Error    
                IF    "${TF}" == "T"
                    Sleep    3s
                    # check หา Xpath ถ้าหาไม่เจอ False เจอ True
                    ${is_vis}=    Run Keyword And Return Status    Element Should Be Visible    ${COMP}
                    Log To Console    ${is_vis}
                    IF    ${is_vis} == True
                        ${Alet}    Set Variable    -
                        ${AleTF}    Set Variable    -
                        ${ErrorLop}    Set Variable    -
                        IF    "${Alet}" == "${EXP}"
                            Write Excel Cell    ${i}    8    value=${Alet}    sheet_name=TestData
                            Write Excel Cell    ${i}    9    value=PASS    sheet_name=TestData
                            Write Excel Cell    ${i}    10    value=No Error    sheet_name=TestData
                        ELSE
                            Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                            Write Excel Cell    ${i}    8    value=${ErrorLop}    sheet_name=TestData
                            Write Excel Cell    ${i}    9    value=FAIL    sheet_name=TestData
                            Write Excel Cell    ${i}    10    value=Error : Not Found Alert Element    sheet_name=TestData
                            Write Excel Cell    ${i}    11    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                        END
                    ELSE
                        ${is_vis1}=    Run Keyword And Return Status    Element Should Be Visible    ${INPUT_USER}
                        Log To Console    ${is_vis1}
                        IF  ${is_vis1} == True
                            # Wait Until Page Contains Element    ${INPUT_USER}
                            # ${ACTUAL_RESULT1}=    Get Text    ${INPUT_USER}
                            ${INPUT_USER1}     Set Variable    -
                            # ${ACTUAL_RESULT1}=    Get Text    ${INPUT_USER1}
                            IF    "${INPUT_USER1}" == "${EXP}"
                                Write Excel Cell    ${i}    8    value=${INPUT_USER1}    sheet_name=TestData
                                Write Excel Cell    ${i}    9    value=PASS    sheet_name=TestData
                                Write Excel Cell    ${i}    10    value=No Error    sheet_name=TestData
                            ELSE
                                Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                                Write Excel Cell    ${i}    8    value=${INPUT_USER1}    sheet_name=TestData
                                Write Excel Cell    ${i}    9    value=FAIL    sheet_name=TestData
                                Write Excel Cell    ${i}    10    value=Error : Not Found Alert Element    sheet_name=TestData
                                Write Excel Cell    ${i}    11    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                            END
                        ELSE
                            # Wait Until Page Contains Element    ${INPUT_PASS}
                            # ${ACTUAL_RESULT2}=    Get Text    ${INPUT_PASS}
                            ${INPUT_PASS1}     Set Variable    -
                            # ${ACTUAL_RESULT2}=    Get Text    ${INPUT_PASS1}
                            IF    "${INPUT_PASS1}" == "${EXP}"
                                Write Excel Cell    ${i}    8    value=${INPUT_PASS1}    sheet_name=TestData
                                Write Excel Cell    ${i}    9    value=PASS    sheet_name=TestData
                                Write Excel Cell    ${i}    10    value=No Error    sheet_name=TestData
                            ELSE
                                Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                                Write Excel Cell    ${i}    8    value=${INPUT_PASS1}    sheet_name=TestData
                                Write Excel Cell    ${i}    9    value=FAIL    sheet_name=TestData
                                Write Excel Cell    ${i}    10    value=Error : Not Found Alert Element   sheet_name=TestData
                                Write Excel Cell    ${i}    11    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                            END
                        END
                    END
                ELSE
                    Sleep    3s
                    ${is_vis2}=    Run Keyword And Return Status    Element Should Be Visible    ${COMP}    20s
                    Log To Console    ${is_vis2}
                    IF    ${is_vis2} == True
                        ${Alet1}    Set Variable    -
                        ${AleTF1}    Set Variable    -
                        ${ErrorLop}    Set Variable    -
                        IF    "${Alet1}" == "${EXP}"
                            Write Excel Cell    ${i}    8    value=${Alet1}    sheet_name=TestData
                            Write Excel Cell    ${i}    9    value=PASS    sheet_name=TestData
                            Write Excel Cell    ${i}    10    value=No Error    sheet_name=TestData
                        ELSE
                            Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                            Write Excel Cell    ${i}    8    value=${ErrorLop}    sheet_name=TestData
                            Write Excel Cell    ${i}    9    value=FAIL    sheet_name=TestData
                            Write Excel Cell    ${i}    10    value=Error : Not Found Alert Element    sheet_name=TestData
                            Write Excel Cell    ${i}    11    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                        END
                    ELSE
                        ${is_vis3}=    Run Keyword And Return Status    Element Should Be Visible    ${INPUT_USER}    20s
                        Log To Console    ${is_vis3}
                        IF  ${is_vis3} == True
                            # Wait Until Page Contains Element    ${INPUT_USER}
                            # ${ACTUAL_RESULT1}=    Get Text    ${INPUT_USER}
                            ${INPUT_USER2}     Set Variable    -
                            # ${ACTUAL_RESULT1}=    Get Text    ${INPUT_USER1}
                            IF    "${INPUT_USER2}" == "${EXP}"
                                Write Excel Cell    ${i}    8    value=${INPUT_USER2}    sheet_name=TestData
                                Write Excel Cell    ${i}    9    value=PASS    sheet_name=TestData
                                Write Excel Cell    ${i}    10   value=No Error    sheet_name=TestData
                            ELSE
                                Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                                Write Excel Cell    ${i}    8    value=${INPUT_USER2}    sheet_name=TestData
                                Write Excel Cell    ${i}    9    value=FAIL    sheet_name=TestData
                                Write Excel Cell    ${i}    10    value=Error : Not Found Alert Element    sheet_name=TestData
                                Write Excel Cell    ${i}    11    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                            END
                        ELSE
                            # Wait Until Page Contains Element    ${INPUT_PASS}
                            # ${ACTUAL_RESULT2}=    Get Text    ${INPUT_PASS}
                            ${INPUT_PASS2}     Set Variable    -
                            # ${ACTUAL_RESULT2}=    Get Text    ${INPUT_PASS1}
                            IF    "${INPUT_PASS2}" == "${EXP}"
                                Write Excel Cell    ${i}    8    value=${INPUT_PASS2}    sheet_name=TestData
                                Write Excel Cell    ${i}    9    value=PASS    sheet_name=TestData
                                Write Excel Cell    ${i}    10    value=No Error    sheet_name=TestData
                            ELSE
                                Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                                Write Excel Cell    ${i}    8    value=${INPUT_PASS2}    sheet_name=TestData
                                Write Excel Cell    ${i}    9    value=FAIL    sheet_name=TestData
                                Write Excel Cell    ${i}    10    value=Error : Not Found Alert Element  sheet_name=TestData
                                Write Excel Cell    ${i}    11    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                            END
                        END
                    END
                END
            Sleep    2s
            Close Application
            Sleep    3s
        END
    END
    


    Save Excel Document       C:/Users/MSI/Desktop/Test_Projact/Result/WriteExcel/TC01_Login_result.xlsx

    Stop Video Recording      alias=None


    

*** Keywords ***
Open Test Application
  Open Application  http://localhost:4723/wd/hub  automationName=${ANDROID_AUTOMATION_NAME}
  ...  platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}
  ...  app=${ANDROID_APP}  appPackage=com.prohect_fishing   appActivity=.MainActivity

Enter Login page
    [Arguments]    ${userr}    ${pass}
    Input Text    ${INPUT_USER}    ${userr}
    Input Text    ${INPUT_PASS}    ${pass}