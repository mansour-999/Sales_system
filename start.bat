@echo off
echo ===================================================
echo تشغيل منظومة المبيعات الإلكترونية
echo ===================================================
echo.
echo جاري التحقق من المتطلبات...
echo.

REM التحقق من تثبيت Node.js
node --version >nul 2>&1
if %errorlevel% neq 0 (
  echo خطأ: Node.js غير مثبت على جهازك.
  echo يرجى تثبيت Node.js من الموقع الرسمي: https://nodejs.org/
  echo ثم إعادة تشغيل هذا الملف.
  echo.
  pause
  exit /b
)

echo تم العثور على Node.js بنجاح.
echo.
echo جاري تثبيت المكتبات اللازمة...
echo قد تستغرق هذه العملية بضع دقائق...
echo.

REM تثبيت المكتبات اللازمة
call npm install

echo.
echo جاري تهيئة قاعدة البيانات...
echo.

REM تهيئة قاعدة البيانات
node src/init-db.js

echo.
echo جاري تشغيل النظام...
echo.

REM تشغيل الخادم
echo النظام يعمل الآن على المنفذ 3000
echo.
echo يرجى فتح المتصفح والانتقال إلى: http://localhost:3000
echo.
echo بيانات الدخول الافتراضية:
echo اسم المستخدم: admin
echo كلمة المرور: admin123
echo.
echo ملاحظة: لا تغلق هذه النافذة أثناء استخدام النظام.
echo.

REM تشغيل الخادم
node src/server.js
