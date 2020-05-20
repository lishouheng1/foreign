package com.lishouheng.mengniu.service.impl;

import com.lishouheng.mengniu.bean.SysParam;
import com.lishouheng.mengniu.dao.UnlistDao;
import com.lishouheng.mengniu.service.UnlistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class UnlistServiceImpl implements UnlistService {
    /**
     * 查询一级栏目
     */
    @Autowired
    private UnlistDao unlistDao;

    @Override
    public List<SysParam> selectParameter() {
        return unlistDao.selectParameter();
    }

    @Override
    @Transactional
    public void updata(List<SysParam> list) {
        unlistDao.deleteAll();
        unlistDao.insertForeach(list);
    }


}

