package com.ltweb_servlet_ecommerce.service.impl;

import com.ltweb_servlet_ecommerce.constant.SystemConstant;
import com.ltweb_servlet_ecommerce.dao.IOrderDetailsDAO;
import com.ltweb_servlet_ecommerce.log.LoggerHelper;
import com.ltweb_servlet_ecommerce.model.OrderDetailsModel;
import com.ltweb_servlet_ecommerce.paging.Pageble;
import com.ltweb_servlet_ecommerce.service.IOrderDetailsService;
import com.ltweb_servlet_ecommerce.subquery.SubQuery;
import com.ltweb_servlet_ecommerce.utils.ObjectComparator;
import com.ltweb_servlet_ecommerce.utils.RuntimeInfo;
import org.json.JSONObject;

import javax.inject.Inject;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class OrderDetailsService implements IOrderDetailsService {
    @Inject
    IOrderDetailsDAO orderDetailsDAO;

    @Override
    public List<OrderDetailsModel> findAllWithFilter(OrderDetailsModel model, Pageble pageble) throws SQLException {
        return orderDetailsDAO.findAllWithFilter(model, pageble);
    }

    @Override
    public OrderDetailsModel findWithFilter(OrderDetailsModel model) throws SQLException {
        return orderDetailsDAO.findWithFilter(model);
    }

    @Override
    public List<OrderDetailsModel> findByColumnValues(List<SubQuery> subQueryList, Pageble pageble) throws SQLException {
        return orderDetailsDAO.findByColumnValues(subQueryList, pageble);
    }

    @Override
    public Map<String, Object> findWithCustomSQL(String sql, List<Object> params) throws SQLException {
        return orderDetailsDAO.findWithCustomSQL(sql, params);
    }

    @Override
    public OrderDetailsModel update(OrderDetailsModel model) throws SQLException {
        OrderDetailsModel oldModel = orderDetailsDAO.findById(model.getId());
        model.setUpdateAt(new Timestamp(System.currentTimeMillis()));
        boolean isUpdated = orderDetailsDAO.update(model) > 0;
        OrderDetailsModel newModel = orderDetailsDAO.findById(model.getId());

        LinkedHashMap<String, String>[] results = ObjectComparator.compareObjects(oldModel, newModel);

        //logging
        JSONObject preValue = new JSONObject().put(SystemConstant.VALUE_LOG, new JSONObject(results[0]));
        String status = String.format("Updated orderDetails with id = %d %s", model.getId(), isUpdated ? "successfully" : "failed");
        JSONObject value = new JSONObject().put(SystemConstant.STATUS_LOG, status)
                .put(SystemConstant.VALUE_LOG, new JSONObject(results[1]));

        LoggerHelper.log(isUpdated ? SystemConstant.WARN_LEVEL : SystemConstant.ERROR_LEVEL,
                "UPDATE", RuntimeInfo.getCallerClassNameAndLineNumber(), preValue, value);


        return newModel;
    }

    @Override
    public OrderDetailsModel delete(Long id) throws SQLException {
        OrderDetailsModel oldModel = orderDetailsDAO.findById(id);
        orderDetailsDAO.delete(id);
        return oldModel;
    }

    @Override
    public List<OrderDetailsModel> findAll(Pageble pageble) throws SQLException {
        return orderDetailsDAO.findAll(pageble);
    }

    @Override
    public OrderDetailsModel softDelete(Long id) throws SQLException {
        OrderDetailsModel model = orderDetailsDAO.findById(id);
        model.setUpdateAt(new Timestamp(System.currentTimeMillis()));
        model.setIsDeleted(true);
        orderDetailsDAO.update(model);
        return orderDetailsDAO.findById(model.getId());
    }

    @Override
    public OrderDetailsModel findById(Long id) throws SQLException {
        return orderDetailsDAO.findById(id);
    }

    @Override
    public OrderDetailsModel save(OrderDetailsModel model) throws SQLException {
        Long productId = orderDetailsDAO.save(model);
        OrderDetailsModel result = orderDetailsDAO.findById(productId);

        //logging
        String status = String.format("Saved orderDetails %s",  result !=null ? "successfully" : "failed");
        JSONObject value = new JSONObject().put(SystemConstant.STATUS_LOG, status)
                .put(SystemConstant.VALUE_LOG, new JSONObject(result));

        LoggerHelper.log(result != null ? SystemConstant.WARN_LEVEL : SystemConstant.ERROR_LEVEL,
                "INSERT", RuntimeInfo.getCallerClassNameAndLineNumber(), value);

        return result;
    }
}