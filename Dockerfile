# استخدام الصورة الأساسية المعتمدة للمنصة
FROM public.ecr.aws/d3j8x8q7/olympus-base-python:latest

# تحديد مجلد العمل
WORKDIR /app

# نسخ ملفات المشروع بالكامل إلى /app
COPY . .

# تثبيت المكتبات إذا كان هناك ملف requirements.txt
# (إذا لم يكن الملف موجوداً، يمكنك إزالة هذا السطر أو التأكد من توفيره)
RUN if [ -f requirements.txt ]; then pip install --no-cache-dir -r requirements.txt; fi

# توفير شل تفاعلي افتراضي
CMD ["/bin/bash"]
