package com.ltweb_servlet_ecommerce.utils;

import java.util.LinkedHashMap;

public class ObjectComparator {
    public static <T> LinkedHashMap<String, String>[] compareObjects(T oldObj, T newObj) {
        LinkedHashMap<String, String> map1 = new LinkedHashMap<>();
        LinkedHashMap<String, String> map2 = new LinkedHashMap<>();

        // Lấy ra tất cả các trường (fields) của đối tượng
        java.lang.reflect.Field[] fields = oldObj.getClass().getDeclaredFields();

        for (java.lang.reflect.Field field : fields) {
            // Sử dụng reflection để lấy giá trị của trường từ cả hai đối tượng
            field.setAccessible(true);
            Object oldValue;
            Object newValue;
            try {
                oldValue = field.get(oldObj);
                newValue = field.get(newObj);
            } catch (IllegalAccessException e) {
                // Xử lý ngoại lệ nếu không thể truy cập giá trị của trường
                e.printStackTrace();
                continue;
            }

            // So sánh giá trị của trường trong old và new
            if (!isEqual(oldValue, newValue)) {
                map1.put(field.getName(), oldValue.toString());
                map2.put(field.getName(), newValue.toString());
            }
        }

        // Tạo mảng chứa map1 và map2
        @SuppressWarnings("unchecked")
        LinkedHashMap<String, String>[] result = new LinkedHashMap[]{map1, map2};
        return result;
    }

    // Method để kiểm tra xem hai giá trị có bằng nhau không
    private static boolean isEqual(Object obj1, Object obj2) {
        return (obj1 == null && obj2 == null) || (obj1 != null && obj1.equals(obj2));
    }

    // Ví dụ sử dụng
    public static void main(String[] args) {
        // Tạo đối tượng old
        MyObject oldObj = new MyObject(5, 1, "2024-03-29 10:07:59.0", 110, 23, "2024-03-29 10:07:59.0");
        // Tạo đối tượng new
        MyObject newObj = new MyObject(2, 3, "2024-03-29 10:07:59.0", 110, 23, "2025-03-29 10:07:59.0");

        // So sánh và lấy kết quả
        LinkedHashMap<String, String>[] results = compareObjects(oldObj, newObj);
        LinkedHashMap<String, String> map1 = results[0];
        LinkedHashMap<String, String> map2 = results[1];

        // In kết quả
        System.out.println("map1: " + map1);
        System.out.println("map2: " + map2);
    }
}

// Class mẫu đại diện cho đối tượng cần so sánh
class MyObject {
    int productSizeId;
    int quantity;
    String createAt;
    int subTotal;
    int id;
    String updateAt;

    public MyObject(int productSizeId, int quantity, String createAt, int subTotal, int id, String updateAt) {
        this.productSizeId = productSizeId;
        this.quantity = quantity;
        this.createAt = createAt;
        this.subTotal = subTotal;
        this.id = id;
        this.updateAt = updateAt;
    }
}

