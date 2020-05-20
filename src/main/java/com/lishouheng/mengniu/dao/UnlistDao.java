package com.lishouheng.mengniu.dao;

import com.lishouheng.mengniu.bean.SysParam;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;
@Mapper
public interface UnlistDao {
    List<SysParam> selectParameter();
    void deleteAll();
    void insertForeach(List<SysParam> list);
}
