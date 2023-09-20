*** Settings ***
Library  AppiumLibrary

*** Variables ***
#FireApp
${EXIT_MAIN_BTN_PATH}    xpath=(//android.widget.TextView)[1]

#กรอก ไอดี และ รหัส
${INPUT_USER}    xpath=//android.widget.EditText[@index=3]
${INPUT_PASS}    xpath=//android.widget.EditText[@index=5]

#เลือกประเภทบ่อตกปลา
${Candidatetype_SPN}    xpath=//android.widget.Spinner[@index=0]
${fishing_participant}    //*[@text="ผู้เข้าร่วมตกปลา"]
${fishpond_owner}    //*[@text="เจ้าของบ่อตกปลา"]

# เข้าสู้ระบบ
${CL_Submit}    xpath=//android.view.ViewGroup[@index=9]

# check error
${testcaseData}
${CEK_ERE}    //*[@text='เข้าสู่ระบบ']

# Complie
${COMP}    //*[@text='ข้อมูลส่วนตัว']


