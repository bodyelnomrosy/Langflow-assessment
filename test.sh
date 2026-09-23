#!/bin/bash

# استقبال الـ Mode كأول معامل (base أو new)
MODE=$1
shift

OUTPUT_PATH=""

# قراءة البارامترات الممررة
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --output_path) OUTPUT_PATH="$2"; shift 2 ;;
        *) shift ;;
    esac
done

if [ -z "$OUTPUT_PATH" ]; then
    OUTPUT_PATH="test-results.xml"
fi

# تنفيذ الاختبارات حسب الـ Mode المطلوب
if [ "$MODE" == "base" ]; then
    # في حالة الـ base: بنستبعد الاختبارات الجديدة
    pytest --junitxml="$OUTPUT_PATH" -k "not test_new"
elif [ "$MODE" == "new" ]; then
    # في حالة الـ new: بنشغل كل الاختبارات
    pytest --junitxml="$OUTPUT_PATH"
else
    # افتراضياً لو مبعتش mode محدد
    pytest --junitxml="$OUTPUT_PATH"
fi
