import pytest
from langflow.utils.util import remove_nulls_from_dict, __all__ as util_all

def test_remove_nulls_basic():
    # اختبار إزالة القيم الـ None فقط مع الحفاظ على القيم الـ Falsey
    data = {"a": 1, "b": None, "c": 0, "d": False, "e": ""}
    cleaned = remove_nulls_from_dict(data)
    assert cleaned == {"a": 1, "c": 0, "d": False, "e": ""}

def test_remove_nulls_nested_and_containers():
    # اختبار التعامل مع القواميس المتداخلة والقوائم والتجانس
    data = {
        "nested": {"x": None, "y": 5},
        "list_items": [None, {"z": None, "w": 10}],
        "tuple_items": (None, {"m": None})
    }
    cleaned = remove_nulls_from_dict(data)
    assert cleaned == {
        "nested": {"y": 5},
        "list_items": [None, {"w": 10}],
        "tuple_items": (None, {"m": {}})
    }

def test_remove_nulls_immutability():
    # التأكد من عدم تعديل المدخلات الأصلية (Deep Copy)
    original = {"a": None, "b": 2}
    cleaned = remove_nulls_from_dict(original)
    assert original["a"] is None
    assert "a" not in cleaned

def test_export_in_all():
    # التأكد من إضافة الدالة في __all__
    assert "remove_nulls_from_dict" in util_all
