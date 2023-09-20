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

#เมนู
${DaTA_POMENU}    //*[@text="เมนู"]

# ประวัติการเข้าร่วมตกปลา
${JoinPoun}    //*[@text="ประวัติการเข้าร่วมตกปลา"]

${CL_COM1}    //android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]
${CL_COM2}    //android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]
${CL_COM3}    //android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[3]
${CL_COM4}    //android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[4]
${CL_COM5}    //android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[5]
${CL_COM6}    //android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[6]
${CL_COM7}    //android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[7]
${CL_COM8}    //android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[8]

${CL2_COM1}    //*[@text="แสดงความคิดเห็น"]
${Star_IN1}    //android.view.ViewGroup/android.view.ViewGroup[3]/android.widget.ImageView
${Star_IN2}    //android.view.ViewGroup/android.view.ViewGroup[4]/android.widget.ImageView
${Star_IN3}    //android.view.ViewGroup/android.view.ViewGroup[5]/android.widget.ImageView
${Star_IN4}    //android.view.ViewGroup/android.view.ViewGroup[6]/android.widget.ImageView
${Star_IN5}    //android.view.ViewGroup/android.view.ViewGroup[7]/android.widget.ImageView
${INPUT_COM}    //android.widget.EditText[@index=13]
${SUPMIT_COM}    //*[@text="แสดงความคิดเห็น"]

# error yellow
${ER_YL}    //android.view.ViewGroup[@index=2]
${EXET}    (//android.widget.TextView)[1]
${KAKA}    xpath=(//android.view.ViewGroup)[5]

${ORDER}    //*[@text="รายการรีวิวงานตกปลา"]
${ECET_YL}    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]

${YLYL1}    //*[@text="Encountered two children with the same key, `Test1ApplyNo8`. Keys should be unique so that components maintain their identity across updates. Non-unique keys may cause children to be duplicated and/or omitted — the behavior is unsupported and could change in a future version."]
${DENI}    //*[@text="Dismiss"]


${TETEXX}    //*[@text="รีวิวการจัดงานตกปลาที่เข้าร่วม"]