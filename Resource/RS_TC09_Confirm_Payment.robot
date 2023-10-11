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

# FISHING
${CL_IMG}    xpath=//android.view.ViewGroup[@index=3]
${SU_MIT}    //*[@text="ลงทะเบียนเข้าร่วมตกปลา"]

# คลิกเลดีโอ
${CL_1}    xpath=//android.view.View[1]/android.widget.RadioButton/android.view.ViewGroup
${CL_2}    xpath=//android.view.View[2]/android.widget.RadioButton/android.view.ViewGroup
${CL_3}    xpath=//android.view.View[3]/android.widget.RadioButton/android.view.ViewGroup

# คลิกเข้าไปมนประวัติการชำระเงิน
${SU_MT}    //*[@text="ลงทะเบียน"]
${MENU_1}    //*[@text="เมนู"]
${HIS}    xpath=//android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]
${CL_BANK}    //android.view.ViewGroup[@index=0]

${IMG_BTN_PATH}    xpath=(//android.view.ViewGroup)[8]
${SUMM}    //*[@text="อัพโหลด"]

# คลิกประวัติการชำระ
${CLI_1}    //*[@text="สวิง"]
${CLI_2}    //*[@text="ยกยอ"]
${CLI_3}    //*[@text="หว่านแห"]

# Error เหลือง
${ER_YL}    xpath=//android.widget.FrameLayout/android.view.ViewGroup[2]
${ER_DM}    //*[@text="Dismiss"]

# Error 
${AL_FL}    xpath=//android.widget.FrameLayout/android.view.ViewGroup[2]
${AL_TR}    //*[@text="เมืองเทิงฟิชชิ่ง1"]
${AL_COM}    สมัครบ่อตกปลาไม่สำเร็จ

#ยืนยันบ่อ
${PE_JO}    //*[@text="ผู้เข้าร่วม"]
${PEO}    //*[@text="ภัคพา ปาลาน"]
${EX_APP}    //*[@text="ออกจากระบบ"]

#ภาพ
# Photo2_1.jpeg
${PHOTO2}    xpath=//android.widget.RelativeLayout[2]/android.widget.ImageView
# Photo2_1.gif
${PHOTO3}    xpath=//androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout[1]/android.widget.ImageView
# กาto2.png
${PHOTO4}    xpath=//android.widget.RelativeLayout[3]/android.widget.ImageView
# 12345.jpg    
${PHOTO7}    xpath=//android.widget.RelativeLayout[4]/android.widget.ImageView
# กาto2.jpg    
${PHOTO9}    xpath=//android.widget.RelativeLayout[5]/android.widget.ImageView

#ตลิกรูป
${CL_IMGGRALLY}    xpath=//android.widget.LinearLayout/android.widget.LinearLayout[1]
${CL_IMGGRALLY2}    id=photos.videos.vault.gallery.android:id/dir_thumbnail

${DaTA_POMENU}    //*[@text="เมนู"]
${CL_HIS}    //*[@text="ประวัติการลงทะเบียน"]
# คลิกบัตรลงทะเบียน
${CL_POU1}    //android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]
${CL_POU2}    //android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]
${CL_POU3}    //android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[3]
${CL_POU4}    //android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[4]
${CL_POU5}    //android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[5]

# อัพโหลดหลักฐาน
${UP_IMG_PAY}    //android.view.ViewGroup[@index=27]
# อัพธนาคาร
${UP_PAY1}    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.TextView

# อัพโหลด
${UPLOAD_IMG}    //*[@text="อัพโหลด"]

# กดรูปออก
${FPAS1}    	(//android.widget.TextView)[1]
# ประวัติชำระเงิน
${CL_HIS1}    //android.view.ViewGroup[@index=2]

# Error Yellow
${KAK_BAD}    //android.view.ViewGroup[3]/android.widget.ImageView
${INFO_KAK_BAd}    //android.view.ViewGroup[2]/android.widget.TextView

${YELO_ER1}    	/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.widget.ImageView

${KAK_BAD_RED}    (//android.widget.TextView)[1]

# Pass
${Fis1}    	//*[@text="ใบแจ้งชำระเงิน"]