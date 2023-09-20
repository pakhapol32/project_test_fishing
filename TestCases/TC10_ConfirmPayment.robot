*** Settings ***
Library  AppiumLibrary
Library  ExcelLibrary
Library    Collections
Library    ScreenCapLibrary
Library        openpyxl
Resource    ../Resource/RS_AndroidConfiguration.robot
Resource    ../Resource/RS_TC010_ConfirmPayment.robot
*** Variables ***
${excel_path}    C:/Users/MSI/Desktop/Test_Projact/TestData/TD10_Confirm_Payment.xlsx

*** Test Cases ***
TC10_ConfirmPayment

    Start Video Recording   alias=None  name=C:/Users/MSI/Desktop/Test_Projact/Result/Video/TC10_ConfirmPayment  fps=None    size_percentage=1   embed=True  embed_width=100px   monitor=1

    Open Excel Document    ${excel_path}    doc_id=TestData
    ${excel}    Get Sheet   TestData
    Open Test Application
    #ล็อคอิน
    Click Login page

    # คลิก เมนู
    Wait Until Page Contains Element    ${DaTA_POMENU}    20s
    Click Element    ${DaTA_POMENU}

      FOR    ${i}    IN RANGE   2    ${excel.max_row+1}
        ${tcid}     Set Variable if    '${excel.cell(${i},1).value}'=='None'    ${Empty}     ${excel.cell(${i},1).value}
        Set Suite Variable   ${testcaseData}  ${tcid}
        ${EXE}    Set Variable if    '${excel.cell(${i},2).value}'=='None'    ${Empty}     ${excel.cell(${i},2).value}
        ${POU}    Set Variable If    '${excel.cell(${i},3).value}'=='None'    ${Empty}     ${excel.cell(${i},3).value}
        ${NAME_PO}    Set Variable if    '${excel.cell(${i},4).value}'=='None'    ${Empty}     ${excel.cell(${i},4).value}
        ${IMG}    Set Variable if    '${excel.cell(${i},5).value}'=='None'    ${Empty}     ${excel.cell(${i},5).value}
        ${EXP}    Set Variable if    '${excel.cell(${i},6).value}'=='None'    ${Empty}     ${excel.cell(${i},6).value}

        IF    "${EXE}" == "Y"

            # คลิกประวัติการลงทะเบียน
            Wait Until Page Contains Element    ${CL_HIS}    20s
            Click Element    ${CL_HIS}

            Sleep    2s
            Click Element At Coordinates    826    1500
            
            Sleep    3s
            # คลิกรูปภาพ
            CL_IMGREG    ${POU}

            Wait Until Page Contains Element    ${UP_IMG_PAY}    20s
            Click Element    ${UP_IMG_PAY}

            UPLOAD_PIX    ${IMG}

            Wait Until Page Contains Element    ${UPLOAD_IMG}    20s
            Click Element    ${UPLOAD_IMG}

            Sleep    5s

            ${LA1}=    Run Keyword And Return Status    Element Should Be Visible    ${Fis1}    20s
            Log To Console    ${LA1}

            IF  ${LA1} == True

                Sleep    3s

                # Wait Until Page Contains Element    ${FPAS1}    20s
                # Click Element    ${FPAS1}
                # คลิกปุ่มออก
                Click Element At Coordinates    56    97

                Wait Until Page Contains Element    ${CL_HIS1}    20s
                Click Element    ${CL_HIS1}

                ${NAME_POUN}    Set Variable    //*[@text='${NAME_PO}']

                Sleep    8s

                ${LA3}=    Run Keyword And Return Status    Element Should Be Visible    ${NAME_POUN}    20s
                Log To Console    ${LA3}
                IF    ${LA3} == True
                    Wait Until Page Contains Element     ${NAME_POUN}
                    ${ACTUAL_RESULT}=    Get Text     ${NAME_POUN}
                ELSE
                    ${ACTUAL_RESULT}    Set Variable    Not Found Alert Element (NoUp)  
                END
                IF    '${ACTUAL_RESULT}' == '${NAME_PO}'
                    Write Excel Cell    ${i}    7    value=${ACTUAL_RESULT}    sheet_name=TestData
                    Write Excel Cell    ${i}    8    value=PASS    sheet_name=TestData
                    Write Excel Cell    ${i}    9    value=No Error    sheet_name=TestData
                ELSE
                    Write Excel Cell    ${i}    7    value=${ACTUAL_RESULT}    sheet_name=TestData
                    Write Excel Cell    ${i}    8    value=FAIL    sheet_name=TestData
                    Write Excel Cell    ${i}    9    value=Error    sheet_name=TestData
                    Write Excel Cell    ${i}    10    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                    Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                END

                Sleep    4s

                # Wait Until Page Contains Element    ${FPAS1}    20s
                # Click Element    ${FPAS1}
                # คลิกปุ่มออก
                Click Element At Coordinates    56    97

            ELSE
                Sleep    2s
                Click Element At Coordinates    56    97
                Sleep    3s
                Wait Until Page Contains Element     ${INFO_KAK_BAd}
                ${ACTUAL_RESULT1}    Set Variable    Not Found Alert Element

                IF    "${ACTUAL_RESULT1}" == "${EXP}"
                    Write Excel Cell    ${i}    7    value=${ACTUAL_RESULT1}    sheet_name=TestData
                    Write Excel Cell    ${i}    8    value=PASS    sheet_name=TestData
                    Write Excel Cell    ${i}    9    value=No Error    sheet_name=TestData
                ELSE
                    Capture Page Screenshot    ${EXECDIR}/Result/Screenshot/${testcaseData}.png
                    Write Excel Cell    ${i}    7    value=${ACTUAL_RESULT1}    sheet_name=TestData
                    Write Excel Cell    ${i}    8    value=FAIL    sheet_name=TestData
                    Write Excel Cell    ${i}    9    value=Error    sheet_name=TestData
                    Write Excel Cell    ${i}    10    value=ควรแจ้งให้ผู้ใช้งานว่า : ${EXP}    sheet_name=TestData
                END
                ${LA4}=    Run Keyword And Return Status    Element Should Be Visible    ${KAK_BAD}    20s
                Log To Console    ${LA4}
                IF    ${LA4} == True
                    Wait Until Page Contains Element    ${KAK_BAD}
                    Click Element    ${KAK_BAD}
                END
                Sleep    2s
                Click Element At Coordinates    655    300
                Sleep    4s
                # Wait Until Page Contains Element    ${FPAS1}    20s
                # Click Element    ${FPAS1}
                # คลิกปุ่มออก
                Click Element At Coordinates    56    97
            END
        END
    END

    Save Excel Document       C:/Users/MSI/Desktop/Test_Projact/Result/WriteExcel/TC10_ConfirmPayment_result.xlsx
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

        Wait Until Page Contains Element    ${INPUT_USER}    20s
        Input Text    ${INPUT_USER}    Test1
        Wait Until Page Contains Element    ${INPUT_PASS}    20s
        Input Text    ${INPUT_PASS}    1234
            
        Click Element    ${Candidatetype_SPN}
        Wait Until Page Contains Element    ${fishing_participant}    20s
        Click Element    ${fishing_participant}

        #กดปุ่มตกลง
        Click Element    ${CL_Submit}

Click Login Pow page
        Sleep    3s
        Click Element    ${EX_APP}
        Sleep    3s
        Wait Until Page Contains Element    ${EXIT_MAIN_BTN_PATH}    15s
        Click Element    ${EXIT_MAIN_BTN_PATH}

        Wait Until Page Contains Element    ${INPUT_USER}    20s
        Input Text    ${INPUT_USER}    Tesf1
        Wait Until Page Contains Element    ${INPUT_PASS}    20s
        Input Text    ${INPUT_PASS}    1234
            
        Click Element    ${Candidatetype_SPN}
        Wait Until Page Contains Element    ${fishpond_owner}    20s
        Click Element    ${fishpond_owner}

        #กดปุ่มตกลง
        Click Element    ${CL_Submit}

UPLOAD_PIX
    [Arguments]    ${IMG}
    Sleep    3s
    IF    '${IMG}' != ''
        IF    "${IMG}" == "กาto2.png"
            Sleep    2s
            #อัพโหลดรูปภาพ
            Wait Until Page Contains Element    ${UP_PAY1}    20s
            Click Element    ${UP_PAY1}
            Sleep    3s
            Wait Until Page Contains Element    ${CL_IMGGRALLY}    20s
            Click Element    ${CL_IMGGRALLY}
            Wait Until Page Contains Element    ${CL_IMGGRALLY2}    20s
            Click Element    ${CL_IMGGRALLY2}
            Sleep    3s
            Wait Until Page Contains Element    ${PHOTO4}    20s
            Click Element    ${PHOTO4}
        ELSE IF    "${IMG}" == "!@$#.jpg"
            #อัพโหลดรูปภาพ
            Wait Until Page Contains Element    ${UP_PAY1}    20s
            Click Element    ${UP_PAY1}
            Sleep    3s
            Wait Until Page Contains Element    ${CL_IMGGRALLY}    20s
            Click Element    ${CL_IMGGRALLY}
            Wait Until Page Contains Element    ${CL_IMGGRALLY2}    20s
            Click Element    ${CL_IMGGRALLY2}
            Sleep    3s
            Wait Until Page Contains Element    ${PHOTO9}    20s
            Click Element    ${PHOTO9}
        ELSE IF    "${IMG}" == "Photo2_1.gif"
            #อัพโหลดรูปภาพ
            Wait Until Page Contains Element    ${UP_PAY1}
            Click Element    ${UP_PAY1}
            Sleep    3s
            Wait Until Page Contains Element    ${CL_IMGGRALLY}    20s
            Click Element    ${CL_IMGGRALLY}
            Wait Until Page Contains Element    ${CL_IMGGRALLY2}    20s
            Click Element    ${CL_IMGGRALLY2}
            Sleep    3s
            Wait Until Page Contains Element    ${PHOTO3}    20s
            Click Element    ${PHOTO3}
        ELSE IF    "${IMG}" == "pao.jpeg"
            #อัพโหลดรูปภาพ
            Wait Until Page Contains Element    ${UP_PAY1}    20s
            Click Element    ${UP_PAY1}
            Sleep    3s
            Wait Until Page Contains Element    ${CL_IMGGRALLY}    20s
            Click Element    ${CL_IMGGRALLY}
            Wait Until Page Contains Element    ${CL_IMGGRALLY2}    20s
            Click Element    ${CL_IMGGRALLY2}
            Sleep    3s
            Wait Until Page Contains Element    ${PHOTO2}    20s
            Click Element    ${PHOTO2}
        ELSE IF    "${IMG}" == "12345.jpg"
            #อัพโหลดรูปภาพ
            Wait Until Page Contains Element    ${UP_PAY1}    20s
            Click Element    ${UP_PAY1}
            Sleep    3s
            Wait Until Page Contains Element    ${CL_IMGGRALLY}    20s
            Click Element    ${CL_IMGGRALLY}
            Wait Until Page Contains Element    ${CL_IMGGRALLY2}    20s
            Click Element    ${CL_IMGGRALLY2}
            Sleep    3s
            Wait Until Page Contains Element    ${PHOTO7}    20s
            Click Element    ${PHOTO7}
        END
    END
    Sleep    2s

CL_IMGREG
    [Arguments]    ${POU}
    Sleep    3s
    IF    '${POU}' == '1'
    Sleep    2s
    Wait Until Page Contains Element    ${CL_POU1}    20s
    Click Element    ${CL_POU1}
    ELSE IF    '${POU}' == '2'
    Sleep    2s
    Wait Until Page Contains Element    ${CL_POU2}    20s
    Click Element    ${CL_POU2}
    ELSE IF    '${POU}' == '3'
    Sleep    2s
    Wait Until Page Contains Element    ${CL_POU3}    20s
    Click Element    ${CL_POU3}
    ELSE IF    '${POU}' == '4'
    Sleep    2s
    Wait Until Page Contains Element    ${CL_POU3}    20s
    Click Element    ${CL_POU3}
    ELSE IF    '${POU}' == '5'
    Sleep    2s
    Wait Until Page Contains Element    ${CL_POU4}    20s
    Click Element    ${CL_POU4}
    ELSE IF    '${POU}' == '6'
    Sleep    2s
    Wait Until Page Contains Element    ${CL_POU5}    20s
    Click Element    ${CL_POU5}
    END

    
