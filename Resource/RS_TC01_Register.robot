*** Settings ***
Library  AppiumLibrary

*** Variables ***
#FireApp
${EXIT_MAIN_BTN_PATH}    xpath=(//android.widget.TextView)[1]
${REGISTER_BTN_PATH}    xpath=//android.view.ViewGroup/android.view.ViewGroup[5]

#อัพโหลดรูปภาพ
${IMG_BTN_PATH}   xpath=(//android.view.ViewGroup)[16]
${IMG_GAL_PATH}    id=android:id/content
#ของอีกที่ 1
${CL_IMG}    xpath=//android.widget.RelativeLayout[@index=1]
#ตลิกรูป
${CL_IMGGRALLY}    xpath=//android.widget.LinearLayout/android.widget.LinearLayout[1]
${CL_IMGGRALLY2}    id=photos.videos.vault.gallery.android:id/dir_thumbnail

#ภาพ
# กาto1.png(2MB)
${PHOTO1}    xpath=//android.widget.RelativeLayout[13]/android.widget.ImageView
# 1234.jpg
${PHOTO2}    xpath=//android.widget.RelativeLayout[7]/android.widget.ImageView
# pao.jpg
${PHOTO3}    xpath=//androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout[6]/android.widget.ImageView
# !@$#.jpg
${PHOTO4}    xpath=//android.widget.RelativeLayout[8]/android.widget.ImageView
# Phato2.gif
${PHOTO5}    xpath=//android.widget.RelativeLayout[14]/android.widget.ImageView
# Phato3.jpg (7 MB)
${PHOTO6}    xpath=//android.widget.RelativeLayout[12]/android.widget.ImageView
# Phato4.png (4 MB)    
${PHOTO7}    xpath=//android.widget.RelativeLayout[9]/android.widget.ImageView
# Phato5.png (5 MB)    
${PHOTO8}    xpath=//android.widget.RelativeLayout[11]/android.widget.ImageView
# Phato6.png (6 MB)    
${PHOTO9}    xpath=//android.widget.RelativeLayout[10]/android.widget.ImageView


#เลือกประเภทบ่อตกปลา
${Candidatetype_SPN}    xpath=//android.widget.Spinner[@index=0]
${fishing_participant}    //*[@text="ผู้เข้าร่วมตกปลา"]
${fishpond_owner}    //*[@text="เจ้าของบ่อตกปลา"]

#รหัสประชาชน
${INPUT_TEXT_ID}    xpath=//android.widget.EditText[@index=8]

#ชื่อหน้า
${INPUT_TEXT_NAME}     xpath=//android.widget.EditText[@index=10]

#นามสกุล
${INPUT_TEXT_LASENAME}     xpath=//android.widget.EditText[@index=12]

#เบอร์โทร
${INPUT_TEXT_TALL}     xpath=//android.widget.EditText[@index=14]

#วันเกิด
${CLICK_DATE}     xpath=(//android.widget.ImageView)[3]
${HEADER_YEAR}    id=android:id/date_picker_header_year
${HEADER_DATE}    id=android:id/date_picker_header_date
${OK_YEAR_BTN}    id=android:id/button1
${YEAR_LIST}    xpath=//android.widget.ListView/android.widget.TextView
${MONTH_AND_YEAR}    xpath=(//android.view.View/android.view.View)[1]
${PREV_BTN}    id=android:id/prev
${NEXT_BTN}    id=android:id/next
${DAY_LIST}    xpath=//android.view.View/android.view.View

#อีเมล
${INPUT_EMAIL}     xpath=//android.widget.EditText[@index=19]

#ที่อยู่
${INPUT_ADR}    xpath=//android.widget.EditText[@index=0]

# ID และ Pass ของผู้ใช้แอป
${INPUT_USER}    xpath=//android.widget.EditText[@index=2]
${INPUT_PASS}    xpath=//android.widget.EditText[@index=4]

# Botton Click
${BTN_SUMMIT}    xpath=//android.view.ViewGroup[@index=6]

# Botton Click เข้าสู่ระบบ
${CL_Submit}    xpath=//android.view.ViewGroup[@index=9]

#แอดมินยืนยันการสร้าง
${INPUT_USERR}    xpath=//android.widget.EditText[@index=3]
${INPUT_PASSS}    xpath=//android.widget.EditText[@index=5]

${ACP}    //*[@text='อนุมัติ']
${EX_ITT}    xpath=//android.widget.TextView[@index=0]
${SM_PWF}    xpath=//android.widget.TextView[@index=2]

# Eerror
${testcaseData}
${alet_mes_path}    id=android:id/message
${submit_alert}    xpath=//android.widget.Button[@index=0]
${alet_ok}    id=android:id/button1


# complished
${COMP}    //*[@text='เข้าสู่ระบบ']

# ALT
${AL_CL}    xpath=//android.widget.ImageView[@index=0]
${CANCLL1}    //android.view.ViewGroup[@index=5]
# Error Red
${ERRED}    id=com.prohect_fishing:id/rn_redbox_dismiss_button