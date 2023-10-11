*** Settings ***
Library  AppiumLibrary

*** Variables ***
#Check Error
${testcaseData}

# คลิกช่องค้นหา
${IN_SE}    xpath=//android.widget.EditText[@index=1]
${SEART}    xpath=//android.widget.Button[@content-desc="search"]

#FireApp
${EXIT_MAIN_BTN_PATH}    xpath=(//android.widget.TextView)[1]

#กรอก ไอดี และ รหัส
${INPUT_USER}    xpath=//android.widget.EditText[@index=3]
${INPUT_PASS}    xpath=//android.widget.EditText[@index=5]

#เลือกประเภทบ่อตกปลา
${Candidatetype_SPN}    xpath=//android.widget.Spinner[@index=0]
${fishpond_owner}    //*[@text="เจ้าของบ่อตกปลา"]
${fishing_participant}    //*[@text="ผู้เข้าร่วมตกปลา"]

# เข้าสู้ระบบ
${CL_Submit}    xpath=//android.view.ViewGroup[@index=9]

# PAS
${PO_UP}    xpath=(//android.view.ViewGroup)[16]
#NAME PASS
${PO_NAME}    xpath=//android.widget.TextView[@index=4]