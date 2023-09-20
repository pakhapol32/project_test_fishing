*** Settings ***
Library  AppiumLibrary

*** Variables ***
${CLE_TE}    //android.widget.EditText[@index=12]
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

#วันเกิด
${CLICK_DATE}     xpath=(//android.widget.ImageView)[4]
${HEADER_YEAR}    id=android:id/date_picker_header_year
${HEADER_DATE}    id=android:id/date_picker_header_date
${OK_YEAR_BTN}    id=android:id/button1
${YEAR_LIST}    xpath=//android.widget.ListView/android.widget.TextView
${MONTH_AND_YEAR}    xpath=(//android.view.View/android.view.View)[1]
${PREV_BTN}    id=android:id/prev
${NEXT_BTN}    id=android:id/next
${DAY_LIST}    xpath=//android.view.View/android.view.View

# เข้าข้อมูลส่วนตัว
${CL_PEIN}    xpath=//android.view.View[@index=2]
${BT_PEIN}    //*[@text="แก้ไขข้อมูลส่วนตัว"]

#รหัสประชาชน
${INPUT_TEXT_ID}    xpath=//android.widget.EditText[@index=4]

#ชื่อหน้า
${INPUT_TEXT_NAME}     xpath=//android.widget.EditText[@index=6]

#นามสกุล
${INPUT_TEXT_LASENAME}     xpath=//android.widget.EditText[@index=8]

#เบอร์โทร
${INPUT_TEXT_TALL}     xpath=//android.widget.EditText[@index=10]

#วันเกิด
${INPUT_DATE}     xpath=//android.widget.EditText[@index=12]

#อีเมล
${INPUT_EMAIL}     xpath=//android.widget.EditText[@index=15]

#ที่อยู่
${INPUT_ADR}    xpath=//android.widget.EditText[@index=0]

#คลิกยืนยันข้อมูล
${CL_EDIT}    xpath=//android.view.ViewGroup[@index=18]

# CheckError
${testcaseData}

${alet_mes_path}    id=android:id/message
${submit_alert}    xpath=//android.widget.Button[@index=0]
${alet_ok}    id=android:id/button1

${ID_CHE}    xpath=//android.view.ViewGroup[2]/android.widget.TextView[3]
${NAEM_CHE}    xpath=//android.view.ViewGroup[3]/android.widget.TextView[3]
${BD_CHE}    xpath=//android.view.ViewGroup[4]/android.widget.TextView[3]
${TEL_CHE}    xpath=//android.view.ViewGroup[5]/android.widget.TextView[3]
${EMA_CHE}    xpath=//android.view.ViewGroup[6]/android.widget.TextView[3]
${ADD_CHE}    xpath=//android.view.ViewGroup[7]/android.widget.TextView[3]
#สำเร็จ
${COMP}    //*[@text="คุณต้องการแก้ไขข้อมูลส่วนตัวใช่หรือไหม ?"]

${BTCOM}    //*[@text="ยืนยัน"]

#กดกางกะบาท
${CL_DE}    //*[@text="source.uri should not be an empty string"]
${DELE}    //*[@text="Dismiss"]
${EX_XT}    xpath=//android.view.ViewGroup[3]/android.widget.ImageView
${EX_XT1}    xpath=//android.view.ViewGroup[3]/android.widget.ImageView

${EX_ED}    xpath=//android.widget.TextView[@index=0]

