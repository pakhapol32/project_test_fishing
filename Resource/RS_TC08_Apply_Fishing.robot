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
${fishpond_owner}    //*[@text="เจ้าของบ่อตกปลา"]
${fishing_participant}    //*[@text="ผู้เข้าร่วมตกปลา"]

# เข้าสู้ระบบ
${CL_Submit}    xpath=//android.view.ViewGroup[@index=9]

# คลิก
${CL_POUN}    xpath=//android.widget.TextView[@index=4]
${CL_SUMIT}    //*[@text="ลงทะเบียนเข้าร่วมตกปลา"]
${CL_LADIO1}    xpath=//android.view.View[1]/android.widget.RadioButton/android.view.ViewGroup
${CL_LADIO2}    xpath=//android.view.View[2]/android.widget.RadioButton/android.view.ViewGroup
${CL_LADIO3}    xpath=//android.view.View[3]/android.widget.RadioButton/android.view.ViewGroup
${CL_LADIO4}    xpath=//android.view.View[4]/android.widget.RadioButton/android.view.ViewGroup
${CL_SUMIT2}    //*[@text="ลงทะเบียน"]

# Error 
${EX_ER}    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup[2]
${EX_DE}    //*[@text="Dismiss"]
${KAK_BAD}    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.widget.ImageView
#Check
${ALERT}    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.TextView
${testcaseData}

#Click Pass
${PAS}    xpath=//android.view.View/android.view.View[2]

# คลิกหน้าหลัก
${Home}    xpath=(//android.view.View)[3]

# ออก
${EXRT}    xpath=(//android.widget.TextView)[1]


