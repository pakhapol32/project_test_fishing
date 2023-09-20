*** Settings ***
Library    AppiumLibrary

*** Variables ***
#ภาพ
# กาto1.png(2MB)
${PHOTO1}    xpath=//android.widget.RelativeLayout[8]/android.widget.ImageView
# 1234.jpg
${PHOTO2}    xpath=//android.widget.RelativeLayout[2]/android.widget.ImageView
# pao.jpg
${PHOTO3}    xpath=//androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout[1]/android.widget.ImageView
# !@$#.jpg
${PHOTO4}    xpath=//android.widget.RelativeLayout[3]/android.widget.ImageView
# Phato2.gif
${PHOTO5}    xpath=//android.widget.RelativeLayout[9]/android.widget.ImageView
# Phato3.jpg (7 MB)
${PHOTO6}    xpath=//android.widget.RelativeLayout[7]/android.widget.ImageView
# Phato4.png (4 MB)    
${PHOTO7}    xpath=//android.widget.RelativeLayout[4]/android.widget.ImageView
# Phato5.png (5 MB)    
${PHOTO8}    xpath=//android.widget.RelativeLayout[6]/android.widget.ImageView
# Phato6.png (6 MB)    
${PHOTO9}    xpath=//android.widget.RelativeLayout[5]/android.widget.ImageView

#Check Error
${testcaseData}

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

#ตลิกเข้าไปสร้างบ่อตกปลา
${Datafish}    //*[@text='ข้อมูลบ่อตกปลา']
${IMG_plus}    	//*[@text='บ่อตกปลาเจริญสุข90']

#คิกเพิ่มข้อมูลบ่อตกปลา
${CL_ADD}    //*[@text="เพิ่มข้อมูลจัดงานตกปลา"]

#ตลิกรูป
${CL_IMGGRALLY}    xpath=//android.widget.LinearLayout/android.widget.LinearLayout[1]
${CL_IMGGRALLY2}    id=photos.videos.vault.gallery.android:id/dir_thumbnail

#ของอีกที่ 1
${CL_IMG}    xpath=(//android.widget.LinearLayout)[3]

#อัพโหลดรูปภาพ
${IMG_BTN_PATH}   xpath=(//android.view.ViewGroup)[16]
${IMG_GAL_PATH}    id=android:id/content

#วันเกิด
${CLICK_DATE1}     xpath=//android.view.ViewGroup[2]/android.widget.ImageView
${CLICK_DATE2}     xpath=//android.view.ViewGroup[3]/android.widget.ImageView
${CLICK_DATE3}     xpath=//android.view.ViewGroup[4]/android.widget.ImageView
${HEADER_YEAR}    id=android:id/date_picker_header_year
${HEADER_DATE}    id=android:id/date_picker_header_date
${OK_YEAR_BTN}    id=android:id/button1
${YEAR_LIST}    xpath=//android.widget.ListView/android.widget.TextView
${MONTH_AND_YEAR}    xpath=(//android.view.View/android.view.View)[1]
${PREV_BTN}    id=android:id/prev
${NEXT_BTN}    id=android:id/next
${DAY_LIST}    xpath=//android.view.View/android.view.View

# กรอกข้อมูล
${NAME_FIS}    xpath=//android.widget.EditText[@index=6]
${CODITION}    xpath=//android.widget.EditText[@index=0]

# คลิก Time
${TIME_FIR}    xpath=//android.view.ViewGroup[4]/android.widget.ImageView
${TIME_LAS}    xpath=//android.view.ViewGroup[5]/android.widget.ImageView

${TIME_LIST}    xpath=//android.widget.LinearLayout/android.view.View
# คลิกแป้นพิม
${KEY_PA}    id=android:id/toggle_mode
${HOUR_TIME}    id=android:id/input_hour
${MIN_TIME}    id=android:id/input_minute
#Select Time
${SPIN}    id=android:id/am_pm_spinner
${A_M}    //*[@text="AM"]
${P_M}    //*[@text="PM"]
${O_K}    id=android:id/button1

${PANPIM}    android:id/toggle_mode
${TOM1}    android:id/input_minute
${HOM1}    	android:id/input_hour
${TOM2}    android:id/input_minute
${HOM2}    	android:id/input_hour
${KO}    	android:id/button1
${CANCLE}    android:id/button2

#Test เวลาแบบ2
${HOUR_TIME1}    //*[@content-desc=1]
${MIN_TIME1}    id=android:id/input_minute


#คลิกหน้าต่อไป
${NEXT_CL}    xpath=//android.view.ViewGroup[@index=25]

#Error
${alet_mes_path}    id=android:id/message
${submit_alert}    xpath=//android.widget.Button[@index=0]
${alet_ok}    id=android:id/button1

# Selcet จำนวน บ้อตกปลา
${SE_NM}    xpath=//android.widget.Spinner[@index=0]
${NU_ONE}    xpath=//*[@text="1"]
${NU_TWO}    xpath=//*[@text="2"]
${NU_THREE}    xpath=//*[@text="3"]
${NU_FORE}    xpath=//*[@text="4"]

# ประเภทบัตร
${PRA_ONE}    xpath=//android.view.ViewGroup[1]/android.widget.EditText[1]
${NUM_ONE}    xpath=//android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.EditText[2]
${PEO_ONE}    xpath=//android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.EditText[3]

#  2
${PRA_TWO}    xpath=//android.view.ViewGroup[2]/android.widget.EditText[1]
${NUM_TWO}    xpath=//android.view.ViewGroup[2]/android.widget.EditText[2]
${PEO_TWO}    xpath=//android.view.ViewGroup[2]/android.widget.EditText[3]

# 3
${PRA_THREE}    xpath=//android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.widget.EditText[1]
${NUM_THREE}    xpath=//android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.widget.EditText[2]
${PEO_THREE}    xpath=//android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.widget.EditText[3]

# 4
${PRA_FORE}    xpath=//android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.widget.EditText[1]
${NUM_FORE}    xpath=//android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.widget.EditText[2]
${PEO_FORE}    xpath=//android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.widget.EditText[3]

# เพิ่ม
${CO_PAW}    //*[@text="เพิ่มบัตรตกปลา"]

# Check Error ของ เวลว
${ERROR_TIME}    id=android:id/label_error

# หาเวลา
${HOUR_TIME}    id=android:id/hours
${MIN_TIME}    id=android:id/minutes

# ออก
${EXET}    xpath=(//android.widget.TextView)[1]
${CHECC}    //android.view.ViewGroup[2]/android.view.View/android.view.View[1]
#ALT
${AL_CL}    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.widget.ImageView


# เวลา ชั่วโมง
${1}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="1"]
${2}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="2"]
${3}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="3"]
${4}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="4"]
${5}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="5"]
${6}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="6"]
${7}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="7"]
${8}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="8"]
${9}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="9"]
${10}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="10"]
${11}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="11"]
${12}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="12"]
# เวลา นาที
${_1}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="1"]
${_2}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="2"]
${_3}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="3"]
${_4}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="4"]
${_5}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="5"]
${_6}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="6"]
${_7}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="7"]
${_8}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="8"]
${_9}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="9"]
${_10}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="10"]
${_11}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="11"]
${_12}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="12"]
${13}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="13"]
${14}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="14"]
${15}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="15"]
${16}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="16"]
${17}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="17"]
${18}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="18"]
${19}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="19"]
${20}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="20"]
${21}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="21"]
${22}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="22"]
${23}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="23"]
${24}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="24"]
${25}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="25"]
${26}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="26"]
${27}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="27"]
${28}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="28"]
${29}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="29"]
${30}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="30"]
${31}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="31"]
${32}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="32"]
${33}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="33"]
${34}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="34"]
${35}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="35"]
${36}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="36"]
${37}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="37"]
${38}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="38"]
${39}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="39"]
${40}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="40"]
${41}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="41"]
${42}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="42"]
${43}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="43"]
${44}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="44"]
${45}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="45"]
${46}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="46"]
${47}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="47"]
${48}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="48"]
${49}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="49"]
${50}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="50"]
${51}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="51"]
${52}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="52"]
${53}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="53"]
${54}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="54"]
${55}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="55"]
${56}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="56"]
${57}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="57"]
${58}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="58"]
${59}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="59"]
${00}    xpath=//android.widget.RadialTimePickerView.RadialPickerTouchHelper[@content-desc="00"]