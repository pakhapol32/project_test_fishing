*** Settings ***
Library  AppiumLibrary

*** Variables ***
${testcaseData}

${DaTA_POMENU}    //*[@text="เมนู"]

${HIS_EVE}    //*[@text="ประวัติการจัดงานตกปลา"]

${POUN}    	//*[@text="บ่อ2โล10บาท"]

${Summary}    //android.widget.EditText[@index=10]

${Submit1}    //*[@text="ยืนยัน"]

${alet_mes_path}    id=android:id/message
${submit_alert}    xpath=//android.widget.Button[@index=0]
${alet_ok}    id=android:id/button1

${KAKA}    xpath=(//android.view.ViewGroup)[5]

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

${EX_APP}    //*[@text="ออกจากระบบ"]