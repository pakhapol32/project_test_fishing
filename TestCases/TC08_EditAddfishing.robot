*** Settings ***
Library        AppiumLibrary
Library        ExcelLibrary
Library        Collections
Library        ScreenCapLibrary
Library        openpyxl
Resource    ../Resource/RS_AndroidConfiguration.robot
Resource    ../Resource/RS_TC08_EditAddfishing.robot
*** Variables ***
${excel_path}    C:/Users/MSI/Desktop/Test_Projact/TestData/TD08_Edit_Addfishing.xlsx
*** Test Cases ***
TC08_AddEventFishing
    #-----------------------------------------------ยังแก้ไม่หมด------------------------------------------------------------
    Start Video Recording   alias=None  name=C:/Users/MSI/Desktop/Test_Projact/Result/Video/TC08_Edit_Addfishing  fps=None    size_percentage=1   embed=True  embed_width=100px   monitor=1
    #--------------------------------------------------------------------------------------------------------------------
    Open Excel Document    ${excel_path}    doc_id=TestData
    ${excel}    Get Sheet   TestData

    Open Test Application

    Click Login page

    Sleep    3s

    Wait Until Page Contains Element    ${Datafish}
    Click Element    ${Datafish}

    FOR    ${i}    IN RANGE   2    ${excel.max_row+1}
       ${tcid}     Set Variable if    '${excel.cell(${i},1).value}'=='None'    ${Empty}     ${excel.cell(${i},1).value}
        Set Suite Variable   ${testcaseData}  ${tcid}
        ${EXE}    Set Variable if    '${excel.cell(${i},2).value}'=='None'    ${Empty}     ${excel.cell(${i},2).value}
        ${PNA}    Set Variable if    '${excel.cell(${i},3).value}'=='None'    ${Empty}     ${excel.cell(${i},3).value}
        ${LT}     Set Variable if    '${excel.cell(${i},4).value}'=='None'    ${Empty}     ${excel.cell(${i},4).value}
        ${Ltt}     Set Variable if    '${excel.cell(${i},5).value}'=='None'    ${Empty}     ${excel.cell(${i},5).value}
        ${DP}    Set Variable if    '${excel.cell(${i},6).value}'=='None'    ${Empty}     ${excel.cell(${i},6).value}
        ${PP}    Set Variable if    '${excel.cell(${i},7).value}'=='None'    ${Empty}     ${excel.cell(${i},7).value}
        ${BBAN}    Set Variable if    '${excel.cell(${i},8).value}'=='None'    ${Empty}     ${excel.cell(${i},8).value}
        ${EXP}    Set Variable if    '${excel.cell(${i},9).value}'=='None'    ${Empty}     ${excel.cell(${i},9).value}
        
      IF    "${EXE}" == "Y"
      
          Sleep    2s

          Wait Until Page Contains Element    ${CL_POU}
          Click Element    ${CL_POU}

          ${EE_XX}=    Run Keyword And Return Status    Element Should Be Visible    ${EX_XT1}    20s
          Log To Console    ${EE_XX}
          IF    ${EE_XX} == True
          Wait Until Page Contains Element    ${EX_XT1}
          Click Element    ${EX_XT1}
          END
            
          Sleep    2s
          Swipe    0    800    0    100    1000

          Sleep    2s
          Click Element    ${EDIT_POU}

          Sleep    2s
          Enter add Pond    ${PNA}    ${LT}    ${Ltt}    ${DP}    ${PP}    
            
          Sleep    2s
          Swipe    0    800    0    100    1000

          Sleep    2s
          Clear Text    ${๋ID_BANK}
          Sleep    1s
          Input Text    ${๋ID_BANK}    ${BBAN}

          Sleep    2s
          Click Element    ${ADD_Fish}
            
          Sleep    2s

          #Check Error
          ${is_vis}=    Run Keyword And Return Status    Element Should Be Visible    ${alet_mes_path}
          Log To Console    ${is_vis}
              IF    ${is_vis} == True
                Wait Until Page Contains Element    ${alet_mes_path}
                ${ACTUAL_RESULT}=    Get Text    ${alet_mes_path}
                    
                IF    "${ACTUAL_RESULT}" == "${EXP}"
                  Write Excel Cell    ${i}    10    value=${ACTUAL_RESULT}    sheet_name=TestData
                  Write Excel Cell    ${i}    11    value=PASS    sheet_name=TestData
                  Write Excel Cell    ${i}    12    value=No Error    sheet_name=TestData
                ELSE
                  Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                  Write Excel Cell    ${i}    10    value=${ACTUAL_RESULT}    sheet_name=TestData
                  Write Excel Cell    ${i}    11    value=FAIL    sheet_name=TestData
                  Write Excel Cell    ${i}    12    value=Error    sheet_name=TestData
                  Write Excel Cell    ${i}    13    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                END
                Click Element    ${alet_ok}
                  ${EE_XX}=    Run Keyword And Return Status    Element Should Be Visible    ${EX_XT1}    20s
                  Log To Console    ${EE_XX}
                  IF    ${EE_XX} == True
                  Wait Until Page Contains Element    ${EX_XT1}
                  Click Element    ${EX_XT1}
                  END
                    Sleep    2s
                    Click Element    ${EXET}
              ELSE
                  Sleep    3s
                  ${RESULT}    Set Variable    Not Found Alert Element
                  ${RESULT_1}    Set Variable    แก้ไขข้อมูลสำเร็จ
                  ${is_vis1}=    Run Keyword And Return Status    Element Should Be Visible    //*[@text='${PNA}']
                  Log To Console    ${is_vis1}
                  IF  ${is_vis1} == True
                      Wait Until Page Contains Element    //*[@text='${PNA}']
                      ${ACTUAL_RESULT}=    Get Text    //*[@text='${PNA}']
                    
                    IF    "${ACTUAL_RESULT}" == "${PNA}"
                      Write Excel Cell    ${i}    10    value=${RESULT}    sheet_name=TestData
                      Write Excel Cell    ${i}    11    value=PASS    sheet_name=TestData
                      Write Excel Cell    ${i}    12    value=No Error    sheet_name=TestData
                    ELSE
                      Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                      Write Excel Cell    ${i}    10    value=${RESULT}    sheet_name=TestData
                      Write Excel Cell    ${i}    11    value=FAIL    sheet_name=TestData
                      Write Excel Cell    ${i}    12    value=Error    sheet_name=TestData
                      Write Excel Cell    ${i}    13    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                    END
                        Sleep    2s
                        ${EE_XX}=    Run Keyword And Return Status    Element Should Be Visible    ${EX_XT1}    20s
                        Log To Console    ${EE_XX}
                        IF    ${EE_XX} == True
                        Wait Until Page Contains Element    ${EX_XT1}
                        Click Element    ${EX_XT1}
                        END
                  ELSE
                    ${ACTUAL_RESULT1}=    Set Variable    Not Found Alert Element
                    IF    "${ACTUAL_RESULT1}" == "${EXP}"
                      Write Excel Cell    ${i}    10    value=${ACTUAL_RESULT1}    sheet_name=TestData
                      Write Excel Cell    ${i}    11    value=PASS    sheet_name=TestData
                      Write Excel Cell    ${i}    12    value=No Error    sheet_name=TestData
                    ELSE
                      Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                      Write Excel Cell    ${i}    10    value=${ACTUAL_RESULT1}    sheet_name=TestData
                      Write Excel Cell    ${i}    11    value=FAIL    sheet_name=TestData
                      Write Excel Cell    ${i}    12    value=Error    sheet_name=TestData
                      Write Excel Cell    ${i}    13    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
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
            
      END
        
    END
    Save Excel Document       C:/Users/MSI/Desktop/Test_Projact/Result/WriteExcel/TC08_EditAddfishing_result.xlsx
    Sleep    2s
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
        Input Text    ${INPUT_USER}    Tesf1
        Wait Until Page Contains Element    ${INPUT_PASS}
        Input Text    ${INPUT_PASS}    1234
            
        Click Element    ${Candidatetype_SPN}
        Wait Until Page Contains Element    ${fishpond_owner}
        Click Element    ${fishpond_owner}

        #กดปุ่มตกลง
        Click Element    ${CL_Submit}

Enter add Pond
      [Arguments]   ${PNA}    ${LT}    ${Ltt}    ${DP}    ${PP}
      Sleep    1s
      Clear Text    ${name_poud}
      Sleep    1s
      Input Text    ${name_poud}    ${PNA}
      Sleep    1s
      Clear Text    ${Latijud}
      Sleep    1s
      Input Text    ${Latijud}    ${LT}
      Sleep    1s
      Clear Text    ${Longtijud}
      Sleep    1s
      Input Text    ${Longtijud}    ${Ltt}
      Sleep    1s
      Clear Text    ${detail}
      Sleep    1s
      Input Text    ${detail}    ${DP}
      Sleep    1s
      Clear Text    ${location}
      Sleep    1s
      Input Text    ${location}    ${PP}