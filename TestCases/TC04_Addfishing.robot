*** Settings ***
Library  AppiumLibrary
Library  ExcelLibrary
Library    Collections
Library    ScreenCapLibrary
Library        openpyxl
Resource    ../Resource/RS_AndroidConfiguration.robot
Resource    ../Resource/RS_TC04_Addfishing.robot
*** Variables ***
${excel_path}    C:/Users/MSI/Desktop/Test_Projact/TestData/TC04_Addfishing.xlsx

*** Test Cases ***
TC04_Addfishing

    Start Video Recording   alias=None  name=C:/Users/MSI/Desktop/Test_Projact/Result/Video/TC04_Addfishing  fps=None    size_percentage=1   embed=True  embed_width=100px   monitor=1

    Open Excel Document    ${excel_path}    doc_id=TestData
    ${excel}    Get Sheet   TestData

    #Open App (เปิดแอพ)
    Open Test Application
            
    Click Login page

    Sleep    3s

    Wait Until Page Contains Element    ${Datafish}
    Click Element    ${Datafish}

    FOR    ${i}    IN RANGE   2    ${excel.max_row+1}


        ${tcid}     Set Variable if    '${excel.cell(${i},1).value}'=='None'    ${Empty}     ${excel.cell(${i},1).value}
        Set Suite Variable   ${testcaseData}  ${tcid}
        ${EXE}    Set Variable if    '${excel.cell(${i},2).value}'=='None'    ${Empty}     ${excel.cell(${i},2).value}
        ${TF}    Set Variable if    '${excel.cell(${i},3).value}'=='None'    ${Empty}     ${excel.cell(${i},3).value}
        ${PNA}    Set Variable if    '${excel.cell(${i},4).value}'=='None'    ${Empty}     ${excel.cell(${i},4).value}
        ${LT}     Set Variable if    '${excel.cell(${i},5).value}'=='None'    ${Empty}     ${excel.cell(${i},5).value}
        ${Ltt}     Set Variable if    '${excel.cell(${i},6).value}'=='None'    ${Empty}     ${excel.cell(${i},6).value}
        ${DP}    Set Variable if    '${excel.cell(${i},7).value}'=='None'    ${Empty}     ${excel.cell(${i},7).value}
        ${PP}    Set Variable if    '${excel.cell(${i},8).value}'=='None'    ${Empty}     ${excel.cell(${i},8).value}
        ${BBAN}    Set Variable if    '${excel.cell(${i},9).value}'=='None'    ${Empty}     ${excel.cell(${i},9).value}
        ${EXP}    Set Variable if    '${excel.cell(${i},10).value}'=='None'    ${Empty}     ${excel.cell(${i},10).value}

        IF    "${EXE}" == "Y"
            Sleep    2s

            Wait Until Page Contains Element    ${IMG_plus}
            Click Element    ${IMG_plus}

            Sleep    3s

            Enter add Pond    ${PNA}    ${LT}    ${Ltt}    ${DP}    ${PP}    

            Swipe    0    800    0    100    1000
            Input Text    ${๋ID_BANK}    ${BBAN}

            Click Element    ${ADD_Fish}
            
            Sleep    2s

            ${EE_XX}=    Run Keyword And Return Status    Element Should Be Visible    ${EX_XT1}    20s
            Log To Console    ${EE_XX}
            IF    ${EE_XX} == True
            Wait Until Page Contains Element    ${EX_XT1}
            Click Element    ${EX_XT1}
            END

            Sleep    2s

            #Check Error
            IF    "${TF}" == "T"
                Sleep    2s
                ${is_vis}=    Run Keyword And Return Status    Element Should Be Visible    ${alet_mes_path}    20s
                Log To Console    ${is_vis}
                IF    ${is_vis} == True
                    Sleep    1s
                    Wait Until Page Contains Element    ${alet_mes_path}
                    ${ACTUAL_RESULT1}=    Get Text    ${alet_mes_path}
                    
                    IF    "${ACTUAL_RESULT1}" == "${EXP}"
                        Write Excel Cell    ${i}    11    value=${ACTUAL_RESULT1}    sheet_name=TestData
                        Write Excel Cell    ${i}    12    value=PASS    sheet_name=TestData
                        Write Excel Cell    ${i}    13    value=No Error    sheet_name=TestData
                    ELSE
                        Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                        Write Excel Cell    ${i}    11    value=${ACTUAL_RESULT1}    sheet_name=TestData
                        Write Excel Cell    ${i}    12    value=FAIL    sheet_name=TestData
                        Write Excel Cell    ${i}    13    value=Error    sheet_name=TestData
                        Write Excel Cell    ${i}    14    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                    END
                    Click Element    ${alet_ok}
                    Sleep    2s
                        ${EE_XX}=    Run Keyword And Return Status    Element Should Be Visible    ${EX_XT1}    20s
                        Log To Console    ${EE_XX}
                        IF    ${EE_XX} == True
                        Wait Until Page Contains Element    ${EX_XT1}
                        Click Element    ${EX_XT1}
                        END
                            Click Element    ${EXET}
                ELSE
                    Sleep    2s
                    # set ค่า
                    ${TexT_COM}    Set Variable    //*[@text=${PNA}]
                    # หา Element ${Datafish}
                    ${COMPLES}=    Run Keyword And Return Status    Element Should Be Visible    ${Datafish}    20s
                    IF     ${COMPLES} == True
                        ${RESULT}    Set Variable    //*[@text="ไม่พบข้อมูล"]
                        ${RESULT1}    get Text   ${RESULT}
                        Sleep    2s
                        # FOR    ${C}    IN RANGE    5
                            # หา Element ${TexT_COM} ที่ set มาแล้ว
                            ${TexT_COM}    Set Variable    //*[@text='${PNA}']
                            Log To Console    ${TexT_COM}
                            ${COMPLES1}=    Run Keyword And Return Status    Element Should Be Visible    ${TexT_COM}    20s
                            Log To Console    ${COMPLES1}
                            IF    ${COMPLES1} == True
                                ${RESULT}    Set Variable    //*[@text="ไม่พบข้อมูล"]
                                ${RESULT1}    get Text   ${RESULT} 
                                ${ACTUAL_RESULT1}    Get Text    ${TexT_COM}
                                Log To Console   ${ACTUAL_RESULT1} 
                                IF    "${ACTUAL_RESULT1}" == "${PNA}"
                                    Write Excel Cell    ${i}    11    value=${RESULT1}    sheet_name=TestData
                                    Write Excel Cell    ${i}    12    value=PASS    sheet_name=TestData
                                    Write Excel Cell    ${i}    13    value=No Error    sheet_name=TestData
                                ELSE
                                    Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                                    Write Excel Cell    ${i}    11    value=${RESULT1}    sheet_name=TestData
                                    Write Excel Cell    ${i}    12    value=FAIL    sheet_name=TestData
                                    Write Excel Cell    ${i}    13    value=Error : Data have not update    sheet_name=TestData
                                    Write Excel Cell    ${i}    14    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                                END
                            ELSE
                                ${RESULT}    Set Variable    //*[@text="ไม่พบข้อมูล"]
                                ${RESULT1}    get Text   ${RESULT} 
                                FOR    ${C}    IN RANGE    5
                                    Swipe    0    800    0    100    1000
                                    ${CHECK1}=    Run Keyword And Return Status    Element Should Be Visible    ${TexT_COM}    20s
                                    Log To Console    ${CHECK1}
                                    IF    ${CHECK1} == True
                                    ${ACTUAL_RESULT1}    Get Text    ${TexT_COM}
                                    Log To Console   ${ACTUAL_RESULT1}
                                    ELSE
                                        ${ACTUAL_RESULT1}    Set Variable    Not Element
                                    END
                                        IF    "${ACTUAL_RESULT1}" == "${PNA}"
                                            Write Excel Cell    ${i}    11    value=${RESULT1}    sheet_name=TestData
                                            Write Excel Cell    ${i}    12    value=PASS    sheet_name=TestData
                                            Write Excel Cell    ${i}    13    value=No Error    sheet_name=TestData
                                        END
                                END
                                Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                                Write Excel Cell    ${i}    11    value=${RESULT1}    sheet_name=TestData
                                Write Excel Cell    ${i}    12    value=FAIL    sheet_name=TestData
                                Write Excel Cell    ${i}    13    value=Error : Data have not update    sheet_name=TestData
                                Write Excel Cell    ${i}    14    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                            END
                    ELSE
                        Sleep    2s
                        ${RESULT}    Set Variable    //*[@text="ไม่พบข้อมูล"]
                        ${RESULT1}    get Text   ${RESULT} 
                        ${EE_XX}=    Run Keyword And Return Status    Element Should Be Visible    ${EX_XT1}    20s
                        Log To Console    ${EE_XX}
                        IF    ${EE_XX} == True
                        Wait Until Page Contains Element    ${EX_XT1}
                        Click Element    ${EX_XT1}
                        END
                        Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                        Write Excel Cell    ${i}    11    value=${RESULT1}    sheet_name=TestData
                        Write Excel Cell    ${i}    12    value=FAIL    sheet_name=TestData
                        Write Excel Cell    ${i}    13    value=Error    sheet_name=TestData
                        Write Excel Cell    ${i}    14    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                        Sleep    1s
                        Click Element    ${EXET}
                    END
                END
            ELSE
                Sleep    1s
                ${is_vis}=    Run Keyword And Return Status    Element Should Be Visible    ${alet_mes_path}    20s
                Log To Console    ${is_vis}
                IF    ${is_vis} == True
                    Wait Until Page Contains Element    ${alet_mes_path}
                    ${ACTUAL_RESULT1}=    Get Text    ${alet_mes_path}
                    
                    IF    "${ACTUAL_RESULT1}" == "${EXP}"
                        Write Excel Cell    ${i}    11    value=${ACTUAL_RESULT1}    sheet_name=TestData
                        Write Excel Cell    ${i}    12    value=PASS    sheet_name=TestData
                        Write Excel Cell    ${i}    13    value=No Error    sheet_name=TestData
                    ELSE
                        Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                        Write Excel Cell    ${i}    11    value=${ACTUAL_RESULT1}    sheet_name=TestData
                        Write Excel Cell    ${i}    12    value=FAIL    sheet_name=TestData
                        Write Excel Cell    ${i}    13    value=Error    sheet_name=TestData
                        Write Excel Cell    ${i}    14    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                    END
                    Click Element    ${alet_ok}
                    Sleep    2s
                    ${EE_XX}=    Run Keyword And Return Status    Element Should Be Visible    ${EX_XT1}    20s
                        Log To Console    ${EE_XX}
                        IF    ${EE_XX} == True
                        Wait Until Page Contains Element    ${EX_XT1}
                        Click Element    ${EX_XT1}
                        END
                            Click Element    ${EXET}
                ELSE
                    Sleep    2s
                    # หา Element ${Datafish}
                    ${COMPLES}=    Run Keyword And Return Status    Element Should Be Visible    ${Datafish}    20s
                    Log To Console    ${COMPLES}
                    IF     ${COMPLES} == True
                        ${RESULT}    Set Variable    //*[@text="ไม่พบข้อมูล"]
                        ${RESULT1}    get Text   ${RESULT}
                        Sleep    2s
                        # FOR    ${C}    IN RANGE    5
                            # หา Element ${TexT_COM} ที่ set มาแล้ว
                            ${TexT_COM}    Set Variable    //*[@text='${PNA}']
                            Log To Console    ${TexT_COM}
                            ${COMPLES1}=    Run Keyword And Return Status    Element Should Be Visible    ${TexT_COM}    20s
                            Log To Console    ${COMPLES1}
                            IF    ${COMPLES1} == True
                                ${RESULT}    Set Variable    //*[@text="ไม่พบข้อมูล"]
                                ${RESULT1}    get Text   ${RESULT} 
                                ${ACTUAL_RESULT1}    Get Text    ${TexT_COM}
                                Log To Console   ${ACTUAL_RESULT1} 
                                IF    "${ACTUAL_RESULT1}" == "${PNA}"
                                    Write Excel Cell    ${i}    11    value=${RESULT1}    sheet_name=TestData
                                    Write Excel Cell    ${i}    12    value=PASS    sheet_name=TestData
                                    Write Excel Cell    ${i}    13    value=No Error    sheet_name=TestData
                                ELSE
                                    Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                                    Write Excel Cell    ${i}    11    value=${RESULT1}    sheet_name=TestData
                                    Write Excel Cell    ${i}    12    value=FAIL    sheet_name=TestData
                                    Write Excel Cell    ${i}    13    value=Error    sheet_name=TestData
                                    Write Excel Cell    ${i}    14    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                                END
                            ELSE
                                ${RESULT}    Set Variable    //*[@text="ไม่พบข้อมูล"]
                                ${RESULT1}    get Text   ${RESULT} 
                                FOR    ${C}    IN RANGE    5
                                    Swipe    0    800    0    100    1000
                                    ${CHECK1}=    Run Keyword And Return Status    Element Should Be Visible    ${TexT_COM}    20s
                                    Log To Console    ${CHECK1}
                                    IF    ${CHECK1} == True
                                    ${ACTUAL_RESULT1}    Get Text    ${TexT_COM}
                                    Log To Console   ${ACTUAL_RESULT1}
                                    ELSE
                                        ${ACTUAL_RESULT1}    Set Variable    Not Element
                                    END
                                        IF    "${ACTUAL_RESULT1}" == "${PNA}"
                                            Write Excel Cell    ${i}    11    value=${RESULT1}    sheet_name=TestData
                                            Write Excel Cell    ${i}    12    value=PASS    sheet_name=TestData
                                            Write Excel Cell    ${i}    13    value=No Error    sheet_name=TestData
                                        END
                                END
                                Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                                Write Excel Cell    ${i}    11    value=${RESULT1}    sheet_name=TestData
                                Write Excel Cell    ${i}    12    value=FAIL    sheet_name=TestData
                                Write Excel Cell    ${i}    13    value=Error    sheet_name=TestData
                                Write Excel Cell    ${i}    14    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                            END
                        # END
                    ELSE
                        Sleep    2s
                        # ${RESULT}    Set Variable    //*[@text="ไม่พบข้อมูล"]
                        # ${RESULT1}    get Text   ${RESULT}
                        ${RESULT2}    Set Variable    -
                        ${EE_XX}=    Run Keyword And Return Status    Element Should Be Visible    ${EX_XT1}    20s
                        Log To Console    ${EE_XX}
                        IF    ${EE_XX} == True
                        Wait Until Page Contains Element    ${EX_XT1}
                        Click Element    ${EX_XT1}
                        END
                        Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                        Write Excel Cell    ${i}    11    value=${RESULT2}    sheet_name=TestData
                        Write Excel Cell    ${i}    12    value=FAIL    sheet_name=TestData
                        Write Excel Cell    ${i}    13    value=Error    sheet_name=TestData
                        Write Excel Cell    ${i}    14    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                        Sleep    1s
                        Click Element    ${EXET}
                    END
                END
            END

        
        END
    
    END

    Save Excel Document       C:/Users/MSI/Desktop/Test_Projact/Result/WriteExcel/TC04_Addfishing_result.xlsx
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
        Input Text    ${INPUT_USER}    TestF02
        Wait Until Page Contains Element    ${INPUT_PASS}
        Input Text    ${INPUT_PASS}    1234
            
        Click Element    ${Candidatetype_SPN}
        Wait Until Page Contains Element    ${fishpond_owner}
        Click Element    ${fishpond_owner}

        #กดปุ่มตกลง
        Click Element    ${CL_Submit}
        

#กรอกข้อมูลบ้อตกปลา
Enter add Pond
      [Arguments]   ${PNA}    ${LT}    ${Ltt}    ${DP}    ${PP}
      Input Text    ${name_poud}    ${PNA}
      Input Text    ${Latijud}    ${LT}
      Input Text    ${Longtijud}    ${Ltt}
      Input Text    ${detail}    ${DP}
      Input Text    ${location}    ${PP}



      
    

  
