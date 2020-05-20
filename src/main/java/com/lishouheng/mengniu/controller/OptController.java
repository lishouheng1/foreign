package com.lishouheng.mengniu.controller;

import com.lishouheng.mengniu.bean.Parameter;
import com.lishouheng.mengniu.bean.SysParam;
import com.lishouheng.mengniu.init.AutoRun;
import com.lishouheng.mengniu.netty.ChineseProverbServer;
import com.lishouheng.mengniu.netty.ChineseProverbServerHandler;
import com.lishouheng.mengniu.service.UnlistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

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
    public String updata(Parameter paramter,Model mv){
//        AutoRun.parameter=paramter;
        System.out.println(paramter);
        List<SysParam> params =new ArrayList<>();
        SysParam sysParam=new SysParam();
        sysParam.setId(1);
        sysParam.setKey("ssty");
        sysParam.setValue(paramter.getSsty());
        System.out.println(sysParam.toString());
        params.add(sysParam);
        unlistService.updata(sysParam);
        sysParam.setId(2);
        sysParam.setKey("thred");
        sysParam.setValue(paramter.getThred());
        params.add(sysParam);
        unlistService.updata(sysParam);
        sysParam.setId(3);
        sysParam.setKey("x");
        sysParam.setValue(paramter.getX());
        params.add(sysParam);
        unlistService.updata(sysParam);
        sysParam.setId(4);
        sysParam.setKey("y");
        sysParam.setValue(paramter.getY());
        params.add(sysParam);
        unlistService.updata(sysParam);
        sysParam.setId(5);
        sysParam.setKey("width");
        sysParam.setValue(paramter.getWidth());
        unlistService.updata(sysParam);
        sysParam.setId(6);
        sysParam.setKey("length");
        sysParam.setValue(paramter.getLength());
        params.add(sysParam);
        unlistService.updata(sysParam);
        System.out.println(params);
        mv.addAttribute("parameter",params);
        return "/html/news/opt.jsp";
    }
}
