package com.ltweb_servlet_ecommerce.utils;

import javax.servlet.http.HttpServletRequest;
import java.util.ResourceBundle;

public class NotifyUtil {
    public static void setUp(HttpServletRequest req) {
        String message = req.getParameter("message");
        String toast = req.getParameter("toast");
        if (message!=null && toast!=null) {
            ResourceBundle resourceMsg = ResourceBundle.getBundle("message");
            ResourceBundle resourceToast = ResourceBundle.getBundle("toast");
            req.setAttribute("message",resourceMsg.getString(message));
            req.setAttribute("toast",resourceToast.getString(toast));
        }
    }
}
