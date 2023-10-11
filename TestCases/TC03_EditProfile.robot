*** Settings ***
Library  AppiumLibrary
Library  ExcelLibrary
Library    Collections
Library    ScreenCapLibrary
Library        openpyxl
Resource    ../Resource/RS_AndroidConfiguration.robot
Resource    ../Resource/RS_TC03_EditProfile.robot
Library        ../Scripts/SplitMonthAndDate.py
*** Variables ***
${excel_path}    C:/Users/MSI/Desktop/Test_Projact/TestData/TC03_EditProfile.xlsx
*** Test Cases ***
TC03_EditProfile

    Start Video Recording   alias=None  name=C:/Users/MSI/Desktop/Test_Projact/Result/Video/TC03_EditProfile    fps=None    size_percentage=1   embed=True  embed_width=100px   monitor=1
    
    Open Test Application
    Sleep    2s
    Click Login page

        Open Excel Document    ${excel_path}    doc_id=TestData
        ${excel}    Get Sheet   TestData

        FOR    ${i}    IN RANGE   2    ${excel.max_row+1}

            ${tcid}     Set Variable if    '${excel.cell(${i},1).value}'=='None'    ${Empty}     ${excel.cell(${i},1).value}
            Set Suite Variable   ${testcaseData}  ${tcid}
            ${EXE}    Set Variable if    '${excel.cell(${i},2).value}'=='None'    ${Empty}     ${excel.cell(${i},2).value}
            ${TE}    Set Variable if    '${excel.cell(${i},3).value}'=='None'    ${Empty}     ${excel.cell(${i},3).value}
            ${TETX}    Set Variable if    '${excel.cell(${i},4).value}'=='None'    ${Empty}     ${excel.cell(${i},4).value}
            ${icn}    Set Variable if    '${excel.cell(${i},5).value}'=='None'    ${Empty}     ${excel.cell(${i},5).value}
            ${name}    Set Variable if    '${excel.cell(${i},6).value}'=='None'    ${Empty}     ${excel.cell(${i},6).value}
            ${sur}    Set Variable if    '${excel.cell(${i},7).value}'=='None'    ${Empty}     ${excel.cell(${i},7).value}
            ${pn}    Set Variable if    '${excel.cell(${i},8).value}'=='None'    ${Empty}     ${excel.cell(${i},8).value}
            ${day}    Set Variable if    '${excel.cell(${i},9).value}'=='None'    ${Empty}     ${excel.cell(${i},9).value}
            ${email}    Set Variable if    '${excel.cell(${i},10).value}'=='None'    ${Empty}     ${excel.cell(${i},10).value}
            ${adrs}    Set Variable if    '${excel.cell(${i},11).value}'=='None'    ${Empty}     ${excel.cell(${i},11).value}
            ${EXP}    Set Variable if    '${excel.cell(${i},12).value}'=='None'    ${Empty}     ${excel.cell(${i},12).value}

            
            IF    "${EXE}" == "Y"

                #Open App (เปิดแอพ)
                # Open Test Application

                # Click Login page

                # Sleep    3s

                Wait Until Element Is Visible    ${CL_PEIN}    15s
                Click Element    ${CL_PEIN}

                # Sleep    2s
                
                Swipe    0    800    0    100    1000
                Wait Until Element Is Visible    ${BT_PEIN}    15s
                Click Element    ${BT_PEIN}

                Sleep    3s

                ${EE_XX}=    Run Keyword And Return Status    Element Should Be Visible    ${EX_XT}    20s
                Log To Console    ${EE_XX}
                IF    ${EE_XX} == True
                    Wait Until Page Contains Element    ${EX_XT}
                    Click Element    ${EX_XT}
                END

                #กรอก 1
                
                # Sleep    3s

                Enter Register Page    ${icn}    ${name}    ${sur}    ${pn}    # ${day}

                # Sleep    2s

                Wait Until Element Is Visible    ${CLE_TE}    15s
                Clear Text    ${CLE_TE}


                    IF  '${day}' != ''

                        Wait Until Element Is Visible    ${CLICK_DATE}    15s
                        Click Element    ${CLICK_DATE}
                        
                        Sleep    2s
                        #วันเกิด
                        #เช็คปีเดือนปัจจุบัน
                        ${CURR_YEAR}    Get Text    ${HEADER_YEAR}
                        ${CURR_DATE}    Get Text    ${HEADER_DATE}

                        Wait Until Element Is Visible    ${HEADER_YEAR}    12s
                        Click Element    ${HEADER_YEAR}
                        Sleep    5s
                        #ดึงค่าจาก ไพทอน และ จาก excel
                        ${DATE_TARGET_ARRAY}=    Split Str By Slash    ${day}
                        # วันที่เราต้องการ
                        ${TARGET_DAY}=    Set Variable    ${DATE_TARGET_ARRAY}[0]
                        # เดือนที่เราต้องการ
                        ${TARGET_MONTH}=    Set Variable    ${DATE_TARGET_ARRAY}[1]
                        # ปีที่เราต้องการ
                        ${TARGET_YEAR}=    Set Variable    ${DATE_TARGET_ARRAY}[2]
                        #loop ปี
                        FOR    ${j}  IN RANGE    999999
                            ${elements}    Get Webelements    ${YEAR_LIST}
                            ${flag}    Set Variable    20
                            ${str}    Set Variable    20

                            FOR    ${elem}    IN    @{elements}
                                ${str}=    Get Text    ${elem}
                                IF    ${str} == ${TARGET_YEAR}
                                    Click Element    ${elem}
                                    ${flag}    Set Variable    ${str}
                                    Exit For Loop
                                END
                                Log To Console    ${str}
                            END
                            
                            Exit For Loop If    ${str} == ${flag}
                            #เลื่อนหาปีที่ต้องการ
                            ${FIRST_ELEM}=    Set Variable    ${elements}[0]
                            ${TEXT_OF_FIRST}=    Get Text    ${FIRST_ELEM} 
                            IF    ${TEXT_OF_FIRST} < ${TARGET_YEAR}
                                Swipe By Percent    50    65    50    35    1000
                            ELSE IF    ${TEXT_OF_FIRST} > ${TARGET_YEAR}
                                Swipe By Percent    50    35    50    65    1000
                            END
                        END
                        # Print ค่า ออกมา
                        Log To Console    "CUR YEAR IS ${CURR_YEAR}"
                        Log To Console    "CUR DATE IS ${CURR_DATE}"

                        Sleep    1s
                        # loop เอาค่า หรือ Xpath ของ MONTH_AND_YEAR ไปใส่ res_content_desc
                            FOR  ${j}  IN RANGE    100
                                ${content_desc}=    Get Element Attribute    ${MONTH_AND_YEAR}    content-desc
                                ${res_content_desc}=    Split Month And Date    ${content_desc}
                                ${date}=    Set Variable    ${res_content_desc}[0]
                                ${month}=    Set Variable    ${res_content_desc}[1]
                                ${num_month}=    Convert Month To Number    ${month}
                                ${INT_TARGET_MONTH}=    Str To Int    ${TARGET_MONTH}
                                IF    ${num_month} > ${TARGET_MONTH}
                                    Click Element    ${PREV_BTN}
                                ELSE IF    ${num_month} < ${TARGET_MONTH}
                                    Click Element    ${NEXT_BTN}
                                ELSE
                                    ${days}    Get Webelements    ${DAY_LIST}
                                    FOR    ${day}    IN    @{days}
                                        ${day_content_desc}=    Get Element Attribute    ${day}    content-desc
                                        ${day_content_desc_arr}=    Split Str By Space    ${day_content_desc}
                                        ${real_day}=    Set Variable    ${day_content_desc_arr}[0]
                                        ${num_day}=     Str To Int    ${real_day}
                                        ${TARGET_DAY_INT}=    Str To Int    ${TARGET_DAY}
                                        IF    ${num_day} == ${TARGET_DAY}
                                            Sleep    3s
                                            Click Element    ${day}
                                            Exit For Loop
                                        END
                                    END
                                    Exit For Loop
                                END
                            END

                            Wait Until Element Is Visible    ${OK_YEAR_BTN}
                            Click Element    ${OK_YEAR_BTN}

                            Log To Console    ${date}
                            Log To Console    "CONTENT DESC IS ${content_desc}"

                    END

                    Sleep    2s
                    Swipe    0    800    0    100    1000
                    Wait Until Element Is Visible   ${INPUT_EMAIL}    10s
                    Clear Text    ${INPUT_EMAIL}
                    # Sleep    1s
                    Wait Until Element Is Visible    ${INPUT_EMAIL}    10s
                    Input Text    ${INPUT_EMAIL}    ${email}
                    # Sleep    1s
                    Wait Until Element Is Visible    ${INPUT_ADR}    10s
                    Clear Text    ${INPUT_ADR}
                    # Sleep    1s
                    Wait Until Element Is Visible    ${INPUT_ADR}    10s
                    Input Text    ${INPUT_ADR}    ${adrs}
                    
                    # Sleep    2s


                    Wait Until Element Is Visible    ${CL_EDIT}    15s
                    Click Element    ${CL_EDIT}
               
                    
                    # Click Element    ${CL_EDIT}

                    
                    Sleep    2s

                    # CHECK ERROR
                        IF    "${TE}" == "T"
                            ${is_vis}=    Run Keyword And Return Status    Element Should Be Visible    ${alet_mes_path}    20s
                            Log To Console    ${is_vis}
                            IF    ${is_vis} == True
                                Wait Until Element Is Visible    ${alet_mes_path}    20s
                                ${ACTUAL_RESULT1}=    Get Text    ${alet_mes_path}
                                IF    "${ACTUAL_RESULT1}" == "${EXP}"
                                    Write Excel Cell    ${i}    13    value=${ACTUAL_RESULT1}    sheet_name=TestData
                                    Write Excel Cell    ${i}    14    value=PASS    sheet_name=TestData
                                    Write Excel Cell    ${i}    15    value=No Error    sheet_name=TestData
                                ELSE
                                    Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                                    Write Excel Cell    ${i}    13    value=${ACTUAL_RESULT1}    sheet_name=TestData
                                    Write Excel Cell    ${i}    14    value=FAIL    sheet_name=TestData
                                    Write Excel Cell    ${i}    15    value=Error    sheet_name=TestData
                                    Write Excel Cell    ${i}    16    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                                END
                                    Click Element    ${alet_ok}
                                    Sleep    2s
                                    ${EE_XX}=    Run Keyword And Return Status    Element Should Be Visible    ${EX_XT1}    20s
                                    Log To Console    ${EE_XX}
                                    IF    ${EE_XX} == True
                                    Wait Until Page Contains Element    ${EX_XT1}
                                    Click Element    ${EX_XT1}
                                    END
                                        Sleep    2s
                                        Click Element    ${EX_ED}
                            ELSE
                                Wait Until Element Is Visible    ${BTCOM}    20s
                                Click Element   ${BTCOM}
                                Sleep    3s
                                ${COMPLE}    Set Variable    //android.view.ViewGroup[2]/android.widget.TextView[3]
                                ${Get_TexTT}    Get Text    ${COMPLE}
                                # ทำการ set และลบ ช่องว่าง
                                ${Get_TooTT}    Set Variable    ${Get_TexTT.strip()}
                                Log To Console    ${Get_TooTT}
                                ${RESULT}    Set Variable    -
                                ${RESULT_1}    Set Variable    -
                                IF    "${Get_TooTT}" == "${icn}"
                                    Write Excel Cell    ${i}    13    value=${RESULT_1}    sheet_name=TestData
                                    Write Excel Cell    ${i}    14    value=PASS    sheet_name=TestData
                                    Write Excel Cell    ${i}    15    value=No Error    sheet_name=TestData
                                ELSE
                                    Write Excel Cell    ${i}    13    value=${RESULT}    sheet_name=TestData
                                    Write Excel Cell    ${i}    14    value=FAIL    sheet_name=TestData
                                    Write Excel Cell    ${i}    15    value=Error : Data have not update   sheet_name=TestData
                                    Write Excel Cell    ${i}    16    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                                    Sleep    2s
                                    Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                                END
                                    Sleep    2s
                                    ${EE_XX}=    Run Keyword And Return Status    Element Should Be Visible    ${EX_XT1}    20s
                                    Log To Console    ${EE_XX}
                                    IF    ${EE_XX} == True
                                    Wait Until Page Contains Element    ${EX_XT1}
                                    Click Element    ${EX_XT1}
                                    END
                                # Test ไม่แน่ใจ ว่าจะ Check แบบนี้ดีไหม?

                                # IF    "${TETX}" == "A"
                                #     Sleep    2s
                                #     Wait Until Page Contains Element    ${BTCOM}
                                #     Click Element    ${BTCOM}

                                #     Wait Until Page Contains Element    ${ID_CHE}
                                #     ${ACTUAL_RESULT}=    Get Text    ${ID_CHE}
                                #     IF    "${ACTUAL_RESULT}" == "${icn}"
                                #         Write Excel Cell    ${i}    13    value=PASS    sheet_name=TestData
                                #     ELSE
                                #         Write Excel Cell    ${i}    13    value=FAIL    sheet_name=TestData
                                #         Write Excel Cell    ${i}    14    value=${ACTUAL_RESULT}    sheet_name=TestData
                                #         Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png 
                                #     END
                                # ELSE IF    "${TETX}" == "B"
                                #     Sleep    2s
                                #     Wait Until Page Contains Element    ${BTCOM}
                                #     Click Element    ${BTCOM}

                                #     Wait Until Page Contains Element    ${NAEM_CHE}
                                #     ${ACTUAL_RESULT}=    Get Text    ${NAEM_CHE}
                                #     IF    "${ACTUAL_RESULT}" == "${icn}"
                                #         Write Excel Cell    ${i}    13    value=PASS    sheet_name=TestData
                                #     ELSE
                                #         Write Excel Cell    ${i}    13    value=FAIL    sheet_name=TestData
                                #         Write Excel Cell    ${i}    14    value=${ACTUAL_RESULT}    sheet_name=TestData
                                #         Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png 
                                #     END
                                # ELSE IF    "${TETX}" == "D"
                                #     Sleep    2s
                                #     Wait Until Page Contains Element    ${BTCOM}
                                #     Click Element    ${BTCOM}

                                #     Wait Until Page Contains Element    ${BD_CHE}
                                #     ${ACTUAL_RESULT}=    Get Text    ${BD_CHE}
                                #     IF    "${ACTUAL_RESULT}" == "${icn}"
                                #         Write Excel Cell    ${i}    13    value=PASS    sheet_name=TestData
                                #     ELSE
                                #         Write Excel Cell    ${i}    13    value=FAIL    sheet_name=TestData
                                #         Write Excel Cell    ${i}    14    value=${ACTUAL_RESULT}    sheet_name=TestData
                                #         Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png 
                                #     END
                                # ELSE IF    "${TETX}" == "E"
                                #     Sleep    2s
                                #     Wait Until Page Contains Element    ${BTCOM}
                                #     Click Element    ${BTCOM}

                                #     Wait Until Page Contains Element    ${TEL_CHE}
                                #     ${ACTUAL_RESULT}=    Get Text    ${TEL_CHE}
                                #     IF    "${ACTUAL_RESULT}" == "${icn}"
                                #         Write Excel Cell    ${i}    13    value=PASS    sheet_name=TestData
                                #     ELSE
                                #         Write Excel Cell    ${i}    13    value=FAIL    sheet_name=TestData
                                #         Write Excel Cell    ${i}    14    value=${ACTUAL_RESULT}    sheet_name=TestData
                                #         Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png 
                                #     END
                                # ELSE IF    "${TETX}" == "F"
                                #     Sleep    2s
                                #     Wait Until Page Contains Element    ${BTCOM}
                                #     Click Element    ${BTCOM}

                                #     Wait Until Page Contains Element    ${EMA_CHE}
                                #     ${ACTUAL_RESULT}=    Get Text    ${EMA_CHE}
                                #     IF    "${ACTUAL_RESULT}" == "${icn}"
                                #         Write Excel Cell    ${i}    13    value=PASS    sheet_name=TestData
                                #     ELSE
                                #         Write Excel Cell    ${i}    13    value=FAIL    sheet_name=TestData
                                #         Write Excel Cell    ${i}    14    value=${ACTUAL_RESULT}    sheet_name=TestData
                                #         Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png 
                                #     END
                                # ELSE IF    "${TETX}" == "M"
                                #     Sleep    2s
                                #     Wait Until Page Contains Element    ${BTCOM}
                                #     Click Element    ${BTCOM}

                                #     Wait Until Page Contains Element    ${ADD_CHE}
                                #     ${ACTUAL_RESULT}=    Get Text    ${ADD_CHE}
                                #     IF    "${ACTUAL_RESULT}" == "${icn}"
                                #         Write Excel Cell    ${i}    13    value=PASS    sheet_name=TestData
                                #     ELSE
                                #         Write Excel Cell    ${i}    13    value=FAIL    sheet_name=TestData
                                #         Write Excel Cell    ${i}    14    value=${ACTUAL_RESULT}    sheet_name=TestData
                                #         Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png 
                                #     END
                                # END
                                
                            END
                        ELSE
                            ${is_vis}=    Run Keyword And Return Status    Element Should Be Visible    ${alet_mes_path}    20s
                            Log To Console    ${is_vis}
                            IF    ${is_vis} == True
                                Wait Until Page Contains Element    ${alet_mes_path}
                                ${ACTUAL_RESULT1}=    Get Text    ${alet_mes_path}
                                IF    "${ACTUAL_RESULT1}" == "${EXP}"
                                    Write Excel Cell    ${i}    13    value=${ACTUAL_RESULT1}    sheet_name=TestData
                                    Write Excel Cell    ${i}    14    value=PASS    sheet_name=TestData
                                    Write Excel Cell    ${i}    15    value=No Error    sheet_name=TestData
                                ELSE
                                    Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                                    Write Excel Cell    ${i}    13    value=${ACTUAL_RESULT1}    sheet_name=TestData
                                    Write Excel Cell    ${i}    14    value=FAIL    sheet_name=TestData
                                    Write Excel Cell    ${i}    15    value=Error    sheet_name=TestData
                                    Write Excel Cell    ${i}    16    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                                END
                            
                                    Click Element    ${alet_ok}
                                    Sleep    2s
                                    ${EE_XX}=    Run Keyword And Return Status    Element Should Be Visible    ${EX_XT1}    20s
                                    Log To Console    ${EE_XX}
                                    IF    ${EE_XX} == True
                                    Wait Until Page Contains Element    ${EX_XT1}
                                    Click Element    ${EX_XT1}
                                    END
                                        Sleep    2s
                                        Click Element    ${EX_ED}
                            ELSE
                                Wait Until Page Contains Element    ${BTCOM}    20s
                                Click Element   ${BTCOM}
                                Sleep    3s
                                ${COMPLE}    Set Variable    //android.view.ViewGroup[2]/android.widget.TextView[3]
                                ${Get_TexTT}    Get Text    ${COMPLE}
                                ${Get_TooTT}    Set Variable    ${Get_TexTT.strip()}
                                Log To Console    ${Get_TooTT}
                                ${RESULT}    Set Variable    -
                                ${RESULT_1}    Set Variable    -
                                IF    "${Get_TooTT}" == "${icn}"
                                    Write Excel Cell    ${i}    13    value=${RESULT_1}    sheet_name=TestData
                                    Write Excel Cell    ${i}    14    value=PASS    sheet_name=TestData
                                    Write Excel Cell    ${i}    15    value=No Error    sheet_name=TestData
                                ELSE
                                    Write Excel Cell    ${i}    13    value=${RESULT}    sheet_name=TestData
                                    Write Excel Cell    ${i}    14    value=FAIL    sheet_name=TestData
                                    Write Excel Cell    ${i}    15    value=Error    sheet_name=TestData
                                    Write Excel Cell    ${i}    16    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                                    Sleep    2s
                                    Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                                END
                                    Sleep    2s
                                    ${EE_XX}=    Run Keyword And Return Status    Element Should Be Visible    ${EX_XT1}    20s
                                    Log To Console    ${EE_XX}
                                    IF    ${EE_XX} == True
                                    Wait Until Page Contains Element    ${EX_XT1}
                                    Click Element    ${EX_XT1}
                                    END
                            END
                        END
                    # Sleep    2s
                    # Close Application
                
            END        
        END
        Save Excel Document       C:/Users/MSI/Desktop/Test_Projact/Result/WriteExcel/TC03_EditProfile_result.xlsx
        Sleep    2s
        Close Application
        Stop Video Recording      alias=None




*** Keywords ***
Open Test Application
  Open Application  http://localhost:4723/wd/hub  automationName=${ANDROID_AUTOMATION_NAME}
  ...  platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}
  ...  app=${ANDROID_APP}  appPackage=com.prohect_fishing   appActivity=.MainActivity

Click Login page
        Wait Until Element Is Visible    ${EXIT_MAIN_BTN_PATH}    15s
        Click Element    ${EXIT_MAIN_BTN_PATH}

        Wait Until Element Is Visible    ${INPUT_USER}    12s
        Input Text    ${INPUT_USER}    Test01
        Wait Until Element Is Visible    ${INPUT_PASS}    12s
        Input Text    ${INPUT_PASS}    1234
        
        Wait Until Element Is Visible    ${Candidatetype_SPN}    12s
        Click Element    ${Candidatetype_SPN}
        Wait Until Page Contains Element    ${fishing_participant}    12s
        Click Element    ${fishing_participant}

        #กดปุ่มตกลง
        Wait Until Element Is Visible    ${CL_Submit}    12s
        Click Element    ${CL_Submit}

Enter Register Page
      [Arguments]   ${icn}    ${name}    ${sur}    ${pn}    # ${day}
    #   Sleep    1s
      Wait Until Element Is Visible    ${INPUT_TEXT_ID}    10s
      Clear Text    ${INPUT_TEXT_ID}
    #   Sleep    1s
      Wait Until Element Is Visible    ${INPUT_TEXT_ID}    10s
      Input Text    ${INPUT_TEXT_ID}    ${icn}
    #   Sleep    1s
      Wait Until Element Is Visible    ${INPUT_TEXT_NAME}    10s
      Clear Text    ${INPUT_TEXT_NAME}
    #   Sleep    1s
      Wait Until Element Is Visible    ${INPUT_TEXT_NAME}    10s
      Input Text    ${INPUT_TEXT_NAME}    ${name}
    #   Sleep    1s
      Wait Until Element Is Visible    ${INPUT_TEXT_LASENAME}    10s
      Clear Text    ${INPUT_TEXT_LASENAME}
    #   Sleep    1s
      Wait Until Element Is Visible    ${INPUT_TEXT_LASENAME}    10s
      Input Text    ${INPUT_TEXT_LASENAME}    ${sur}
    #   Sleep    1s
      Wait Until Element Is Visible    ${INPUT_TEXT_TALL}    10s
      Clear Text    ${INPUT_TEXT_TALL}
    #   Sleep    1s
      Wait Until Element Is Visible    ${INPUT_TEXT_TALL}    10s
      Input Text    ${INPUT_TEXT_TALL}    ${pn}

      # Input Text    ${INPUT_DATE}    ${day}





# * Settings *
# Library    AppiumLibrary

# * Test Cases *
# Trim Text in App
#     Open Application    platformName=Android    platformVersion=10    deviceName=your_device_name    appPackage=com.example.app    appActivity=com.example.app.MainActivity
#     ${element_text}    Get Text    id=myElementId
#     ${trimmed_text}    Set Variable    ${element_text.strip()}
#     Log    Trimmed Text: ${trimmed_text}
#     Close Application

# Left Strip Text in App
#     Open Application    platformName=Android    platformVersion=10    deviceName=your_device_name    appPackage=com.example.app    appActivity=com.example.app.MainActivity
#     ${element_text}    Get Text    id=myElementId
#     ${trimmed_text}    Set Variable    ${element_text.lstrip()}
#     Log    Trimmed Text: ${trimmed_text}
#     Close Application
      
