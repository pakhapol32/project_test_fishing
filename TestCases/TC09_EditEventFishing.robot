*** Settings ***
Library        AppiumLibrary
Library        ExcelLibrary
Library        Collections
Library        ScreenCapLibrary
Library        openpyxl
Resource    ../Resource/RS_AndroidConfiguration.robot
Resource    ../Resource/RS_TC09_EditEventFishing.robot
Library        ../Scripts/SplitMonthAndDate.py

*** Variables ***
${excel_path}    C:/Users/MSI/Desktop/Test_Projact/TestData/TD09_EditEventFishing.xlsx
*** Test Cases ***
TC09_EditEventFishing_result
    #-----------------------------------------------ยังแก้ไม่หมด------------------------------------------------------------
    Start Video Recording   alias=None  name=C:/Users/MSI/Desktop/Test_Projact/Result/Video/TC09_EditEventFishing_result  fps=None    size_percentage=1   embed=True  embed_width=100px   monitor=1
    #--------------------------------------------------------------------------------------------------------------------
    Open Excel Document    ${excel_path}    doc_id=TestData
    ${excel}    Get Sheet   TestData
    #Open App (เปิดแอพ)
    Open Test Application
    Sleep    3s
    Click Login page
    Sleep    3s

    FOR    ${i}    IN RANGE   2    ${excel.max_row+1}

        ${tcid}     Set Variable if    '${excel.cell(${i},1).value}'=='None'    ${Empty}     ${excel.cell(${i},1).value}
        Set Suite Variable   ${testcaseData}  ${tcid}
        ${EXE}    Set Variable if    '${excel.cell(${i},2).value}'=='None'    ${Empty}     ${excel.cell(${i},2).value}
        ${ENA}     Set Variable if    '${excel.cell(${i},3).value}'=='None'    ${Empty}     ${excel.cell(${i},3).value}
        ${DATE_ORD}     Set Variable if    '${excel.cell(${i},4).value}'=='None'    ${Empty}     ${excel.cell(${i},4).value}
        ${DATE_RCE}    Set Variable if    '${excel.cell(${i},5).value}'=='None'    ${Empty}     ${excel.cell(${i},5).value}
        ${DATE_DOFE}    Set Variable if    '${excel.cell(${i},6).value}'=='None'    ${Empty}     ${excel.cell(${i},6).value}
        ${TIME1}    Set Variable if    '${excel.cell(${i},7).value}'=='None'    ${Empty}     ${excel.cell(${i},7).value}
        ${TIME2}    Set Variable if    '${excel.cell(${i},8).value}'=='None'    ${Empty}     ${excel.cell(${i},8).value}
        ${AMPM1}    Set Variable if    '${excel.cell(${i},9).value}'=='None'    ${Empty}     ${excel.cell(${i},9).value}
        ${TIME3}    Set Variable if    '${excel.cell(${i},10).value}'=='None'    ${Empty}     ${excel.cell(${i},10).value}
        ${TIME4}    Set Variable if    '${excel.cell(${i},11).value}'=='None'    ${Empty}     ${excel.cell(${i},11).value}
        ${AMPM2}    Set Variable if    '${excel.cell(${i},12).value}'=='None'    ${Empty}     ${excel.cell(${i},12).value}
        ${FC}    Set Variable if    '${excel.cell(${i},13).value}'=='None'    ${Empty}     ${excel.cell(${i},13).value}
        ${NCT}    Set Variable if    '${excel.cell(${i},14).value}'=='None'    ${Empty}     ${excel.cell(${i},14).value}
        ${FCTN}    Set Variable if    '${excel.cell(${i},15).value}'=='None'    ${Empty}     ${excel.cell(${i},15).value}
        ${FTP}    Set Variable if    '${excel.cell(${i},16).value}'=='None'    ${Empty}     ${excel.cell(${i},16).value}
        ${NFP}    Set Variable if    '${excel.cell(${i},17).value}'=='None'    ${Empty}     ${excel.cell(${i},17).value}
        ${EXP}    Set Variable if    '${excel.cell(${i},18).value}'=='None'    ${Empty}     ${excel.cell(${i},18).value}
        
        IF    "${EXE}" == "Y"

            Sleep    2s
            ${AL}=    Run Keyword And Return Status    Element Should Be Visible    ${AL_CL}    15s
            Log To Console    ${AL}
            IF    ${AL} == True
                Click Element    ${AL_CL}
                Sleep    1s
            END

            Sleep    2s

            ${LA}=    Run Keyword And Return Status    Element Should Be Visible    ${ERROR_RED}    5s
            Log To Console    ${LA}
            IF    ${LA} == True
                Click Element    ${ERROR_RED}
                Sleep    1s
            END

            Sleep    2s

            Wait Until Page Contains Element    ${ED_EVE}    20s
            Click Element    ${ED_EVE}

            Sleep    5s


            ${AL1}=    Run Keyword And Return Status    Element Should Be Visible    ${AL_CL}    10s
            Log To Console    ${AL1}
            IF    ${AL1} == True
                Click Element    ${AL_CL}
                Sleep    1s
            END
            
            ${LA1}=    Run Keyword And Return Status    Element Should Be Visible    ${ERROR_RED}    10s
            Log To Console    ${LA1}
            IF    ${LA1} == True
                Wait Until Page Contains Element    ${ERROR_RED}
                Click Element    ${ERROR_RED}
                Sleep    2s
                Wait Until Page Contains Element    ${EREX1}
                Click Element    ${EREX1}
                Sleep    2s
                ${ACTUAL_RESULT5}    Set Variable    ErrorCode
                Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                Write Excel Cell    ${i}    19    value=${ACTUAL_RESULT5}    sheet_name=TestData
                Write Excel Cell    ${i}    20    value=FAIL    sheet_name=TestData
                Write Excel Cell    ${i}    21    value=Error    sheet_name=TestData
                Write Excel Cell    ${i}    22    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
            ELSE
            

                Swipe    0    800    0    100    1000

                Sleep    3s

                Wait Until Page Contains Element    ${ED_CL}
                CLick Element    ${ED_CL}

                ${LA1}=    Run Keyword And Return Status    Element Should Be Visible    ${ERROR_RED}    15s
                Log To Console    ${LA1}
                IF    ${LA1} == True
                    Click Element    ${ERROR_RED}
                    Sleep    1s
                END

                Sleep    4s
                
                # กรอกชื่อ
                Wait Until Page Contains Element    ${NAME_FIS}    20s
                Input Text    ${NAME_FIS}    ${ENA}
                # เปิด 4

                Sleep    4s
                IF    '${DATE_ORD}' != ''
                    Wait Until Page Contains Element    ${CLICK_DATE1}    20s
                    Click Element    ${CLICK_DATE1}
                    Enter DATE ONE    ${DATE_ORD}
                    Sleep    2s
                END
                
                IF    '${DATE_RCE}' != ''
                    Wait Until Page Contains Element    ${CLICK_DATE2}    20s
                    Click Element    ${CLICK_DATE2}
                    Enter DATE TWO    ${DATE_RCE}
                    Sleep    2s
                END

                IF    '${DATE_DOFE}' != ''
                    Wait Until Page Contains Element    ${CLICK_DATE3}    20s
                    Click Element    ${CLICK_DATE3}
                    Enter DATE THREE    ${DATE_DOFE}
                    Sleep    2s
                END

                Swipe    0    800    0    100    1000
                #--------------------------------------------------------------------------------------------------------------#
                #--------------------------------------------------------------------------------------------------------------#
                #--------------------------------------------------------------------------------------------------------------#
                #--------------------------------------------------------------------------------------------------------------#
                #ตลิกเวลาอันแรก
                    IF    '${TIME1}' != ''
                    
                        Wait Until Page Contains Element    ${TIME_FIR}    20s
                        Click Element    ${TIME_FIR}
                        
                        Sleep    3s


                        # คลิก 1  xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="${TTSF}"]
                        Wait Until Page Contains Element    ${PANPIM}    20s
                        Click Element    ${PANPIM}

                        Sleep    3s

                        Wait Until Page Contains Element    ${SPIN}    20s
                        Click Element    ${SPIN}
                        Sleep    1s
                        IF    "${AMPM1}" == "AM"
                            Wait Until Page Contains Element    ${A_M}    20s
                            Click Element    ${A_M}
                        ELSE IF    "${AMPM1}" == "PM"
                            Wait Until Page Contains Element    ${P_M}    20s
                            Click Element    ${P_M}
                        END

                        Sleep    3s

                        Log To Console    ${TIME1}
                        Log To Console    ${TIME2}
                        Sleep    2s
                        Wait Until Page Contains Element    ${HOM1}    20s
                        Clear Text    ${HOM1}
                        Click Element    ${HOM1}
                        Input Text    ${HOM1}   ${TIME1}
                        Log To Console    ${TIME1}
                        Sleep    1s
                        Clear Text    ${TOM1}
                        Click Element    ${TOM1}
                        Input Text    ${TOM1}    ${TIME2}
                        Log To Console    ${TIME2}

                        Wait Until Page Contains Element    ${KO}    20s
                        Click Element    ${KO}

                        Sleep    3s
                    END
                    #--------------------------------------------------------------------------------------------------------------#
                    #--------------------------------------------------------------------------------------------------------------#
                    #--------------------------------------------------------------------------------------------------------------#
                    #--------------------------------------------------------------------------------------------------------------#
                    # Check Error เวลาอันแรก
                    ${LABLE_ER}    Set Variable    android:id/label_error
                    Sleep    2s
                    ${CHECK_TIM}=    Run Keyword And Return Status    Element Should Be Visible    ${LABLE_ER}    15s
                    Log To Console    ${CHECK_TIM}
                    IF    ${CHECK_TIM} == True
                        ${ACTUAL_RESULT4}    Get Text     ${LABLE_ER}
                        IF    "${ACTUAL_RESULT4}" == "${EXP}"
                            Write Excel Cell    ${i}    19    value=${ACTUAL_RESULT4}    sheet_name=TestData
                            Write Excel Cell    ${i}    20    value=PASS    sheet_name=TestData
                            Write Excel Cell    ${i}    21    value=No Error    sheet_name=TestData
                        ELSE
                            Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                            Write Excel Cell    ${i}    19    value=${ACTUAL_RESULT4}    sheet_name=TestData
                            Write Excel Cell    ${i}    20    value=FAIL    sheet_name=TestData
                            Write Excel Cell    ${i}    21    value=Error    sheet_name=TestData
                            Write Excel Cell    ${i}    22    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                        END
                        Sleep    2s
                        Click Element    ${CANCLE}
                        Sleep    2s
                        Click Element    ${EXET}
                    ELSE
                        #ตลิกเวลาอันสอง
                        Sleep    2s
                        IF    '${TIME3}' != ''

                            Wait Until Page Contains Element    ${TIME_LAS}    20s
                            Click Element    ${TIME_LAS}
                            
                            Sleep    3s


                            # คลิก 1  xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="${TTSF}"]
                            Wait Until Page Contains Element    ${PANPIM}    20s
                            Click Element    ${PANPIM}

                            Sleep    3s


                            Wait Until Page Contains Element    ${SPIN}    20s
                            Click Element    ${SPIN}
                            Sleep    1s
                            IF    "${AMPM2}" == "AM"
                                Wait Until Page Contains Element    ${A_M}    20s
                                Click Element    ${A_M}
                            ELSE IF    "${AMPM2}" == "PM"
                                Wait Until Page Contains Element    ${P_M}    20s
                                Click Element    ${P_M}
                            END

                            Sleep    2s

                            Log To Console    ${TIME3}
                            Log To Console    ${TIME4}
                            Sleep    2s
                            Wait Until Page Contains Element    ${HOM2}    15s
                            Clear Text    ${HOM2}
                            Click Element    ${HOM2}
                            Input Text    ${HOM2}   ${TIME3}
                            Log To Console    ${TIME3}
                            Sleep    2s
                            Clear Text    ${TOM2}
                            Click Element    ${TOM2}
                            Input Text    ${TOM2}    ${TIME4}
                            Log To Console    ${TIME4}

                            Wait Until Page Contains Element    ${KO}    20s
                            Click Element    ${KO}
            
                        END
                        #--------------------------------------------------------------------------------------------------------------#
                        #--------------------------------------------------------------------------------------------------------------#
                        #--------------------------------------------------------------------------------------------------------------#
                        #--------------------------------------------------------------------------------------------------------------#
                        # Check Error เวลาอันสอง
                            Sleep    2s
                            ${LABLE_ER1}    Set Variable    android:id/label_error
                            Sleep    2s
                            ${CHECK_TIM1}=    Run Keyword And Return Status    Element Should Be Visible    ${LABLE_ER1}    15s
                            Log To Console    ${CHECK_TIM1}
                            IF    ${CHECK_TIM1} == True
                                ${ACTUAL_RESULT5}    Get Text     ${LABLE_ER1}
                                IF    "${ACTUAL_RESULT5}" == "${EXP}"
                                    Write Excel Cell    ${i}    19    value=${ACTUAL_RESULT5}    sheet_name=TestData
                                    Write Excel Cell    ${i}    20    value=PASS    sheet_name=TestData
                                    Write Excel Cell    ${i}    21    value=No Error    sheet_name=TestData
                                ELSE
                                    Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                                    Write Excel Cell    ${i}    19    value=${ACTUAL_RESULT5}    sheet_name=TestData
                                    Write Excel Cell    ${i}    20    value=FAIL    sheet_name=TestData
                                    Write Excel Cell    ${i}    21    value=Error    sheet_name=TestData
                                    Write Excel Cell    ${i}    22    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                                END
                                Sleep    2s
                                Click Element    ${CANCLE}
                                Sleep    2s
                                Click Element    ${EXET}
                                
                            ELSE

                                Sleep    2s

                                Wait Until Page Contains Element    ${CODITION}    20s
                                Input Text   ${CODITION}    ${FC}

                                #กดคลิกถัดไป
                                Sleep    2s
                                Wait Until Page Contains Element    ${NEXT_CL}    20s
                                Click Element    ${NEXT_CL}

                                Sleep    6s

                                    #Check Error 1
                                    ${is_vis1}=    Run Keyword And Return Status    Element Should Be Visible    ${alet_mes_path}    15s
                                    Log To Console    ${is_vis1}
                                    IF  ${is_vis1} == True
                                        Wait Until Page Contains Element    ${alet_mes_path}
                                        ${ACTUAL_RESULT}=    Get Text    ${alet_mes_path}

                                        IF    "${ACTUAL_RESULT}" == "${EXP}"
                                            Write Excel Cell    ${i}    19    value=${ACTUAL_RESULT}    sheet_name=TestData
                                            Write Excel Cell    ${i}    20    value=PASS    sheet_name=TestData
                                            Write Excel Cell    ${i}    21    value=No Error    sheet_name=TestData
                                        ELSE
                                            Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                                            Write Excel Cell    ${i}    19    value=${ACTUAL_RESULT}    sheet_name=TestData
                                            Write Excel Cell    ${i}    20    value=FAIL    sheet_name=TestData
                                            Write Excel Cell    ${i}    21    value=Error    sheet_name=TestData
                                            Write Excel Cell    ${i}    22    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                                        END
                                            Click Element    ${alet_ok}
                                            Sleep    2s
                                            ${AL2}=    Run Keyword And Return Status    Element Should Be Visible    ${AL_CL}    15s
                                            Log To Console    ${AL2}
                                            IF    ${AL2} == True
                                                Click Element    ${AL_CL}
                                                Sleep    1s
                                            END
                                            
                                            Click Element    ${EXET}
                                            Sleep    1s
                                    ELSE
                                        ${CHECK}    Set Variable    //*[@text="เพิ่มการจัดงานตกปลา"]
                                        ${is_vis2}=    Run Keyword And Return Status    Element Should Be Visible    ${CHECK}    15s
                                        Log To Console    ${is_vis2}
                                        IF    ${is_vis2} == True
                                            ${RESULt}    Set Variable    Not Found Alert Element
                                            IF    "${RESULt}" == "${EXP}"
                                                Write Excel Cell    ${i}    19    value=${RESULt}    sheet_name=TestData
                                                Write Excel Cell    ${i}    20    value=PASS    sheet_name=TestData
                                                Write Excel Cell    ${i}    21    value=No Error    sheet_name=TestData
                                            ELSE
                                                Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                                                Write Excel Cell    ${i}    19    value=${RESULt}    sheet_name=TestData
                                                Write Excel Cell    ${i}    20    value=FAIL    sheet_name=TestData
                                                Write Excel Cell    ${i}    21    value=Error    sheet_name=TestData
                                                Write Excel Cell    ${i}    22    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                                            END
                                                ${AL3}=    Run Keyword And Return Status    Element Should Be Visible    ${AL_CL}    15s
                                                Log To Console    ${AL3}
                                                IF    ${AL3} == True
                                                    Click Element    ${AL_CL}
                                                    Sleep    1s
                                                END
                                                Wait Until Page Contains Element    ${EXET}    20s
                                                Click Element    ${EXET}
                                                Sleep    5s
                                        ELSE
                                            #----------------------------------#
                                            #----------------------------------#
                                            #ที่เหลือจะเป็นการ Test ด้วนมือ
                                            Sleep    3s


                                                Sleep    2s
                                                Input Text    ${PRA_ONE}    ${FCTN}
                                                Input Text    ${NUM_ONE}    ${FTP}
                                                Input Text    ${PEO_ONE}    ${NFP} 

                                                Sleep    2s

                                                Wait Until Page Contains Element    ${CO_PAW}    20s
                                                Click Element    ${CO_PAW}
                                                #Check Error 2
                                                Sleep    2s
                                                #Check Error 2
                                                ${is_vis3}=    Run Keyword And Return Status    Element Should Be Visible    ${alet_mes_path}
                                                Log To Console    ${is_vis3}
                                                IF  ${is_vis3} == True
                                                    Wait Until Page Contains Element    ${alet_mes_path}
                                                    ${ACTUAL_RESULT1}=    Get Text    ${alet_mes_path}

                                                    IF    "${ACTUAL_RESULT1}" == "${EXP}"
                                                        Write Excel Cell    ${i}    19    value=${ACTUAL_RESULT1}    sheet_name=TestData
                                                        Write Excel Cell    ${i}    20    value=PASS    sheet_name=TestData
                                                        Write Excel Cell    ${i}    21    value=No Error    sheet_name=TestData
                                                    ELSE
                                                        Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                                                        Write Excel Cell    ${i}    19    value=${ACTUAL_RESULT1}    sheet_name=TestData
                                                        Write Excel Cell    ${i}    20    value=FAIL    sheet_name=TestData
                                                        Write Excel Cell    ${i}    21    value=Error    sheet_name=TestData
                                                        Write Excel Cell    ${i}    22    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                                                    END
                                                        Click Element    ${alet_ok}
                                                        Sleep    2s
                                                        ${AL4}=    Run Keyword And Return Status    Element Should Be Visible    ${AL_CL}    15s
                                                        Log To Console    ${AL4}
                                                        IF    ${AL4} == True
                                                            Click Element    ${AL_CL}
                                                            Sleep    1s
                                                        END
                                                        Click Element    ${EXET}
                                                        Sleep    1s
                                                ELSE
                                                    Sleep    2s
                                                    ${MEMBER1}    Set Variable    //android.widget.TextView[@index=4]
                                                    Sleep    2s
                                                    ${is_vis4}=    Run Keyword And Return Status    Element Should Be Visible    ${MEMBER1}    20s
                                                    Log To Console    ${is_vis4}
                                                    IF    ${is_vis4} == True
                                                        ${EVENT}    Set Variable    //*[@text='${ENA}']
                                                        ${RESULT3}    Set Variable    Not Found Alert Element(not updating) 
                                                        ${RESULT}    Set Variable    Not Found Alert Element
                                                        ${CHECK1}=    Run Keyword And Return Status    Element Should Be Visible    ${EVENT}
                                                        Log To Console    ${CHECK1}
                                                        IF    ${CHECK1} == True
                                                            ${ACTUAL_RESULT2}    Get Text    ${EVENT}
                                                            Log To Console   ${ACTUAL_RESULT2}
                                                        ELSE
                                                            ${ACTUAL_RESULT2}    Set Variable    NoDataUpDate
                                                        END
                                                        Sleep    2s
                                                            IF    '${ACTUAL_RESULT2}' == '${ENA}'
                                                                Write Excel Cell    ${i}    19    value=${RESULT}    sheet_name=TestData
                                                                Write Excel Cell    ${i}    20    value=PASS    sheet_name=TestData
                                                                Write Excel Cell    ${i}    21    value=No Error    sheet_name=TestData
                                                            ELSE
                                                                Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                                                                Write Excel Cell    ${i}    19    value=${RESULT3}    sheet_name=TestData
                                                                Write Excel Cell    ${i}    20    value=FAIL    sheet_name=TestData
                                                                Write Excel Cell    ${i}    21    value=Error    sheet_name=TestData
                                                                Write Excel Cell    ${i}    22    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                                                            END
                                                                ${AL5}=    Run Keyword And Return Status    Element Should Be Visible    ${AL_CL}    15s
                                                                Log To Console    ${AL5}
                                                                IF    ${AL5} == True
                                                                    Click Element    ${AL_CL}
                                                                    Sleep    1s
                                                                END
                                                                
                                                            
                                                    ELSE
                                                        ${ACTUAL_RESULT3}    Set Variable    Not Found Alert Element (No Data)
                                                        IF    '${ACTUAL_RESULT3}' == '${EXP}'
                                                            Write Excel Cell    ${i}    19    value=${ACTUAL_RESULT3}    sheet_name=TestData
                                                            Write Excel Cell    ${i}    20    value=PASS    sheet_name=TestData
                                                            Write Excel Cell    ${i}    21    value=No Error    sheet_name=TestData
                                                        ELSE
                                                            Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                                                            Write Excel Cell    ${i}    19    value=${ACTUAL_RESULT3}    sheet_name=TestData
                                                            Write Excel Cell    ${i}    20    value=FAIL    sheet_name=TestData
                                                            Write Excel Cell    ${i}    21    value=Error    sheet_name=TestData
                                                            Write Excel Cell    ${i}    22    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                                                        END
                                                        ${AL6}=    Run Keyword And Return Status    Element Should Be Visible    ${AL_CL}    15s
                                                        Log To Console    ${AL6}
                                                        IF    ${AL6} == True
                                                            Click Element    ${AL_CL}
                                                            Sleep    1s
                                                        END
                                                    END
                                                END
                                        END
                            END       
                    END
                        
                END 
            END 
        END
    END

    Save Excel Document       C:/Users/MSI/Desktop/Test_Projact/Result/WriteExcel/TC09_EditEventFishing_result.xlsx
    Close Application
    Sleep    2s
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
        Input Text    ${INPUT_USER}    Tesf2
        Wait Until Page Contains Element    ${INPUT_PASS}
        Input Text    ${INPUT_PASS}    1234
            
        Click Element    ${Candidatetype_SPN}
        Wait Until Page Contains Element    ${fishpond_owner}
        Click Element    ${fishpond_owner}

        #กดปุ่มตกลง
        Click Element    ${CL_Submit}




Enter DATE ONE
    [Arguments]    ${DATE_ORD}
    #วันเกิด
    #เช็คปีเดือนปัจจุบัน
    # Wait Until Page Contains Element    ${CLICK_DATE1}
    # Click Element    ${CLICK_DATE1}

    Sleep    2s

    ${CURR_YEAR}    Get Text    ${HEADER_YEAR}
    ${CURR_DATE}    Get Text    ${HEADER_DATE}

    Click Element    ${HEADER_YEAR}
    Sleep    5s
    #ดึงค่าจาก ไพทอน และ จาก excel
    ${DATE_TARGET_ARRAY}=    Split Str By Slash    ${DATE_ORD}
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
            Swipe By Percent    50    60    50    33    1000
        ELSE IF    ${TEXT_OF_FIRST} > ${TARGET_YEAR}
            Swipe By Percent    50    33    50    60    1000
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
                IF    ${num_day} == ${TARGET_DAY}
                    Sleep    3s
                    Click Element    ${day}
                    Exit For Loop
                END
            END
            Exit For Loop
        END
    END

    Click Element    ${OK_YEAR_BTN}

    Log To Console    ${date}
    Log To Console    "CONTENT DESC IS ${content_desc}"

    Sleep    2s

Enter DATE TWO
    [Arguments]    ${DATE_RCE}

    # Wait Until Page Contains Element    ${CLICK_DATE2}
    # Click Element    ${CLICK_DATE2}
    Sleep    2s

    #วันเกิด
    #เช็คปีเดือนปัจจุบัน
    ${CURR_YEAR}    Get Text    ${HEADER_YEAR}
    ${CURR_DATE}    Get Text    ${HEADER_DATE}

    Click Element    ${HEADER_YEAR}
    Sleep    5s
    #ดึงค่าจาก ไพทอน และ จาก excel
    ${DATE_TARGET_ARRAY}=    Split Str By Slash    ${DATE_RCE}
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
            Swipe By Percent    50    60    50    33    1000
        ELSE IF    ${TEXT_OF_FIRST} > ${TARGET_YEAR}
            Swipe By Percent    50    33    50    60    1000
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
                IF    ${num_day} == ${TARGET_DAY}
                    Sleep    3s
                    Click Element    ${day}
                    Exit For Loop
                END
            END
            Exit For Loop
        END
    END

    Click Element    ${OK_YEAR_BTN}

    Log To Console    ${date}
    Log To Console    "CONTENT DESC IS ${content_desc}"

    Sleep    2s

Enter DATE THREE
    [Arguments]    ${DATE_DOFE}

    # Wait Until Page Contains Element    ${CLICK_DATE3}
    # Click Element    ${CLICK_DATE3}
    Sleep    2s

    #วันเกิด
    #เช็คปีเดือนปัจจุบัน
    ${CURR_YEAR}    Get Text    ${HEADER_YEAR}
    ${CURR_DATE}    Get Text    ${HEADER_DATE}

    Click Element    ${HEADER_YEAR}
    Sleep    5s
    #ดึงค่าจาก ไพทอน และ จาก excel
    ${DATE_TARGET_ARRAY}=    Split Str By Slash    ${DATE_DOFE}
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
            Swipe By Percent    50    60    50    33    1000
        ELSE IF    ${TEXT_OF_FIRST} > ${TARGET_YEAR}
            Swipe By Percent    50    33    50    60    1000
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
                IF    ${num_day} == ${TARGET_DAY}
                    Sleep    3s
                    Click Element    ${day}
                    Exit For Loop
                END
            END
            Exit For Loop
        END
    END

    Click Element    ${OK_YEAR_BTN}

    Log To Console    ${date}
    Log To Console    "CONTENT DESC IS ${content_desc}"

    Sleep    2s
