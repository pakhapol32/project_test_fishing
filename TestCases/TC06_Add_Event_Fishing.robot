*** Settings ***
Library    AppiumLibrary
Library    ExcelLibrary
Library    Collections
Library    ScreenCapLibrary
Library    openpyxl
Resource    ../Resource/RS_AndroidConfiguration.robot
Resource    ../Resource/RS_TC06_Add_Event_Fishing.robot
Library    ../Scripts/SplitMonthAndDate.py

*** Variables ***
${excel_path}    C:/Users/MSI/Desktop/Test_Projact/TestData/TC06_Add_Event_Fishing.xlsx
*** Test Cases ***
TC06_Add_Event_Fishing
    #-----------------------------------------------ยังแก้ไม่หมด------------------------------------------------------------
    Start Video Recording   alias=None  name=C:/Users/MSI/Desktop/Test_Projact/Result/Video/TC06_Add_Event_Fishing    fps=None    size_percentage=1   embed=True  embed_width=100px   monitor=1
    #--------------------------------------------------------------------------------------------------------------------
    Open Excel Document    ${excel_path}    doc_id=TestData
    ${excel}    Get Sheet   TestData

    Open Test Application
            
    Click Login page


    FOR    ${i}    IN RANGE   2    ${excel.max_row+1}

        ${tcid}     Set Variable if    '${excel.cell(${i},1).value}'=='None'    ${Empty}     ${excel.cell(${i},1).value}
        Set Suite Variable   ${testcaseData}  ${tcid}
        ${EXE}    Set Variable if    '${excel.cell(${i},2).value}'=='None'    ${Empty}     ${excel.cell(${i},2).value}
        ${TF}    Set Variable if    '${excel.cell(${i},3).value}'=='None'    ${Empty}     ${excel.cell(${i},3).value}
        ${APF}    Set Variable if    '${excel.cell(${i},4).value}'=='None'    ${Empty}     ${excel.cell(${i},4).value}
        ${ENA}     Set Variable if    '${excel.cell(${i},5).value}'=='None'    ${Empty}     ${excel.cell(${i},5).value}
        ${DATE_ORD}     Set Variable if    '${excel.cell(${i},6).value}'=='None'    ${Empty}     ${excel.cell(${i},6).value}
        ${DATE_RCE}    Set Variable if    '${excel.cell(${i},7).value}'=='None'    ${Empty}     ${excel.cell(${i},7).value}
        ${DATE_DOFE}    Set Variable if    '${excel.cell(${i},8).value}'=='None'    ${Empty}     ${excel.cell(${i},8).value}
        ${TIME1}    Set Variable if    '${excel.cell(${i},9).value}'=='None'    ${Empty}     ${excel.cell(${i},9).value}
        ${TIME2}    Set Variable if    '${excel.cell(${i},10).value}'=='None'    ${Empty}     ${excel.cell(${i},10).value}
        ${AMPM1}    Set Variable if    '${excel.cell(${i},11).value}'=='None'    ${Empty}     ${excel.cell(${i},11).value}
        ${TIME3}    Set Variable if    '${excel.cell(${i},12).value}'=='None'    ${Empty}     ${excel.cell(${i},12).value}
        ${TIME4}    Set Variable if    '${excel.cell(${i},13).value}'=='None'    ${Empty}     ${excel.cell(${i},13).value}
        ${AMPM2}    Set Variable if    '${excel.cell(${i},14).value}'=='None'    ${Empty}     ${excel.cell(${i},14).value}
        ${FC}    Set Variable if    '${excel.cell(${i},15).value}'=='None'    ${Empty}     ${excel.cell(${i},15).value}
        ${NCT}    Set Variable if    '${excel.cell(${i},16).value}'=='None'    ${Empty}     ${excel.cell(${i},16).value}
        ${FCTN}    Set Variable if    '${excel.cell(${i},17).value}'=='None'    ${Empty}     ${excel.cell(${i},17).value}
        ${FTP}    Set Variable if    '${excel.cell(${i},18).value}'=='None'    ${Empty}     ${excel.cell(${i},18).value}
        ${NFP}    Set Variable if    '${excel.cell(${i},19).value}'=='None'    ${Empty}     ${excel.cell(${i},19).value}
        ${FCTN1}    Set Variable if    '${excel.cell(${i},20).value}'=='None'    ${Empty}     ${excel.cell(${i},20).value}
        ${FTP1}    Set Variable if    '${excel.cell(${i},21).value}'=='None'    ${Empty}     ${excel.cell(${i},21).value}
        ${NFP1}    Set Variable if    '${excel.cell(${i},22).value}'=='None'    ${Empty}     ${excel.cell(${i},22).value}
        ${FCTN2}    Set Variable if    '${excel.cell(${i},23).value}'=='None'    ${Empty}     ${excel.cell(${i},23).value}
        ${FTP2}    Set Variable if    '${excel.cell(${i},24).value}'=='None'    ${Empty}     ${excel.cell(${i},24).value}
        ${NFP2}    Set Variable if    '${excel.cell(${i},25).value}'=='None'    ${Empty}     ${excel.cell(${i},25).value}
        ${FCTN3}    Set Variable if    '${excel.cell(${i},26).value}'=='None'    ${Empty}     ${excel.cell(${i},26).value}
        ${FTP3}    Set Variable if    '${excel.cell(${i},27).value}'=='None'    ${Empty}     ${excel.cell(${i},27).value}
        ${NFP3}    Set Variable if    '${excel.cell(${i},28).value}'=='None'    ${Empty}     ${excel.cell(${i},28).value}
        ${EXP}    Set Variable if    '${excel.cell(${i},29).value}'=='None'    ${Empty}     ${excel.cell(${i},29).value}
        
        IF    "${EXE}" == "Y"

            #Open App (เปิดแอพ)
            Sleep    2s

            ${AL}=    Run Keyword And Return Status    Element Should Be Visible    ${AL_CL}    15s
            Log To Console    ${AL}
            IF    ${AL} == True
                Click Element    ${AL_CL}
                Sleep    1s
            END
           
            
            # Sleep    3s

            Wait Until Element Is Visible    ${Datafish}    15s
            Click Element    ${Datafish}

            # Sleep    2s

            Wait Until Element Is Visible    ${IMG_plus}    15s
            Click Element    ${IMG_plus}

            # Sleep    3s

            Swipe    0    800    0    100    1000

            # Sleep    2s
            Wait Until Element Is Visible    ${CL_ADD}    15s
            Click Element    ${CL_ADD}

            #อัพโหลดรูปภาพ

            # Sleep    3s
            # Wait Until Page Contains Element    ${IMG_BTN_PATH}
            # Click Element    ${IMG_BTN_PATH}
            # Sleep    1s

            # Wait Until Page Contains Element    ${CL_IMG}
            # Click Element    ${CL_IMG}

            # Sleep   5s

            UPLOAD_PIX    ${APF}

            # เปิด 3
            Wait Until Element Is Visible    ${NAME_FIS}    7s
            Input Text    ${NAME_FIS}    ${ENA}
            # เปิด 4
            Sleep    2s
            IF    '${DATE_ORD}' != ''
                Wait Until Element Is Visible    ${CLICK_DATE1}    7s
                Click Element    ${CLICK_DATE1}
                Enter DATE ONE    ${DATE_ORD}
                Sleep    2s
            END
            
            IF    '${DATE_RCE}' != ''
                Wait Until Element Is Visible    ${CLICK_DATE2}    7s
                Click Element    ${CLICK_DATE2}
                Enter DATE TWO    ${DATE_RCE}
                Sleep    2s
            END

            IF    '${DATE_DOFE}' != ''
                Wait Until Element Is Visible    ${CLICK_DATE3}    7s
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
                
                    Wait Until Element Is Visible    ${TIME_FIR}    7s
                    Click Element    ${TIME_FIR}
                    
                    # Sleep    3s


                    # คลิก 1  xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="${TTSF}"]
                    Wait Until Element Is Visible    ${PANPIM}    7s
                    Click Element    ${PANPIM}

                    Sleep    2s

                    Wait Until Page Contains Element    ${SPIN}    10s
                    Click Element    ${SPIN}
                    Sleep    1s
                    IF    "${AMPM1}" == "AM"
                        Wait Until Page Contains Element    ${A_M}
                        Click Element    ${A_M}
                    ELSE IF    "${AMPM1}" == "PM"
                        Wait Until Page Contains Element    ${P_M}
                        Click Element    ${P_M}
                    END

                    # Sleep    3s

                    Log To Console    ${TIME1}
                    Log To Console    ${TIME2}
                    # Sleep    2s
                    Wait Until Element Is Visible    ${HOM1}    7s
                    Clear Text    ${HOM1}
                    Wait Until Element Is Visible    ${HOM1}    7s
                    Click Element    ${HOM1}
                    Wait Until Element Is Visible    ${HOM1}    7s
                    Input Text    ${HOM1}   ${TIME1}
                    Log To Console    ${TIME1}
                    # Sleep    1s
                    Wait Until Element Is Visible    ${TOM1}    7s
                    Clear Text    ${TOM1}
                    Wait Until Element Is Visible    ${TOM1}    7s
                    Click Element    ${TOM1}
                    Wait Until Element Is Visible    ${TOM1}    7s
                    Input Text    ${TOM1}    ${TIME2}
                    Log To Console    ${TIME2}


                    # ${HOUR_TIME1} =    Set Variable    //android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="${TIME1}"]
                    # Sleep    2s
                    # Log To Console    ${HOUR_TIME1}
                    # Wait Until Page Contains Element    ${HOUR_TIME1}    15s
                    # Click Element    ${HOUR_TIME1}
                    # Sleep    2s
                    # ${MIN_TIME1} =    Set Variable    //android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="${TIME2}"]
                    # Sleep    2s
                    # Log To Console    ${MIN_TIME1}
                    # Wait Until Page Contains Element    ${MIN_TIME1}    15s
                    # Click Element    ${MIN_TIME1}
                    # Sleep    4s
                    # ${CL2}=    Run Keyword And Return Status    Element Should Be Visible    ${MIN_TIME1}    15s
                    # Log To Console    ${CL2}
                    # IF    ${CL2} == True
                    #     Click Element    ${MIN_TIME1}
                    #     Sleep    1s
                    # END

                    Wait Until Element Is Visible    ${KO}    7s
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
                        Write Excel Cell    ${i}    30    value=${ACTUAL_RESULT4}    sheet_name=TestData
                        Write Excel Cell    ${i}    31    value=PASS    sheet_name=TestData
                        Write Excel Cell    ${i}    32    value=No Error    sheet_name=TestData
                    ELSE
                        Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                        Write Excel Cell    ${i}    30    value=${ACTUAL_RESULT4}    sheet_name=TestData
                        Write Excel Cell    ${i}    31    value=FAIL    sheet_name=TestData
                        Write Excel Cell    ${i}    32    value=Error    sheet_name=TestData
                        Write Excel Cell    ${i}    33    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                    END
                    Sleep    2s
                    Click Element    ${CANCLE}
                    Sleep    2s
                    Click Element    ${EXET}
                ELSE
                    #ตลิกเวลาอันสอง
                    Sleep    2s
                    IF    '${TIME3}' != ''
                        
                        Wait Until Element Is Visible    ${TIME_LAS}    7s
                        Click Element    ${TIME_LAS}
                        
                        # Sleep    3s


                        # คลิก 1  xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="${TTSF}"]
                        Wait Until Element Is Visible    ${PANPIM}    5s
                        Click Element    ${PANPIM}

                        Sleep    2s


                        Wait Until Page Contains Element    ${SPIN}    5s
                        Click Element    ${SPIN}
                        Sleep    1s
                        IF    "${AMPM2}" == "AM"
                            Wait Until Page Contains Element    ${A_M}    15s
                            Click Element    ${A_M}
                        ELSE IF    "${AMPM2}" == "PM"
                            Wait Until Page Contains Element    ${P_M}    15s
                            Click Element    ${P_M}
                        END

                        # Sleep    2s

                        Log To Console    ${TIME3}
                        Log To Console    ${TIME4}
                        # Sleep    2s
                        Wait Until Element Is Visible    ${HOM2}    15s
                        Clear Text    ${HOM2}
                        Wait Until Element Is Visible    ${HOM2}    15s
                        Click Element    ${HOM2}
                        Wait Until Element Is Visible    ${HOM2}    15s
                        Input Text    ${HOM2}   ${TIME3}
                        Log To Console    ${TIME3}
                        # Sleep    2s
                        Wait Until Element Is Visible    ${TOM2}    15s
                        Clear Text    ${TOM2}
                        Wait Until Element Is Visible    ${TOM2}    15s
                        Click Element    ${TOM2}
                        Wait Until Element Is Visible    ${TOM2}    15s
                        Input Text    ${TOM2}    ${TIME4}
                        Log To Console    ${TIME4}

                        Wait Until Element Is Visible    ${KO}    15s
                        Click Element    ${KO}

                        # Sleep    2s
                        
                        # IF    "${AMPM2}" == "AM"
                        #     Wait Until Page Contains Element    ${A_M}
                        #     Click Element    ${A_M}
                        # ELSE IF    "${AMPM2}" == "PM"
                        #     Wait Until Page Contains Element    ${P_M}
                        #     Click Element    ${P_M}
                        # END
                        # Sleep    2s

                        # # คลิก 2 # xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="${Tt_sF}"]
                        # ${HOUR_TIME2} =    Set Variable    //android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="${TIME3}"]
                        # Sleep    2s
                        # Log To Console    ${HOUR_TIME2}
                        # Wait Until Page Contains Element    ${HOUR_TIME2}    15s
                        # Click Element    ${HOUR_TIME2}
                        # Sleep    2s
                        # ${MIN_TIME2} =    Set Variable    //android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="${TIME4}"]
                        # Sleep    2s
                        # Log To Console    ${MIN_TIME2}
                        # Wait Until Page Contains Element    ${MIN_TIME2}    15s
                        # Click Element    ${MIN_TIME2}
                        # Sleep    3s
                        # ${CL4}=    Run Keyword And Return Status    Element Should Be Visible    ${MIN_TIME2}    15s
                        #     Log To Console    ${CL4}
                        #     IF    ${CL4} == True
                        #         Click Element    ${MIN_TIME2}
                        #         Sleep    1s
                        #     END

                        # Sleep    2s
          
                    END
                    #--------------------------------------------------------------------------------------------------------------#
                    #--------------------------------------------------------------------------------------------------------------#
                    #--------------------------------------------------------------------------------------------------------------#
                    #--------------------------------------------------------------------------------------------------------------#
                    # Check Error เวลาอันสอง
                        # Sleep    2s
                        ${LABLE_ER1}    Set Variable    android:id/label_error
                        Sleep    2s
                        ${CHECK_TIM1}=    Run Keyword And Return Status    Element Should Be Visible    ${LABLE_ER1}    15s
                        Log To Console    ${CHECK_TIM1}
                        IF    ${CHECK_TIM1} == True
                            ${ACTUAL_RESULT5}    Get Text     ${LABLE_ER1}
                            IF    "${ACTUAL_RESULT5}" == "${EXP}"
                                Write Excel Cell    ${i}    30    value=${ACTUAL_RESULT5}    sheet_name=TestData
                                Write Excel Cell    ${i}    31    value=PASS    sheet_name=TestData
                                Write Excel Cell    ${i}    32    value=No Error    sheet_name=TestData
                            ELSE
                                Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                                Write Excel Cell    ${i}    30    value=${ACTUAL_RESULT5}    sheet_name=TestData
                                Write Excel Cell    ${i}    31    value=FAIL    sheet_name=TestData
                                Write Excel Cell    ${i}    32    value=Error    sheet_name=TestData
                                Write Excel Cell    ${i}    33    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                            END
                            Wait Until Element Is Visible    ${CANCLE}    15s
                            Click Element    ${CANCLE}
                            Wait Until Element Is Visible    ${EXET}    15s
                            Click Element    ${EXET}
                            
                        ELSE
                            # Sleep    2s
                            # ${AL}=    Run Keyword And Return Status    Element Should Be Visible    ${AL_CL}    15s
                            # Log To Console    ${AL}
                            # IF    ${AL} == True
                            #     Click Element    ${AL_CL}
                            #     Sleep    1s
                            # END

                            # Sleep    2s

                            Wait Until Element Is Visible    ${CODITION}    15s
                            Input Text   ${CODITION}    ${FC}

                            #กดคลิกถัดไป
                            # Sleep    2s
                            Wait Until Element Is Visible    ${NEXT_CL}    15s
                            Click Element    ${NEXT_CL}

                            Sleep    5s

                                #Check Error 1
                                ${is_vis1}=    Run Keyword And Return Status    Element Should Be Visible    ${alet_mes_path}    15s
                                Log To Console    ${is_vis1}
                                IF  ${is_vis1} == True
                                    Wait Until Page Contains Element    ${alet_mes_path}
                                    ${ACTUAL_RESULT}=    Get Text    ${alet_mes_path}

                                    IF    "${ACTUAL_RESULT}" == "${EXP}"
                                        Write Excel Cell    ${i}    30    value=${ACTUAL_RESULT}    sheet_name=TestData
                                        Write Excel Cell    ${i}    31    value=PASS    sheet_name=TestData
                                        Write Excel Cell    ${i}    32    value=No Error    sheet_name=TestData
                                    ELSE
                                        Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                                        Write Excel Cell    ${i}    30    value=${ACTUAL_RESULT}    sheet_name=TestData
                                        Write Excel Cell    ${i}    31    value=FAIL    sheet_name=TestData
                                        Write Excel Cell    ${i}    32    value=Error    sheet_name=TestData
                                        Write Excel Cell    ${i}    33    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                                    END
                                        Click Element    ${alet_ok}
                                        Sleep    2s
                                        ${AL}=    Run Keyword And Return Status    Element Should Be Visible    ${AL_CL}    15s
                                        Log To Console    ${AL}
                                        IF    ${AL} == True
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
                                        ${RESULt}    Set Variable    -
                                        IF    "${RESULt}" == "${EXP}"
                                            Write Excel Cell    ${i}    30    value=${RESULt}    sheet_name=TestData
                                            Write Excel Cell    ${i}    31    value=PASS    sheet_name=TestData
                                            Write Excel Cell    ${i}    32    value=No Error    sheet_name=TestData
                                        ELSE IF    "${TF}" == "T"
                                            Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                                            Write Excel Cell    ${i}    30    value=${RESULt}    sheet_name=TestData
                                            Write Excel Cell    ${i}    31    value=FAIL    sheet_name=TestData
                                            Write Excel Cell    ${i}    32    value=Error : Data have not update    sheet_name=TestData
                                            Write Excel Cell    ${i}    33    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                                        ELSE IF    "${TF}" == "F"
                                            Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                                            Write Excel Cell    ${i}    30    value=${RESULt}    sheet_name=TestData
                                            Write Excel Cell    ${i}    31    value=FAIL    sheet_name=TestData
                                            Write Excel Cell    ${i}    32    value=Error : Not Found Alert Element    sheet_name=TestData
                                            Write Excel Cell    ${i}    33    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                                        END
                                            ${AL}=    Run Keyword And Return Status    Element Should Be Visible    ${AL_CL}    15s
                                            Log To Console    ${AL}
                                            IF    ${AL} == True
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
                                        Sleep    7s
                                        Wait Until Page Contains Element    ${SE_NM}    20s
                                        Click Element    ${SE_NM}          
                                        IF    "${NCT}" == "1"
                                        Sleep    2s
                                            Wait Until Page Contains Element    ${NU_ONE}    20s
                                            Click Element    ${NU_ONE}
                                            # Sleep    2s
                                            Wait Until Element Is Visible    ${PRA_ONE}    15s
                                            Input Text    ${PRA_ONE}    ${FCTN}
                                            Wait Until Element Is Visible    ${NUM_ONE}    15s
                                            Input Text    ${NUM_ONE}    ${FTP}
                                            Wait Until Element Is Visible    ${PEO_ONE}    15s
                                            Input Text    ${PEO_ONE}    ${NFP} 
                                        ELSE IF    "${NCT}" == "2"
                                        Sleep    2s
                                            Wait Until Page Contains Element    ${NU_TWO}    20s
                                            Click Element    ${NU_TWO}
                                            # Sleep    2s
                                            Wait Until Element Is Visible    ${PRA_ONE}    15s
                                            Input Text    ${PRA_ONE}    ${FCTN}
                                            Wait Until Element Is Visible    ${NUM_ONE}    15s
                                            Input Text    ${NUM_ONE}    ${FTP}
                                            Wait Until Element Is Visible    ${PEO_ONE}    15s
                                            Input Text    ${PEO_ONE}    ${NFP} 
                                            Wait Until Element Is Visible    ${PRA_TWO}    15s
                                            Input Text    ${PRA_TWO}    ${FCTN1}
                                            Wait Until Element Is Visible    ${NUM_TWO}    15s
                                            Input Text    ${NUM_TWO}    ${FTP1}
                                            Wait Until Element Is Visible    ${PEO_TWO}    15s
                                            Input Text    ${PEO_TWO}    ${NFP1}
                                            Swipe    0    800    0    100    1000
                                        ELSE IF    "${NCT}" == "3"
                                        Sleep    2s
                                            Wait Until Page Contains Element    ${NU_THREE}    20s
                                            Click Element    ${NU_THREE}
                                            # Sleep    2s
                                            Wait Until Element Is Visible    ${PRA_ONE}    15s
                                            Input Text    ${PRA_ONE}    ${FCTN}
                                            Wait Until Element Is Visible    ${NUM_ONE}    15s
                                            Input Text    ${NUM_ONE}    ${FTP}
                                            Wait Until Element Is Visible    ${PEO_ONE}    15s
                                            Input Text    ${PEO_ONE}    ${NFP} 
                                            Wait Until Element Is Visible    ${PRA_TWO}    15s
                                            Input Text    ${PRA_TWO}    ${FCTN1}
                                            Wait Until Element Is Visible    ${NUM_TWO}    15s
                                            Input Text    ${NUM_TWO}    ${FTP1}
                                            Wait Until Element Is Visible    ${PEO_TWO}    15s
                                            Input Text    ${PEO_TWO}    ${NFP1}
                                            Swipe    0    800    0    100    1000
                                            Swipe    0    800    0    100    1000
                                            Wait Until Element Is Visible    ${PRA_TWO}    15s
                                            Input Text    ${PRA_TWO}    ${FCTN2}
                                            Wait Until Element Is Visible    ${NUM_TWO}    15s
                                            Input Text    ${NUM_TWO}    ${FTP2}
                                            Wait Until Element Is Visible    ${PEO_TWO}    15s
                                            Input Text    ${PEO_TWO}    ${NFP2}
                                        ELSE IF    "${NCT}" == "4"
                                        Sleep    2s
                                            Wait Until Page Contains Element    ${NU_FORE}    20s
                                            Click Element    ${NU_FORE}
                                            # Sleep    2s
                                            Wait Until Element Is Visible    ${PRA_ONE}    15s
                                            Input Text    ${PRA_ONE}    ${FCTN}
                                            Wait Until Element Is Visible    ${NUM_ONE}    15s
                                            Input Text    ${NUM_ONE}    ${FTP}
                                            Wait Until Element Is Visible    ${PEO_ONE}    15s
                                            Input Text    ${PEO_ONE}    ${NFP} 
                                            Wait Until Element Is Visible    ${PRA_TWO}    15s
                                            Input Text    ${PRA_TWO}    ${FCTN1}
                                            Wait Until Element Is Visible    ${NUM_TWO}    15s
                                            Input Text    ${NUM_TWO}    ${FTP1}
                                            Wait Until Element Is Visible    ${PEO_TWO}    15s
                                            Input Text    ${PEO_TWO}    ${NFP1}
                                            Swipe    0    800    0    100    1000
                                            Swipe    0    800    0    100    1000
                                            Wait Until Element Is Visible    ${PRA_ONE}    15s
                                            Input Text    ${PRA_ONE}    ${FCTN2}
                                            Wait Until Element Is Visible    ${NUM_ONE}    15s
                                            Input Text    ${NUM_ONE}    ${FTP2}
                                            Wait Until Element Is Visible    ${PEO_ONE}    15s
                                            Input Text    ${PEO_ONE}    ${NFP2}
                                            Wait Until Element Is Visible    ${PRA_TWO}    15s
                                            Input Text    ${PRA_TWO}    ${FCTN3}
                                            Wait Until Element Is Visible    ${NUM_TWO}    15s
                                            Input Text    ${NUM_TWO}    ${FTP3}
                                            Wait Until Element Is Visible    ${PEO_TWO}    15s
                                            Input Text    ${PEO_TWO}    ${NFP3}
                                        END
                                            # Sleep    1s
                                            Wait Until Element Is Visible    ${CO_PAW}    20s
                                            Click Element    ${CO_PAW}
                                            #Check Error 2
                                            Sleep    4s
                                            #Check Error 2
                                            ${is_vis3}=    Run Keyword And Return Status    Element Should Be Visible    ${alet_mes_path}
                                            Log To Console    ${is_vis3}
                                            IF  ${is_vis3} == True
                                                Wait Until Page Contains Element    ${alet_mes_path}
                                                ${ACTUAL_RESULT1}=    Get Text    ${alet_mes_path}

                                                IF    "${ACTUAL_RESULT1}" == "${EXP}"
                                                    Write Excel Cell    ${i}    30    value=${ACTUAL_RESULT1}    sheet_name=TestData
                                                    Write Excel Cell    ${i}    31    value=PASS    sheet_name=TestData
                                                    Write Excel Cell    ${i}    32    value=No Error    sheet_name=TestData
                                                ELSE
                                                    Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                                                    Write Excel Cell    ${i}    30    value=${ACTUAL_RESULT1}    sheet_name=TestData
                                                    Write Excel Cell    ${i}    31    value=FAIL    sheet_name=TestData
                                                    Write Excel Cell    ${i}    32    value=Error    sheet_name=TestData
                                                    Write Excel Cell    ${i}    33    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                                                END
                                                    Click Element    ${alet_ok}
                                                    Sleep    2s
                                                    ${AL}=    Run Keyword And Return Status    Element Should Be Visible    ${AL_CL}    15s
                                                    Log To Console    ${AL}
                                                    IF    ${AL} == True
                                                        Click Element    ${AL_CL}
                                                        Sleep    1s
                                                    END
                                                    Click Element    ${EXET}
                                                    Sleep    1s
                                            ELSE
                                                # Sleep    2s
                                                ${MEMBER1}    Set Variable    //*[@text='ผู้เข้าร่วม']
                                                Wait Until Element Is Visible    ${CHECC}    12s
                                                Click Element    ${CHECC}
                                                Sleep    2s
                                                ${is_vis4}=    Run Keyword And Return Status    Element Should Be Visible    ${MEMBER1}    20s
                                                Log To Console    ${is_vis4}
                                                
                                                IF    ${is_vis4} == True
                                                    # ${CHE}=    Run Keyword And Return Status    Element Should Be Visible    ${EVENT}    20s
                                                    # Log To Console    ${CHE}
                                                    # IF    ${CHE} == True
                                                    #     ${NAME_EVE}=    Get Text     ${EVENT}
                                                    #     Log To Console    ${NAME_EVE}
                                                    # END
                                                    ${EVENT}    Set Variable    //*[@text='${ENA}']
                                                    ${RESULT3}    Set Variable    -
                                                    ${RESULT}    Set Variable    -
                                                    FOR    ${C}    IN RANGE    5
                                                        Swipe    0    800    0    100    1000
                                                        ${CHECK1}=    Run Keyword And Return Status    Element Should Be Visible    ${EVENT}
                                                        Log To Console    ${CHECK1}
                                                        IF    ${CHECK1} == True
                                                        ${ACTUAL_RESULT2}    Get Text    ${EVENT}
                                                        Log To Console   ${ACTUAL_RESULT2}
                                                    
                                                        END
                                                    END
                                                        IF    '${ACTUAL_RESULT2}' == '${ENA}'
                                                            Write Excel Cell    ${i}    30    value=${RESULT}    sheet_name=TestData
                                                            Write Excel Cell    ${i}    31    value=PASS    sheet_name=TestData
                                                            Write Excel Cell    ${i}    32    value=No Error    sheet_name=TestData
                                                        ELSE IF    "${TF}" == "T"
                                                        Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                                                        Write Excel Cell    ${i}    30    value=${RESULT}    sheet_name=TestData
                                                        Write Excel Cell    ${i}    31    value=FAIL    sheet_name=TestData
                                                        Write Excel Cell    ${i}    32    value=Error : Data have not update    sheet_name=TestData
                                                        Write Excel Cell    ${i}    33    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                                                        ELSE IF    "${TF}" == "F"
                                                        Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                                                        Write Excel Cell    ${i}    30    value=${RESULT}    sheet_name=TestData
                                                        Write Excel Cell    ${i}    31    value=FAIL    sheet_name=TestData
                                                        Write Excel Cell    ${i}    32    value=Error : Not Found Alert Element    sheet_name=TestData
                                                        Write Excel Cell    ${i}    33    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                                                        END
                                                            ${AL}=    Run Keyword And Return Status    Element Should Be Visible    ${AL_CL}    15s
                                                            Log To Console    ${AL}
                                                            IF    ${AL} == True
                                                                Click Element    ${AL_CL}
                                                                Sleep    1s
                                                            END
                                                ELSE
                                                    ${ACTUAL_RESULT3}    Set Variable    -
                                                    IF    '${ACTUAL_RESULT3}' == '${EXP}'
                                                        Write Excel Cell    ${i}    30    value=${ACTUAL_RESULT3}    sheet_name=TestData
                                                        Write Excel Cell    ${i}    31    value=PASS    sheet_name=TestData
                                                        Write Excel Cell    ${i}    32    value=No Error    sheet_name=TestData
                                                    ELSE IF    "${TF}" == "T"
                                                        Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                                                        Write Excel Cell    ${i}    30    value=${ACTUAL_RESULT3}    sheet_name=TestData
                                                        Write Excel Cell    ${i}    31    value=FAIL    sheet_name=TestData
                                                        Write Excel Cell    ${i}    32    value=Error : Data have not update    sheet_name=TestData
                                                        Write Excel Cell    ${i}    33    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                                                    ELSE IF    "${TF}" == "F"
                                                        Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                                                        Write Excel Cell    ${i}    30    value=${ACTUAL_RESULT3}    sheet_name=TestData
                                                        Write Excel Cell    ${i}    31    value=FAIL    sheet_name=TestData
                                                        Write Excel Cell    ${i}    32    value=Error : Not Found Alert Element    sheet_name=TestData
                                                        Write Excel Cell    ${i}    33    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                                                    END
                                                    ${AL}=    Run Keyword And Return Status    Element Should Be Visible    ${AL_CL}    15s
                                                    Log To Console    ${AL}
                                                    IF    ${AL} == True
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
    

    Save Excel Document       C:/Users/MSI/Desktop/Test_Projact/Result/WriteExcel/TC06_Add_Event_Fishing_result.xlsx
    Close Application
    Sleep    2s
    Stop Video Recording      alias=None

*** Keywords ***
Open Test Application
  Open Application  http://localhost:4723/wd/hub  automationName=${ANDROID_AUTOMATION_NAME}
  ...  platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}
  ...  app=${ANDROID_APP}  appPackage=com.prohect_fishing   appActivity=.MainActivity



Click Login page
        Wait Until Element Is Visible    ${EXIT_MAIN_BTN_PATH}    15s
        Click Element    ${EXIT_MAIN_BTN_PATH}

        Wait Until Element Is Visible    ${INPUT_USER}    15s
        Input Text    ${INPUT_USER}    Tesf3
        Wait Until Element Is Visible    ${INPUT_PASS}    15s
        Input Text    ${INPUT_PASS}    1234
            
        Click Element    ${Candidatetype_SPN}
        Wait Until Page Contains Element    ${fishpond_owner}    15s
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

UPLOAD_PIX
    [Arguments]    ${APF}
    Sleep    4s
    IF    "${APF}" == "กาto1.png (2 MB)"
        #อัพโหลดรูปภาพ
        # Sleep    1s
        Wait Until Element Is Visible    ${IMG_BTN_PATH}    7s
        Click Element    ${IMG_BTN_PATH}
        # Sleep    3s
        Wait Until Element Is Visible    ${CL_IMGGRALLY}    7s
        Click Element    ${CL_IMGGRALLY}
        Wait Until Element Is Visible    ${CL_IMGGRALLY2}    7s
        Click Element    ${CL_IMGGRALLY2}
        # Sleep    3s
        Wait Until Element Is Visible    ${PHOTO1}    7s
        Click Element    ${PHOTO1}
    ELSE IF    "${APF}" == "1234.jpg"
        #อัพโหลดรูปภาพ
        # Sleep    1s
        Wait Until Element Is Visible    ${IMG_BTN_PATH}    7s
        Click Element    ${IMG_BTN_PATH}
        # Sleep    3s
        Wait Until Element Is Visible    ${CL_IMGGRALLY}    7s
        Click Element    ${CL_IMGGRALLY}
        Wait Until Element Is Visible    ${CL_IMGGRALLY2}    7s
        Click Element    ${CL_IMGGRALLY2}
        # Sleep    3s
        Wait Until Element Is Visible    ${PHOTO2}    5s
        Click Element    ${PHOTO2}
    ELSE IF    "${APF}" == "pao.jpeg"
        #อัพโหลดรูปภาพ
        # Sleep    1s
        Wait Until Element Is Visible    ${IMG_BTN_PATH}    7s
        Click Element    ${IMG_BTN_PATH}
        # Sleep    3s
        Wait Until Element Is Visible    ${CL_IMGGRALLY}    7s
        Click Element    ${CL_IMGGRALLY}
        Wait Until Element Is Visible    ${CL_IMGGRALLY2}    7s
        Click Element    ${CL_IMGGRALLY2}
        # Sleep    3s
        Wait Until Element Is Visible    ${PHOTO3}    5s
        Click Element    ${PHOTO3}
    ELSE IF    "${APF}" == "!@$#.jpg"
        #อัพโหลดรูปภาพ
        # Sleep    1s
        Wait Until Element Is Visible    ${IMG_BTN_PATH}    7s
        Click Element    ${IMG_BTN_PATH}
        # Sleep    3s
        Wait Until Element Is Visible    ${CL_IMGGRALLY}    7s
        Click Element    ${CL_IMGGRALLY}
        Wait Until Element Is Visible    ${CL_IMGGRALLY2}    7s
        Click Element    ${CL_IMGGRALLY2}
        # Sleep    3s
        Wait Until Element Is Visible    ${PHOTO4}    5s
        Click Element    ${PHOTO4}
    ELSE IF    "${APF}" == "Photo2.gif"
        #อัพโหลดรูปภาพ
        # Sleep    1s
        Wait Until Element Is Visible    ${IMG_BTN_PATH}    7s
        Click Element    ${IMG_BTN_PATH}
        # Sleep    3s
        Wait Until Element Is Visible    ${CL_IMGGRALLY}    7s
        Click Element    ${CL_IMGGRALLY}
        Wait Until Element Is Visible    ${CL_IMGGRALLY2}    7s
        Click Element    ${CL_IMGGRALLY2}
        # Sleep    3s
        Wait Until Element Is Visible    ${PHOTO5}    7s
        Click Element    ${PHOTO5}
    ELSE IF    "${APF}" == "Photo3.jpg (7 MB)"
        #อัพโหลดรูปภาพ
        # Sleep    1s
        Wait Until Element Is Visible    ${IMG_BTN_PATH}    7s
        Click Element    ${IMG_BTN_PATH}
        # Sleep    3s
        Wait Until Element Is Visible    ${CL_IMGGRALLY}    7s
        Click Element    ${CL_IMGGRALLY}
        Wait Until Element Is Visible    ${CL_IMGGRALLY2}    7s
        Click Element    ${CL_IMGGRALLY2}
        # Sleep    3s
        Wait Until Element Is Visible    ${PHOTO6}    5s
        Click Element    ${PHOTO6}
    ELSE IF    "${APF}" == "Photo4.png (4 MB)"
        #อัพโหลดรูปภาพ
        # Sleep    1s
        Wait Until Element Is Visible    ${IMG_BTN_PATH}    5s
        Click Element    ${IMG_BTN_PATH}
        # Sleep    3s
        Wait Until Element Is Visible    ${CL_IMGGRALLY}    7s
        Click Element    ${CL_IMGGRALLY}
        Wait Until Element Is Visible    ${CL_IMGGRALLY2}    7s
        Click Element    ${CL_IMGGRALLY2}
        # Sleep    3s
        Wait Until Element Is Visible    ${PHOTO7}    5s
        Click Element    ${PHOTO7}
    ELSE IF    "${APF}" == "Photo5.png (5 MB)"
        #อัพโหลดรูปภาพ
        # Sleep    1s
        Wait Until Element Is Visible    ${IMG_BTN_PATH}    7s
        Click Element    ${IMG_BTN_PATH}
        # Sleep    3s
        Wait Until Element Is Visible    ${CL_IMGGRALLY}    7s
        Click Element    ${CL_IMGGRALLY}
        Wait Until Element Is Visible    ${CL_IMGGRALLY2}    7s
        Click Element    ${CL_IMGGRALLY2}
        # Sleep    3s
        Wait Until Element Is Visible    ${PHOTO8}    5s
        Click Element    ${PHOTO8}
    ELSE IF    "${APF}" == "Photo6.png (6 MB)"
        #อัพโหลดรูปภาพ
        # Sleep    1s
        Wait Until Element Is Visible    ${IMG_BTN_PATH}    7s
        Click Element    ${IMG_BTN_PATH}
        # Sleep    3s
        Wait Until Element Is Visible    ${CL_IMGGRALLY}    7s
        Click Element    ${CL_IMGGRALLY}
        Wait Until Element Is Visible    ${CL_IMGGRALLY2}    7s
        Click Element    ${CL_IMGGRALLY2}
        # Sleep    3s
        Wait Until Element Is Visible    ${PHOTO9}    5s
        Click Element    ${PHOTO9}
    END
    # Sleep    2s