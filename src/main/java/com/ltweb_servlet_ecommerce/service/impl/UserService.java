package com.ltweb_servlet_ecommerce.service.impl;

import com.ltweb_servlet_ecommerce.constant.SystemConstant;
import com.ltweb_servlet_ecommerce.dao.IUserDAO;
import com.ltweb_servlet_ecommerce.log.LoggerHelper;
import com.ltweb_servlet_ecommerce.model.UserModel;
import com.ltweb_servlet_ecommerce.paging.Pageble;
import com.ltweb_servlet_ecommerce.service.IUserService;
import com.ltweb_servlet_ecommerce.subquery.SubQuery;
import com.ltweb_servlet_ecommerce.utils.JSONObjectUtil;
import com.ltweb_servlet_ecommerce.utils.ObjectComparator;
import com.ltweb_servlet_ecommerce.utils.RuntimeInfo;
import org.json.JSONObject;

import javax.inject.Inject;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class UserService implements IUserService {
    @Inject
    IUserDAO userDAO;

    @Override
    public List<UserModel> findAllWithFilter(UserModel model, Pageble pageble) throws SQLException {
        return userDAO.findAllWithFilter(model, pageble);
    }

    @Override
    public UserModel findWithFilter(UserModel model) throws SQLException {
        return userDAO.findWithFilter(model);
    }

    @Override
    public List<UserModel> findByColumnValues(List<SubQuery> subQueryList, Pageble pageble) throws SQLException {
        return userDAO.findByColumnValues(subQueryList, pageble);
    }

    @Override
    public Map<String, Object> findWithCustomSQL(String sql, List<Object> params) throws SQLException {
        return userDAO.findWithCustomSQL(sql, params);
    }

    @Override
    public UserModel update(UserModel model) throws SQLException {
        UserModel oldModel = userDAO.findById(model.getId());
        model.setUpdateAt(new Timestamp(System.currentTimeMillis()));
        userDAO.update(model);
        UserModel newModel = userDAO.findById(model.getId());
        LinkedHashMap<String, String>[] results = ObjectComparator.compareObjects(oldModel, newModel);
        // Logging
        JSONObject preValue = new JSONObject();
        JSONObject preValueObject = new JSONObject(results[0]);
        JSONObjectUtil.removeKeys(preValueObject, List.of("password","userName"));
        preValue.put(SystemConstant.VALUE_LOG, preValueObject);

        JSONObject value = new JSONObject();
        value.put(SystemConstant.STATUS_LOG, "UpdatedAt and lastLogged fields successfully updated");
        JSONObject valueObject = new JSONObject(results[1]);
        JSONObjectUtil.removeKeys(valueObject, List.of("password","userName"));
        value.put(SystemConstant.VALUE_LOG, valueObject);

        LoggerHelper.log(SystemConstant.WARN_LEVEL, "UPDATE", RuntimeInfo.getCallerClassNameAndLineNumber(), preValue, value);
        return newModel;
    }


    @Override
    public UserModel delete(Long id) throws SQLException {
        UserModel oldModel = userDAO.findById(id);
        userDAO.delete(id);
        return oldModel;
    }

    @Override
    public List<UserModel> findAll(Pageble pageble) throws SQLException {
        return userDAO.findAll(pageble);
    }

    @Override
    public UserModel softDelete(Long id) throws SQLException {
        UserModel model = userDAO.findById(id);
        model.setUpdateAt(new Timestamp(System.currentTimeMillis()));
        model.setIsDeleted(true);
        userDAO.update(model);
        return userDAO.findById(model.getId());
    }

    @Override
    public UserModel findById(Long id) throws SQLException {
        return userDAO.findById(id);
    }

    @Override
    public UserModel save(UserModel model) throws SQLException {
        Long productId = userDAO.save(model);
        return userDAO.findById(productId);
    }
}
