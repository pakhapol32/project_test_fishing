*** Settings ***
Library  AppiumLibrary

*** Variables ***
${testcaseData}

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

#ตลิกเข้าไปสร้างบ่อตกปลา
${Datafish}    //*[@text='ข้อมูลบ่อตกปลา']
${CL_POU}    xpath=(//android.view.ViewGroup)[15]
${EDIT_POU}    	//*[@text='แก้ไขข้อมูลบ่อตกปลา']

#กรอกเพิ่มข้อมูลบ่อตกปลา
${name_poud}    xpath=//android.widget.EditText[@index=4]
${Latijud}    xpath=//android.widget.EditText[@index=6]
${Longtijud}    xpath=//android.widget.EditText[@index=8]
${detail}    xpath=//android.widget.EditText[@index=10]
${location}    xpath=//android.widget.EditText[@index=12]
${๋ID_BANK}    xpath=//android.widget.EditText[@index=14]

${ADD_Fish}    xpath=//android.view.ViewGroup[@index=15]



#Check Error
${testcaseData}
${RES}    xpath=//android.view.ViewGroup[@index=0]

${alet_mes_path}    id=android:id/message
${submit_alert}    xpath=//android.widget.Button[@index=0]
${alet_ok}    id=android:id/button1

${CK_ADD}    //*[@text='เพิ่มบ่อตกปลา']
${NU_LL}    None

${EXET}    xpath=(//android.widget.TextView)[1]
${EX_XT1}    xpath=//android.view.ViewGroup[3]/android.widget.ImageView