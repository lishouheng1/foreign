package com.lishouheng.mengniu.controller;

import com.lishouheng.mengniu.bean.Parameter;
import com.lishouheng.mengniu.bean.SysParam;
import com.lishouheng.mengniu.constant.SysConstant;
import com.lishouheng.mengniu.init.AutoRun;
import com.lishouheng.mengniu.netty.ChineseProverbServer;
import com.lishouheng.mengniu.netty.ChineseProverbServerHandler;
import com.lishouheng.mengniu.service.UnlistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author jiabao.chen
 * @date 2020/5/18 19:01
 */
@Controller
public class OptController {
    @Autowired
    private UnlistService unlistService;

    @RequestMapping("to")
    public String to(Model mv){
            mv.addAttribute("parameter",unlistService.selectParameter());
        return "/html/news/opt.jsp";
    }
    @RequestMapping(value = "updata",method = RequestMethod.POST)
    @ResponseBody
    public Object updata( Parameter paramter){
        List<SysParam> params =new ArrayList<>();
        if(null!=paramter){
            params.add(new SysParam("ssty",paramter.getSsty()));
            params.add(new SysParam("thred",paramter.getThred()));
            params.add(new SysParam("x",paramter.getX()));
            params.add(new SysParam("y",paramter.getY()));
            params.add(new SysParam("width",paramter.getWidth()));
            params.add(new SysParam("length",paramter.getLength()));
            unlistService.updata(params);
            SysConstant.map.put("ssty",paramter.getSsty());
            SysConstant.map.put("thred",paramter.getThred());
            SysConstant.map.put("x",paramter.getX());
            SysConstant.map.put("y",paramter.getY());
            SysConstant.map.put("width",paramter.getWidth());
            SysConstant.map.put("length",paramter.getLength());
        }
        return new HashMap<>();
    }
}
