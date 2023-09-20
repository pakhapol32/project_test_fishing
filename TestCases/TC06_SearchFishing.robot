*** Settings ***
Library        AppiumLibrary
Library        ExcelLibrary
Library        Collections
Library        ScreenCapLibrary
Library        openpyxl
Resource    ../Resource/RS_AndroidConfiguration.robot
Resource    ../Resource/RS_TC06_SearchFishing.robot
*** Variables ***
${excel_path}    C:/Users/MSI/Desktop/Test_Projact/TestData/TD06_SearchFishing.xlsx
*** Test Cases ***
TC06_SearchFishing
    #-----------------------------------------------ยังแก้ไม่หมด------------------------------------------------------------
    Start Video Recording   alias=None  name=C:/Users/MSI/Desktop/Test_Projact/Result/Video/TD06_SearchFishing  fps=None    size_percentage=1   embed=True  embed_width=100px   monitor=1
    #--------------------------------------------------------------------------------------------------------------------
    Open Excel Document    ${excel_path}    doc_id=TestData
    ${excel}    Get Sheet   TestData
    Open Test Application

    Click Login page

    FOR    ${i}    IN RANGE   2    ${excel.max_row+1}
        ${tcid}     Set Variable if    '${excel.cell(${i},1).value}'=='None'    ${Empty}     ${excel.cell(${i},1).value}
            Set Suite Variable   ${testcaseData}  ${tcid}
        ${EXE}    Set Variable if    '${excel.cell(${i},2).value}'=='None'    ${Empty}     ${excel.cell(${i},2).value}
        ${AFW}    Set Variable if    '${excel.cell(${i},3).value}'=='None'    ${Empty}     ${excel.cell(${i},3).value}
        ${EXP}     Set Variable if    '${excel.cell(${i},4).value}'=='None'    ${Empty}     ${excel.cell(${i},4).value}
    
        IF    "${EXE}" == "Y"
        
        
        Sleep    3s

        Input Text    ${IN_SE}    ${AFW}


        Sleep    4s

        # CHECK ERROR
            ${is_vis}=    Run Keyword And Return Status    Element Should Be Visible    ${PO_NAME}
            Log To Console    ${is_vis}
            

            IF    ${is_vis} == True
                ${NAME_SER}    Set Variable    //*[@text="${AFW}"]
                ${ACTUAL_RESULT}    Set Variable    ระบบคืนค่าชื่อบ่อตกปลาตามที่ผู้ใช้กรอก
                ${ACTUAL_RESULT1}    Set Variable    Not Found Alert Element    
                ${ACTUAL_RESULT2}    Get Text    ${PO_NAME}
                Log To Console    ${ACTUAL_RESULT2}

                IF    "${ACTUAL_RESULT2}" == "${AFW}"
                    Write Excel Cell    ${i}    5    value=${ACTUAL_RESULT}    sheet_name=TestData
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
                ${ACTUAL_RESULT}    Set Variable    Error
                IF    "${ACTUAL_RESULT}" == "${EXP}"
                    Write Excel Cell    ${i}    5    value=${ACTUAL_RESULT}    sheet_name=TestData
                    Write Excel Cell    ${i}    6    value=PASS    sheet_name=TestData
                    Write Excel Cell    ${i}    7    value=No Error    sheet_name=TestData
                ELSE IF    '${AFW}' == ''
                    Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                    Write Excel Cell    ${i}    5    value=${ACTUAL_RESULT1}    sheet_name=TestData
                    Write Excel Cell    ${i}    6    value=FAIL    sheet_name=TestData
                    Write Excel Cell    ${i}    7    value=Error    sheet_name=TestData
                    Write Excel Cell    ${i}    8    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                ELSE
                    Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                    Write Excel Cell    ${i}    5    value=${ACTUAL_RESULT1}    sheet_name=TestData
                    Write Excel Cell    ${i}    6    value=FAIL    sheet_name=TestData
                    Write Excel Cell    ${i}    7    value=Error    sheet_name=TestData
                    Write Excel Cell    ${i}    8    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                END
            END
            
        END
        
        Sleep    2
    END
    Save Excel Document       C:/Users/MSI/Desktop/Test_Projact/Result/WriteExcel/TC06_SearchFishing_result.xlsx
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