package com.ltweb_servlet_ecommerce.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.json.JSONObject;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LogModel extends AbstractModel<LogModel>{
    private String ip;
    private String level;
    private String action;
    private String resource;
    private JSONObject preValue;
    private JSONObject value;

}
// research xem ip được gửi từ quốc gia nào; trong ip2location