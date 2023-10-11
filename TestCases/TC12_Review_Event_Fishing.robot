*** Settings ***
Library  AppiumLibrary
Library  ExcelLibrary
Library    Collections
Library    ScreenCapLibrary
Library        openpyxl
Resource    ../Resource/RS_AndroidConfiguration.robot
Resource    ../Resource/RS_TC12_Review_Event_Fishing.robot
*** Variables ***
${excel_path}    C:/Users/MSI/Desktop/Test_Projact/TestData/TC12_Review_Event_Fishing.xlsx

*** Test Cases ***
TC12_Review_Event_Fishing
    Start Video Recording   alias=None  name=C:/Users/MSI/Desktop/Test_Projact/Result/Video/TC12_Review_Event_Fishing fps=None    size_percentage=1   embed=True  embed_width=100px   monitor=1
    Open Excel Document    ${excel_path}    doc_id=TestData
    ${excel}    Get Sheet   TestData
    Open Test Application

    Click Login page

    Wait Until Page Contains Element    ${DaTA_POMENU}    20s
    Click Element    ${DaTA_POMENU}
    
    #ล็อคอิน
    FOR    ${i}    IN RANGE   2    ${excel.max_row+1}
        ${tcid}     Set Variable if    '${excel.cell(${i},1).value}'=='None'    ${Empty}     ${excel.cell(${i},1).value}
        Set Suite Variable   ${testcaseData}  ${tcid}
        ${EXE}    Set Variable if    '${excel.cell(${i},2).value}'=='None'    ${Empty}     ${excel.cell(${i},2).value}
        ${NUM}    Set Variable if    '${excel.cell(${i},3).value}'=='None'    ${Empty}     ${excel.cell(${i},3).value}
        ${Star}    Set Variable If    '${excel.cell(${i},4).value}'=='None'    ${Empty}     ${excel.cell(${i},4).value}
        ${CENT1}    Set Variable If    '${excel.cell(${i},5).value}'=='None'    ${Empty}     ${excel.cell(${i},5).value}
        ${EXP}    Set Variable if    '${excel.cell(${i},6).value}'=='None'    ${Empty}     ${excel.cell(${i},6).value}

        IF    '${EXE}' == 'Y'

            Sleep    3s

            ${is_vis1}=    Run Keyword And Return Status    Element Should Be Visible    ${ER_YL}    20s
            Log To Console    ${is_vis1}
            IF  ${is_vis1} == False
                Wait Until Page Contains Element    ${ER_YL}    20s
                Click Element    ${ER_YL}
            END

            Wait Until Page Contains Element    ${JoinPoun}    20s
            Click Element    ${JoinPoun}

            CL_NUM_POYN    ${NUM}    ${Star}    ${CENT1}

            Wait Until Page Contains Element    ${SUPMIT_COM}    20s
            Click Element    ${SUPMIT_COM}
            
            Sleep    2s

            ${is_vis3}=    Run Keyword And Return Status    Element Should Be Visible    ${TETEXX}    20s
            Log To Console    ${is_vis3}
                IF  ${is_vis3} == True
                    ${ACTUAL_RESULT}    Set Variable    Not Found Alert Element
                    IF    "${ACTUAL_RESULT}" == "${EXP}"
                        Write Excel Cell    ${i}    7    value=${ACTUAL_RESULT}      sheet_name=TestData
                        Write Excel Cell    ${i}    8    value=PASS    sheet_name=TestData
                        Write Excel Cell    ${i}    9    value=No Error    sheet_name=TestData
                    ELSE
                        Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png 
                        Write Excel Cell    ${i}    7    value=${ACTUAL_RESULT}    sheet_name=TestData
                        Write Excel Cell    ${i}    8    value=FAIL    sheet_name=TestData
                        Write Excel Cell    ${i}    9    value=Error    sheet_name=TestData
                        Write Excel Cell    ${i}    10    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData  
                    END

                    Sleep    2s
                    Wait Until Page Contains Element    ${KAKA}    20s
                    Click Element    ${KAKA}

                    Sleep    2s
                    Click Element At Coordinates    56    97

                ELSE
                    Sleep    2s
                    Click Element At Coordinates    56    97

                    Wait Until Page Contains Element    ${ORDER}    20s
                    Click Element    ${ORDER}
                    
                    ${COM1}    Set Variable    //*[@text='${CENT1}']

                    ${is_vis2}=    Run Keyword And Return Status    Element Should Be Visible    ${COM1}    20s
                    Log To Console    ${is_vis2}
                    IF    ${is_vis2} == True
                    ${ACTUAL_RESULT2}    Get Text    ${COM1}
                    ELSE
                    ${ACTUAL_RESULT2}    Set Variable    Not Found Alert Element NOup
                    END

                    IF    '${ACTUAL_RESULT2}' == '${CENT1}'
                        Write Excel Cell    ${i}    7    value=${ACTUAL_RESULT2}    sheet_name=TestData
                        Write Excel Cell    ${i}    8    value=PASS    sheet_name=TestData
                        Write Excel Cell    ${i}    9    value=No Error    sheet_name=TestData
                    ELSE
                        Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                        Write Excel Cell    ${i}    7    value=${ACTUAL_RESULT2}    sheet_name=TestData
                        Write Excel Cell    ${i}    8    value=FAIL    sheet_name=TestData
                        Write Excel Cell    ${i}    9    value=Error    sheet_name=TestData
                        Write Excel Cell    ${i}    10    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                    END

                    Sleep    2s
                    Click Element At Coordinates    56    97
                
                END
        
        END
    END

    Save Excel Document       C:/Users/MSI/Desktop/Test_Projact/Result/WriteExcel/TC12_Review_Event_Fishing_result.xlsx
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

CL_NUM_POYN
    [Arguments]    ${NUM}    ${Star}    ${COMENT}
    # IF  '${NUM}' == '1'
    # Sleep    1s
    # Wait Until Page Contains Element    ${CL_COM1}    20s
    # Sleep    2s
    # Click Element At Coordinates    826    1500
    # Click Element    ${CL_COM1}
    # Wait Until Page Contains Element    ${CL2_COM1}    20s
    # Click Element    ${CL2_COM1}
    # Wait Until Page Contains Element    ${Star_IN1}    20s
    # Click Element    ${Star_IN1}
    # Wait Until Page Contains Element    ${INPUT_COM}    20s
    # Input Text    ${INPUT_COM}    ${COMENT}
    

    # ELSE IF  '${NUM}' == '2'
    # Sleep    2s
    # Click Element At Coordinates    826    1500
    # Sleep    1s
    # Wait Until Page Contains Element    ${CL_COM2}    20s
    # Click Element    ${CL_COM2}
    # Wait Until Page Contains Element    ${CL2_COM1}    20s
    # Click Element    ${CL2_COM1}
    # Wait Until Page Contains Element    ${Star_IN2}    20s
    # Click Element    ${Star_IN2}
    # Wait Until Page Contains Element    ${INPUT_COM}    20s
    # Input Text    ${INPUT_COM}    ${COMENT}

    # ELSE IF  '${NUM}' == '3'
    # Sleep    2s
    # Click Element At Coordinates    826    1500
    # Sleep    1s
    # Wait Until Page Contains Element    ${CL_COM3}    20s
    # Click Element   ${CL_COM3}
    # Wait Until Page Contains Element    ${CL2_COM1}    20s
    # Click Element    ${CL2_COM1}
    # Wait Until Page Contains Element    ${Star_IN3}    20s
    # Click Element    ${Star_IN3}
    # Wait Until Page Contains Element    ${INPUT_COM}    20s
    # Input Text    ${INPUT_COM}    ${COMENT}

    # ELSE IF  '${NUM}' == '4'
    # Sleep    2s
    # Click Element At Coordinates    826    1500
    # Sleep    1s
    # Wait Until Page Contains Element    ${CL_COM4}    20s
    # Click Element    ${CL_COM4}
    # Wait Until Page Contains Element    ${CL2_COM1}    20s
    # Click Element    ${CL2_COM1}
    # Wait Until Page Contains Element    ${Star_IN4}    20s
    # Click Element    ${Star_IN4}
    # Wait Until Page Contains Element    ${INPUT_COM}    20s
    # Input Text    ${INPUT_COM}    ${COMENT}

    # ELSE IF  '${NUM}' == '5'
    # Sleep    2s
    # Click Element At Coordinates    826    1500
    # Sleep    1s
    # Wait Until Page Contains Element    ${CL_COM5}    20s
    # Click Element    ${CL_COM5}
    # Wait Until Page Contains Element    ${CL2_COM1}    20s
    # Click Element    ${CL2_COM1}
    # Wait Until Page Contains Element    ${Star_IN5}    20s
    # Click Element    ${Star_IN5}
    # Wait Until Page Contains Element    ${INPUT_COM}    20s
    # Input Text    ${INPUT_COM}    ${COMENT}

    # ELSE IF  '${NUM}' == '6'
    # Sleep    2s
    # Click Element At Coordinates    826    1500
    # Sleep    1s
    # Wait Until Page Contains Element    ${CL_COM6}    20s
    # Click Element    ${CL_COM6}
    # Wait Until Page Contains Element    ${CL2_COM1}    20s
    # Click Element    ${CL2_COM1}
    # Wait Until Page Contains Element    ${INPUT_COM}    20s
    # Input Text    ${INPUT_COM}    ${COMENT}

    # ELSE IF  '${NUM}' == '7'
    # Swipe    0    800    0    100    1000
    # Sleep    2s
    # Click Element At Coordinates    826    1500
    # Sleep    1s
    # Wait Until Page Contains Element    ${CL_COM7}    20s
    # Click Element    ${CL_COM7}
    # Wait Until Page Contains Element    ${CL2_COM1}    20s
    # Click Element    ${CL2_COM1}
    # Wait Until Page Contains Element    ${Star_IN5}    20s
    # Click Element    ${Star_IN5}
    # Wait Until Page Contains Element    ${INPUT_COM}    20s
    # Input Text    ${INPUT_COM}    ${COMENT}

    # IF  '${NUM}' == '8'
    # Sleep    1s
    # Wait Until Page Contains Element    ${CL_COM1}    20s
    # Sleep    2s
    # Click Element At Coordinates    826    1500
    # Click Element    ${CL_COM1}
    # Wait Until Page Contains Element    ${CL2_COM1}    20s
    # Click Element    ${CL2_COM1}
    # Wait Until Page Contains Element    ${Star_IN1}    20s
    # Click Element    ${Star_IN1}
    # Wait Until Page Contains Element    ${INPUT_COM}    20s
    # Input Text    ${INPUT_COM}    ${COMENT}

    # ELSE IF  '${NUM}' == '9'
    # Sleep    2s
    # Click Element At Coordinates    826    1500
    # Sleep    1s
    # Wait Until Page Contains Element    ${CL_COM2}    20s
    # Click Element    ${CL_COM2}
    # Wait Until Page Contains Element    ${CL2_COM1}    20s
    # Click Element    ${CL2_COM1}
    # Wait Until Page Contains Element    ${Star_IN2}    20s
    # Click Element    ${Star_IN2}
    # Wait Until Page Contains Element    ${INPUT_COM}    20s
    # Input Text    ${INPUT_COM}    ${COMENT}

    # ELSE IF  '${NUM}' == '10'
    # Sleep    2s
    # Click Element At Coordinates    826    1500
    # Sleep    1s
    # Wait Until Page Contains Element    ${CL_COM3}    20s
    # Click Element   ${CL_COM3}
    # Wait Until Page Contains Element    ${CL2_COM1}    20s
    # Click Element    ${CL2_COM1}
    # Wait Until Page Contains Element    ${Star_IN3}    20s
    # Click Element    ${Star_IN3}
    # Wait Until Page Contains Element    ${INPUT_COM}    20s
    # Input Text    ${INPUT_COM}    ${COMENT}

    # ELSE IF  '${NUM}' == '11'
    # Sleep    2s
    # Click Element At Coordinates    826    1500
    # Sleep    1s
    # Wait Until Page Contains Element    ${CL_COM4}    20s
    # Click Element    ${CL_COM4}
    # Wait Until Page Contains Element    ${CL2_COM1}    20s
    # Click Element    ${CL2_COM1}
    # Wait Until Page Contains Element    ${Star_IN4}    20s
    # Click Element    ${Star_IN4}
    # Wait Until Page Contains Element    ${INPUT_COM}    20s
    # Input Text    ${INPUT_COM}    ${COMENT}

    # ELSE IF  '${NUM}' == '12'
    # Sleep    2s
    # Click Element At Coordinates    826    1500
    # Sleep    1s
    # Wait Until Page Contains Element    ${CL_COM5}    20s
    # Click Element    ${CL_COM5}
    # Wait Until Page Contains Element    ${CL2_COM1}    20s
    # Click Element    ${CL2_COM1}
    # Wait Until Page Contains Element    ${Star_IN5}    20s
    # Click Element    ${Star_IN5}
    # Wait Until Page Contains Element    ${INPUT_COM}    20s
    # Input Text    ${INPUT_COM}    ${COMENT}

    # ELSE IF  '${NUM}' == '13'
    # Sleep    2s
    # Click Element At Coordinates    826    1500
    # Sleep    1s
    # Wait Until Page Contains Element    ${CL_COM6}    20s
    # Click Element    ${CL_COM6}
    # Wait Until Page Contains Element    ${CL2_COM1}    20s
    # Click Element    ${CL2_COM1}
    # Wait Until Page Contains Element    ${INPUT_COM}    20s
    # Input Text    ${INPUT_COM}    ${COMENT}

    # ELSE IF  '${NUM}' == '14'
    # Swipe    0    800    0    100    1000
    # Sleep    2s
    # Click Element At Coordinates    826    1500
    # Sleep    1s
    # Wait Until Page Contains Element    ${CL_COM7}    20s
    # Click Element    ${CL_COM7}
    # Wait Until Page Contains Element    ${CL2_COM1}    20s
    # Click Element    ${CL2_COM1}
    # Wait Until Page Contains Element    ${Star_IN5}    20s
    # Click Element    ${Star_IN5}
    # Wait Until Page Contains Element    ${INPUT_COM}    20s
    # Input Text    ${INPUT_COM}    ${COMENT}

    IF  '${NUM}' == '15'
    Sleep    1s
    Wait Until Page Contains Element    ${CL_COM1}    20s
    Sleep    2s
    Click Element At Coordinates    826    1500
    Click Element    ${CL_COM1}
    Wait Until Page Contains Element    ${CL2_COM1}    20s
    Click Element    ${CL2_COM1}
    Wait Until Page Contains Element    ${Star_IN1}    20s
    Click Element    ${Star_IN1}
    Wait Until Page Contains Element    ${INPUT_COM}    20s
    Input Text    ${INPUT_COM}    ${COMENT}
    
    END
    