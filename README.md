#  การสร้างโมเดลพยากรณ์ ชุดข้อมูลหุ้น Waste Management Inc (WM) ย้อนหลัง 10 ปี

### คำอธิบายรายงานจะอยู่ในไฟล์ WM Stock Reports.pdf 

### โปรแกรมที่ใช้ได้แก่ R(ทดสอบ Assumption), Minitab(Run ผลของโมเดลในแต่ละรูปแบบ)

### ไฟล์ Dataset and AIC.xlsx เป็นไฟล์ข้อมูลที่ใช้โดยจะมี Raw Data ย้อนหลัง 10 ปี และ AIC ใช้สำหรับเปรียบเทียบโมเดลในหัวข้อที่ 6

### ไฟล์ Test Assumption.R เป็นไฟล์ที่ใช้ทดสอบสมมติฐานทางสถิติของหัวข้อที่ 2 

### ARIMA and DES.mpx เป็นผลรันที่มาจากโปรแกรม Minitab โดยจะประกอบไปด้วยหัวข้อตั้งแต่หัวข้อที่ 3 ถึง 7

รายงานฉบับนี้ประกอบไปด้วยเนื้อหา 8 หัวข้อ
  1. ขั้นตอนจัดเตรียมข้อมูล
  2. การทดสอบแนวโน้ม อิทธิพลของฤดูกาลและ สเตชันนารี 
    2.1 Testing of Normality
    2.2 Testing for Trend 
    2.3 Testing for Seasonal
    2.4 Testing for Stationary 
  3. วิธีบ็อกซ์และเจนกินส์ (Box-Jenkins)
    3.1 Autocorrelation Function
    3.2 Partial Autocorrelations 
  4. การขจัดข้อมูลที่ไม่สเตชันนารีด้วยการหาผลต่าง (Difference) 1 ครั้ง 
  5. ผลทดสอบโมเดลของ Box-Jenkins
  6. ทำการเปรียบเทียบทั้ง 8 Model ของการทดสอบ Box-Jenkins
  7. วิธีปรับให้เรียบเอ็กซ์โปเนนเซียลแบบดับเบิ้ล (Double Exponential Smoothing)
  8. สรุปผล
  
