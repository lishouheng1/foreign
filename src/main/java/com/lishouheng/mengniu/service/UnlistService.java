package com.lishouheng.mengniu.service;

import com.lishouheng.mengniu.bean.SysParam;

import java.util.List;
import java.util.Map;

public interface UnlistService {
    List<SysParam> selectParameter();
    void updata(List<SysParam> list);
}
