package com.ltweb_servlet_ecommerce.service.impl;

import com.ltweb_servlet_ecommerce.dao.ILogDAO;
import com.ltweb_servlet_ecommerce.dao.IOpinionDAO;
import com.ltweb_servlet_ecommerce.dao.impl.LogDAO;
import com.ltweb_servlet_ecommerce.model.LogModel;
import com.ltweb_servlet_ecommerce.paging.Pageble;
import com.ltweb_servlet_ecommerce.service.ILogService;
import com.ltweb_servlet_ecommerce.subquery.SubQuery;

import javax.inject.Inject;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

public class LogService implements ILogService {

    private ILogDAO logDAO = new LogDAO();

    @Override
    public List<LogModel> findAllWithFilter(LogModel model, Pageble pageble) {
        return logDAO.findAllWithFilter(model,pageble);
    }

    @Override
    public LogModel findWithFilter(LogModel model) {
        return logDAO.findWithFilter(model);
    }

    @Override
    public List<LogModel> findByColumnValues(List<SubQuery> subQueryList, Pageble pageble) {
        return logDAO.findByColumnValues(subQueryList,pageble);
    }

    @Override
    public LogModel update(LogModel model) {
        model.setUpdateAt(new Timestamp(System.currentTimeMillis()));
        logDAO.update(model);
        return logDAO.findById(model.getId());
    }

    @Override
    public LogModel delete(Long id) {
        LogModel oldModel = logDAO.findById(id);
        logDAO.delete(id);
        return oldModel;
    }

    @Override
    public List<LogModel> findAll(Pageble pageble) {
        return logDAO.findAll(pageble);
    }

    @Override
    public LogModel findById(Long id) {
        return logDAO.findById(id);
    }

    @Override
    public LogModel save(LogModel model) {
        Long productId = logDAO.save(model);
        return logDAO.findById(productId);
    }
}
