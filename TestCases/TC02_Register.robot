*** Settings ***
Library        AppiumLibrary
Library        ExcelLibrary
Library        Collections
Library        ScreenCapLibrary
Library        openpyxl
Library        ../Scripts/SelectDay.py
Resource       ../Resource/RS_AndroidConfiguration.robot
Resource       ../Resource/RS_TC02_Register.robot
*** Variables ***
${excel_path}    C:/Users/MSI/Desktop/Test_Projact/TestData/TC02_Register.xlsx
#    ของอีกหน้าจอ 
#    ${IMGGFF}    xpath=//android.view.ViewGroup[@content-desc="Photo taken on Jan 1, 1970 2:44:59 PM"]
*** Test Cases ***
TC02_REGISTER
    #---------------------------------------------------------------------------------------------------------------------
    Start Video Recording   alias=None  name=C:/Users/MSI/Desktop/Test_Projact/Result/Video/TC02_Register    fps=None    size_percentage=1   embed=True  embed_width=100px   monitor=1
    #--------------------------------------------------------------------------------------------------------------------
    Open Excel Document    ${excel_path}    doc_id=TestData
    ${excel}    Get Sheet   TestData

    #Open App (เปิดแอพ) แบบไม่ปิด
    # Open Test Application

    # Wait Until Page Contains Element    ${EXIT_MAIN_BTN_PATH}    15s
    # Click Element    ${EXIT_MAIN_BTN_PATH}

    FOR    ${i}    IN RANGE   2    ${excel.max_row+1}

        ${tcid}     Set Variable if    '${excel.cell(${i},1).value}'=='None'    ${Empty}     ${excel.cell(${i},1).value}
        Set Suite Variable   ${testcaseData}  ${tcid}
        ${EXE}    Set Variable if    '${excel.cell(${i},2).value}'=='None'    ${Empty}     ${excel.cell(${i},2).value}
        ${TE}    Set Variable if    '${excel.cell(${i},3).value}'=='None'    ${Empty}     ${excel.cell(${i},3).value}
        ${ap}     Set Variable if    '${excel.cell(${i},4).value}'=='None'    ${Empty}     ${excel.cell(${i},4).value}
        ${tfu}     Set Variable if    '${excel.cell(${i},5).value}'=='None'    ${Empty}     ${excel.cell(${i},5).value}
        ${icn}    Set Variable if    '${excel.cell(${i},6).value}'=='None'    ${Empty}     ${excel.cell(${i},6).value}
        ${name}    Set Variable if    '${excel.cell(${i},7).value}'=='None'    ${Empty}     ${excel.cell(${i},7).value}
        ${sur}    Set Variable if    '${excel.cell(${i},8).value}'=='None'    ${Empty}     ${excel.cell(${i},8).value}
        ${pn}    Set Variable if    '${excel.cell(${i},9).value}'=='None'    ${Empty}     ${excel.cell(${i},9).value}
        ${day1}    Set Variable if    '${excel.cell(${i},10).value}'=='None'    ${Empty}     ${excel.cell(${i},10).value}
        ${email}    Set Variable if    '${excel.cell(${i},11).value}'=='None'    ${Empty}     ${excel.cell(${i},11).value}
        ${adrs}    Set Variable if    '${excel.cell(${i},12).value}'=='None'    ${Empty}     ${excel.cell(${i},12).value}
        ${user}    Set Variable if    '${excel.cell(${i},13).value}'=='None'    ${Empty}     ${excel.cell(${i},13).value}
        ${pasw}    Set Variable if    '${excel.cell(${i},14).value}'=='None'    ${Empty}     ${excel.cell(${i},14).value}
        ${EXP}    Set Variable if    '${excel.cell(${i},15).value}'=='None'    ${Empty}     ${excel.cell(${i},15).value}

        IF    "${EXE}" == "Y"
            #--------------------------------------------------------------------------------------------------------#
            #--------------------------------------------------------------------------------------------------------#
            #Open App (เปิดแอพ) แบบปิด
            #--------------------------------------------------------------------------------------------------------#
            #--------------------------------------------------------------------------------------------------------#
            Open Test Application

            Wait Until Element Is Visible    ${EXIT_MAIN_BTN_PATH}    1m
            Click Element    ${EXIT_MAIN_BTN_PATH}

            # Sleep    5s
            #--------------------------------------------------------------------------------------------------------#
            #--------------------------------------------------------------------------------------------------------#
            #Open App (เปิดแอพ) แบบไม่ปิด 1
            #--------------------------------------------------------------------------------------------------------#
            #--------------------------------------------------------------------------------------------------------#
            Sleep    3s
            ${ERD}=    Run Keyword And Return Status    Element Should Be Visible    ${CANCLL1}    20s
            Log To Console    ${ERD}
            IF    ${ERD} == True
                Wait Until Page Contains Element    ${CANCLL1}    20s
                Click Element    ${CANCLL1}
                Sleep    1s
                Click Element At Coordinates    250    1475
                Sleep    2s
            END

            # Sleep    3s
        
            Wait Until Element Is Visible    ${REGISTER_BTN_PATH}    1m
            Click Element    ${REGISTER_BTN_PATH}
        
            Sleep    3s
            
            ${DARED}=    Run Keyword And Return Status    Element Should Be Visible    ${ERRED}    20s
            Log To Console    ${DARED}
            IF    ${DARED} == True
                ${REDX}    Set Variable    RedCode
                Sleep    2s

                Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png 
                Write Excel Cell    ${i}    17    value=FAIL    sheet_name=TestData
                Write Excel Cell    ${i}    16    value=${REDX}    sheet_name=TestData
                Write Excel Cell    ${i}    18    value=Error    sheet_name=TestData
                Write Excel Cell    ${i}    19    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData

                Sleep    1s

                Wait Until Page Contains Element    ${ERRED}    20s
                Click Element    ${ERRED}

                Sleep    1s

                Close Application

                Sleep    1s

                Open Test Application

                Sleep    1s

                Wait Until Page Contains Element    ${EXIT_MAIN_BTN_PATH}    15s
                Click Element    ${EXIT_MAIN_BTN_PATH}
            ELSE

                UPLOAD_PIX    ${ap}

                #เลือกประเภทการสมัคร
                Sleep    3s
                Wait Until Element Is Visible    ${Candidatetype_SPN}    20s
                Click Element    ${Candidatetype_SPN}
                IF    "${tfu}" == "ผู้เข้าร่วมตกปลา"
                    # Sleep    2s
                    Wait Until Page Contains Element    ${fishing_participant}    20s
                    Click Element    ${fishing_participant}
                ELSE IF    "${tfu}" == "เจ้าของบ่อตกปลา"
                    # Sleep    2s
                    Wait Until Page Contains Element    ${fishpond_owner}    20s
                    Click Element    ${fishpond_owner}
                END

                #กรอก 1
                Sleep    2s
                Enter Register Page    ${icn}    ${name}    ${sur}    ${pn}    ${email}    ${adrs}    ${user}    ${pasw}
            
                Sleep    2s
                IF  '${day1}' != ''
                    #วันเกิด
                    #เช็คปีเดือนปัจจุบัน
                    Click Element    ${CLICK_DATE}
                    Wait Until Element Is Visible    ${HEADER_YEAR}
                    ${CURR_YEAR}    Get Text    ${HEADER_YEAR}
                    ${CURR_DATE}    Get Text    ${HEADER_DATE}
                    Click Element    ${HEADER_YEAR}
                    ${DATE_TARGET_ARRAY}=    Split Str By Slash    ${day1}
                    ${TARGET_DAY}=    Set Variable    ${DATE_TARGET_ARRAY}[0]
                    ${TARGET_MONTH}=    Set Variable    ${DATE_TARGET_ARRAY}[1]
                    ${TARGET_YEAR}=    Set Variable    ${DATE_TARGET_ARRAY}[2]

                    FOR    ${j}  IN RANGE    100
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
                                END
                                Exit For Loop If    ${str} == ${flag}
                                ${FIRST_ELEM}=    Set Variable    ${elements}[0]
                                ${TEXT_OF_FIRST}=    Get Text    ${FIRST_ELEM} 
                                IF    ${TEXT_OF_FIRST} < ${TARGET_YEAR}
                                    Swipe By Percent    50    65    50    35    1000
                                ELSE IF    ${TEXT_OF_FIRST} > ${TARGET_YEAR}
                                    Swipe By Percent    50    35    50    65    1000
                                END
                            END

                            FOR  ${i}  IN RANGE    100
                                ${content_desc}=    Get Element Attribute    ${MONTH_AND_YEAR}    content-desc
                                ${res_content_desc}=    Split Month And Date    ${content_desc}
                                ${date}=    Set Variable    ${res_content_desc}[0]
                                ${month}=    Set Variable    ${res_content_desc}[1]
                                ${num_month}=    Convert Month To Number    ${month}
                                ${INT_TARGET_MONTH}=    Str To Int    ${TARGET_MONTH}
                                IF    ${num_month} > ${INT_TARGET_MONTH}
                                    Click Element    ${PREV_BTN}
                                ELSE IF    ${num_month} < ${INT_TARGET_MONTH}
                                    Click Element    ${NEXT_BTN}
                                ELSE
                                    ${days}    Get Webelements    ${DAY_LIST}
                                    FOR    ${day}    IN    @{days}
                                        ${day_content_desc}=    Get Element Attribute    ${day}    content-desc
                                        ${day_content_desc_arr}=    Split Str By Space    ${day_content_desc}
                                        ${real_day}=    Set Variable    ${day_content_desc_arr}[0]
                                        ${num_day}=    Str To Int    ${real_day}
                                        ${TARGET_DAY_INT}=    Str To Int    ${TARGET_DAY}
                                        IF    ${num_day} == ${TARGET_DAY_INT}
                                            Click Element    ${day}
                                            Exit For Loop
                                        END
                                    END
                                    Exit For Loop
                                END
                            END

                            Wait Until Element Is Visible    ${OK_YEAR_BTN}
                            Click Element    ${OK_YEAR_BTN}
                            Sleep    1s
                    
                END

                Swipe    0    800    0    100    1000
                Wait Until Element Is Visible    ${INPUT_EMAIL}    20s
                Input Text    ${INPUT_EMAIL}    ${email}
                Wait Until Element Is Visible    ${INPUT_ADR}    20s
                Input Text    ${INPUT_ADR}    ${adrs}
                Swipe    0    800    0    100    1000
                Wait Until Element Is Visible    ${INPUT_USER}    20s
                Input Text    ${INPUT_USER}    ${user}
                Wait Until Element Is Visible    ${INPUT_PASS}    20s
                Input Text    ${INPUT_PASS}    ${pasw}

                Sleep    2s

                ${DARED1}=    Run Keyword And Return Status    Element Should Be Visible    ${ERRED}    20s
                Log To Console    ${DARED1}
                IF    ${DARED1} == True
                    ${REDX}    Set Variable    RedCode
                    Sleep    2s

                    Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png 
                    Write Excel Cell    ${i}    16    value=FAIL    sheet_name=TestData
                    Write Excel Cell    ${i}    17    value=${REDX}    sheet_name=TestData
                    Write Excel Cell    ${i}    18    value=Error    sheet_name=TestData
                    Write Excel Cell    ${i}    19    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData

                    Sleep    1s

                    Wait Until Element Is Visible   ${ERRED}    20s
                    Click Element    ${ERRED}

                    Sleep    1s

                    Close Application

                    Sleep    1s

                    Open Test Application

                    Sleep    1s

                    Wait Until Element Is Visible    ${EXIT_MAIN_BTN_PATH}    15s
                    Click Element    ${EXIT_MAIN_BTN_PATH}

                END

                # กดปุ่มยืนยันการสมัคร
                Wait Until Element Is Visible    ${BTN_SUMMIT}    20s
                Click Element    ${BTN_SUMMIT}


                
                
                Wait Until Page Contains Element    //*[@class="android.widget.Toast"]    30s

                ${condition}=    Run Keyword And Return Status    Element Should Be Visible    //*[@class="android.widget.Toast"]    10s
                
                IF    ${condition} == True
                    ${Tou}    Set Variable    //*[@class="android.widget.Toast"]
                    ${Tou20}    Get Text    ${Tou}
                    ${POADAS}    Set Variable    ใช่
                    Log To Console    ${POADAS}
                    Log To Console    ${Tou20}
                END

                Sleep    6s

                ${KOK1}=    Run Keyword And Return Status    Element Should Be Visible    ${BTN_SUMMIT}    10s
                Log To Console    ${KOK1}
                IF    ${KOK1} == True
                Sleep    1s
                Wait Until Page Contains Element    ${BTN_SUMMIT}    20s
                Click Element    ${BTN_SUMMIT}
                Sleep    6s
                END

                Sleep    1s

                ${DARED2}=    Run Keyword And Return Status    Element Should Be Visible    ${ERRED}    20s
                Log To Console    ${DARED2}
                IF    ${DARED2} == True
                    ${REDX}    Set Variable    RedCode
                    Sleep    2s

                    Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png 
                    Write Excel Cell    ${i}    17    value=FAIL    sheet_name=TestData
                    Write Excel Cell    ${i}    16    value=${REDX}    sheet_name=TestData
                    Write Excel Cell    ${i}    18    value=Error    sheet_name=TestData
                    Write Excel Cell    ${i}    19    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData

                    Sleep    1s

                    Wait Until Page Contains Element    ${ERRED}    20s
                    Click Element    ${ERRED}

                    Sleep    1s

                    Close Application

                    Sleep    1s

                    Open Test Application

                    Sleep    1s

                    Wait Until Page Contains Element    ${EXIT_MAIN_BTN_PATH}    15s
                    Click Element    ${EXIT_MAIN_BTN_PATH}

                END

                

                IF    "${TE}" == "T"
                    Sleep    6s
                    ${is_vis1}=    Run Keyword And Return Status    Element Should Be Visible    ${COMP}    30s
                    Log To Console    ${is_vis1}
                    IF  ${is_vis1} == True
                        ${Alet}    Set Variable    Register Success
                        IF    "${EXP}" == "${Alet}"
                            Write Excel Cell    ${i}    17    value=PASS    sheet_name=TestData
                            Write Excel Cell    ${i}    16    value=${Alet}    sheet_name=TestData
                            Write Excel Cell    ${i}    18    value=No Error    sheet_name=TestData
                        ELSE
                            Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png 
                            Write Excel Cell    ${i}    16    value=${Alet}    sheet_name=TestData
                            Write Excel Cell    ${i}    17    value=FAIL    sheet_name=TestData
                            Write Excel Cell    ${i}    18    value=Error    sheet_name=TestData
                            Write Excel Cell    ${i}    19    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                        END
                    ELSE
                        Wait Until Page Contains Element    ${alet_mes_path}    20s
                        ${ACTUAL_RESULT}=    Get Text    ${alet_mes_path}
                                        
                        IF    "${ACTUAL_RESULT}" == "${EXP}"
                            Write Excel Cell    ${i}    16    value=PASS    sheet_name=TestData
                            Write Excel Cell    ${i}    17    value=${ACTUAL_RESULT}    sheet_name=TestData
                            Write Excel Cell    ${i}    18    value=No Error    sheet_name=TestData
                        ELSE
                            Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png 
                            Write Excel Cell    ${i}    17    value=FAIL    sheet_name=TestData
                            Write Excel Cell    ${i}    16    value=${ACTUAL_RESULT}    sheet_name=TestData
                            Write Excel Cell    ${i}    18    value=Error    sheet_name=TestData
                            Write Excel Cell    ${i}    19    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                        END
                        Wait Until Page Contains Element    ${alet_ok}    20s
                        Click Element    ${alet_ok}
                    END
                ELSE    # TF == F
                    Sleep    6s
                    ${is_vis2}=    Run Keyword And Return Status    Element Should Be Visible    ${COMP}    30s
                    Log To Console    ${is_vis2}
                    IF  ${is_vis2} == True
                        ${Alet}    Set Variable    Register Success
                        IF    "${EXP}" == "${Alet}"
                            Write Excel Cell    ${i}    17    value=PASS    sheet_name=TestData
                            Write Excel Cell    ${i}    16    value=${Alet}    sheet_name=TestData
                            Write Excel Cell    ${i}    18    value=No Error    sheet_name=TestData
                        ELSE
                            Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png 
                            Write Excel Cell    ${i}    16    value=${Alet}    sheet_name=TestData
                            Write Excel Cell    ${i}    17    value=FAIL    sheet_name=TestData
                            Write Excel Cell    ${i}    18    value=Error    sheet_name=TestData
                            Write Excel Cell    ${i}    19    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                        END
                        ${is_vis3}=    Run Keyword And Return Status    Element Should Be Visible    ${AL_CL}
                        IF  ${is_vis3} == True
                            Wait Until Page Contains Element    ${AL_CL}    20s
                            Click Element    ${AL_CL}
                        END
                    ELSE
                        # Wait Until Page Contains Element    ${alet_mes_path}    6s
                        # ${is_vis1}=    Run Keyword And Return Status    Element Should Be Visible    ${alet_mes_path}
                        # IF    ${is_vis1} == True
                            Wait Until Page Contains Element    ${alet_mes_path}    20s
                            ${ACTUAL_RESULT}=    Get Text    ${alet_mes_path}
                            IF    "${ACTUAL_RESULT}" == "${EXP}"
                                Write Excel Cell    ${i}    17    value=PASS    sheet_name=TestData
                                Write Excel Cell    ${i}    16    value=${ACTUAL_RESULT}    sheet_name=TestData
                                Write Excel Cell    ${i}    18    value=No Error    sheet_name=TestData
                            ELSE
                                Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png 
                                Write Excel Cell    ${i}    17    value=FAIL    sheet_name=TestData
                                Write Excel Cell    ${i}    16    value=${ACTUAL_RESULT}    sheet_name=TestData
                                Write Excel Cell    ${i}    18    value=Error    sheet_name=TestData
                                Write Excel Cell    ${i}    19    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                                
                            END
                            Wait Until Page Contains Element    ${alet_ok}    20s
                            Click Element    ${alet_ok}
                                    ${is_vis4}=    Run Keyword And Return Status    Element Should Be Visible    ${AL_CL}
                                IF  ${is_vis4} == True
                                    Wait Until Page Contains Element    ${AL_CL}    20s
                                    Click Element    ${AL_CL}
                                END
                                    

                    END
                END
            END
            #--------------------------------------------------------------------------------------------------------#
            #--------------------------------------------------------------------------------------------------------#
            # เช็คแบบปิด
            #--------------------------------------------------------------------------------------------------------#
            #--------------------------------------------------------------------------------------------------------#
            Sleep    2s
            Close Application

        END
    END
    
    #--------------------------------------------------------------------------------------------------------#
    #--------------------------------------------------------------------------------------------------------#
    # เช็คแบบเปิด
    #--------------------------------------------------------------------------------------------------------#
    #--------------------------------------------------------------------------------------------------------#
    # Sleep    2s
    # Close Application
    Save Excel Document       C:/Users/MSI/Desktop/Test_Projact/Result/WriteExcel/TC02_Register_result.xlsx
    Stop Video Recording      alias=None

*** Keywords ***
Open Test Application
  Open Application  http://localhost:4723/wd/hub  automationName=${ANDROID_AUTOMATION_NAME}
  ...  platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}
  ...  app=${ANDROID_APP}  appPackage=com.prohect_fishing   appActivity=.MainActivity
   

Enter Register Page
      [Arguments]   ${icn}    ${name}    ${sur}    ${pn}    ${email}    ${adrs}    ${user}    ${pasw}
      Wait Until Element Is Visible    ${INPUT_TEXT_ID}    1m
      Input Text    ${INPUT_TEXT_ID}    ${icn}
      Wait Until Element Is Visible    ${INPUT_TEXT_NAME}    1m
      Input Text    ${INPUT_TEXT_NAME}    ${name}
      Wait Until Element Is Visible    ${INPUT_TEXT_LASENAME}    1m
      Input Text    ${INPUT_TEXT_LASENAME}    ${sur}
      Wait Until Element Is Visible    ${INPUT_TEXT_TALL}    1m
      Input Text    ${INPUT_TEXT_TALL}    ${pn}


# Chiise Pic Profile
#     [Arguments]    ${ap}

Submit_Admin
    Wait Until Element Is Visible    ${INPUT_USERR}    1m
    Input Text    ${INPUT_USERR}    admin
    Wait Until Element Is Visible    ${INPUT_PASSS}    1m
    Input Text    ${INPUT_PASSS}    1234

    Click Element    ${Candidatetype_SPN}
    Wait Until Element Is Visible    ${fishing_participant}    1m
    Click Element    ${fishing_participant}

    #กดปุ่มตกลง
    Wait Until Element Is Visible    ${CL_Submit}    1m
    Click Element    ${CL_Submit}

UPLOAD_PIX
    [Arguments]    ${ap}
    Sleep    3s
    IF    "${ap}" == "กาto1.png(2 MB)"
        #อัพโหลดรูปภาพ
        Wait Until Element Is Visible   ${IMG_BTN_PATH}    1m
        Click Element    ${IMG_BTN_PATH}
        # Sleep    3s
        Wait Until Element Is Visible    ${CL_IMGGRALLY}    1m
        Click Element    ${CL_IMGGRALLY}
        Wait Until Element Is Visible    ${CL_IMGGRALLY2}    1m
        Click Element    ${CL_IMGGRALLY2}
        # Sleep    3s
        Wait Until Element Is Visible   ${PHOTO1}    1m
        Click Element    ${PHOTO1}
    ELSE IF    "${ap}" == "1234.jpg"
        #อัพโหลดรูปภาพ
        Wait Until Page Contains Element    ${IMG_BTN_PATH}    1m
        Click Element    ${IMG_BTN_PATH}
        # Sleep    3s
        Wait Until Page Contains Element    ${CL_IMGGRALLY}    1m
        Click Element    ${CL_IMGGRALLY}
        Wait Until Element Is Visible     ${CL_IMGGRALLY2}    1m
        Click Element    ${CL_IMGGRALLY2}
        # Sleep    3s
        Wait Until Element Is Visible     ${PHOTO2}    1m
        Click Element    ${PHOTO2}
    ELSE IF    "${ap}" == "pao.jpeg"
        #อัพโหลดรูปภาพ
        Wait Until Element Is Visible     ${IMG_BTN_PATH}    1m
        Click Element    ${IMG_BTN_PATH}
        # Sleep    3s
        Wait Until Element Is Visible     ${CL_IMGGRALLY}    1m
        Click Element    ${CL_IMGGRALLY}
        Wait Until Element Is Visible     ${CL_IMGGRALLY2}    1m
        Click Element    ${CL_IMGGRALLY2}
        # Sleep    3s
        Wait Until Element Is Visible     ${PHOTO3}    1m
        Click Element    ${PHOTO3}
    ELSE IF    "${ap}" == "!@$#.jpg"
        #อัพโหลดรูปภาพ
        Wait Until Element Is Visible    ${IMG_BTN_PATH}    1m
        Click Element    ${IMG_BTN_PATH}
        # Sleep    3s
        Wait Until Element Is Visible    ${CL_IMGGRALLY}    1m
        Click Element    ${CL_IMGGRALLY}
        Wait Until Element Is Visible    ${CL_IMGGRALLY2}    1m
        Click Element    ${CL_IMGGRALLY2}
        # Sleep    3s
        Wait Until Page Contains Element    ${PHOTO4}    1m
        Click Element    ${PHOTO4}
    ELSE IF    "${ap}" == "Photo2.gif"
        #อัพโหลดรูปภาพ
        Wait Until Element Is Visible    ${IMG_BTN_PATH}    1m
        Click Element    ${IMG_BTN_PATH}
        # Sleep    3s
        Wait Until Element Is Visible    ${CL_IMGGRALLY}    1m
        Click Element    ${CL_IMGGRALLY}
        Wait Until Element Is Visible    ${CL_IMGGRALLY2}   1m
        Click Element    ${CL_IMGGRALLY2}
        # Sleep    3s
        Wait Until Element Is Visible    ${PHOTO5}    1m
        Click Element    ${PHOTO5}
    ELSE IF    "${ap}" == "Photo3.jpg (7 MB)"
        #อัพโหลดรูปภาพ
        Wait Until Element Is Visible    ${IMG_BTN_PATH}    1m
        Click Element    ${IMG_BTN_PATH}
        # Sleep    3s
        Wait Until Element Is Visible    ${CL_IMGGRALLY}    1m
        Click Element    ${CL_IMGGRALLY}
        Wait Until Element Is Visible    ${CL_IMGGRALLY2}    1m
        Click Element    ${CL_IMGGRALLY2}
        # Sleep    3s
        Wait Until Element Is Visible    ${PHOTO6}    1m
        Click Element    ${PHOTO6}
    ELSE IF    "${ap}" == "Photo4.png (4 MB)"
        #อัพโหลดรูปภาพ
        Wait Until Element Is Visible    ${IMG_BTN_PATH}    1m
        Click Element    ${IMG_BTN_PATH}
        # Sleep    3s
        Wait Until Element Is Visible    ${CL_IMGGRALLY}    1m
        Click Element    ${CL_IMGGRALLY}
        Wait Until Element Is Visible    ${CL_IMGGRALLY2}    1m
        Click Element    ${CL_IMGGRALLY2}
        # Sleep    3s
        Wait Until Element Is Visible    ${PHOTO7}    1m
        Click Element    ${PHOTO7}
    ELSE IF    "${ap}" == "Photo5.png (5 Mb)"
        #อัพโหลดรูปภาพ
        Wait Until Element Is Visible    ${IMG_BTN_PATH}    1m
        Click Element    ${IMG_BTN_PATH}
        # Sleep    3s
        Wait Until Element Is Visible    ${CL_IMGGRALLY}    1m
        Click Element    ${CL_IMGGRALLY}
        Wait Until Element Is Visible    ${CL_IMGGRALLY2}    1m
        Click Element    ${CL_IMGGRALLY2}
        # Sleep    3s
        Wait Until Element Is Visible    ${PHOTO8}    1m
        Click Element    ${PHOTO8}
    ELSE IF    "${ap}" == "Photo6.png (6 MB)"
        #อัพโหลดรูปภาพ
        Wait Until Element Is Visible    ${IMG_BTN_PATH}    1m
        Click Element    ${IMG_BTN_PATH}
        # Sleep    3s
        Wait Until Element Is Visible    ${CL_IMGGRALLY}    1m
        Click Element    ${CL_IMGGRALLY}
        Wait Until Element Is Visible    ${CL_IMGGRALLY2}    1m
        Click Element    ${CL_IMGGRALLY2}
        # Sleep    3s
        Wait Until Element Is Visible    ${PHOTO9}    1m
        Click Element    ${PHOTO9}
    END
    Sleep    2s

    

        



