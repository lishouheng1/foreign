package com.lishouheng.mengniu.init;

import com.lishouheng.mengniu.bean.Parameter;
import com.lishouheng.mengniu.bean.SysParam;
import com.lishouheng.mengniu.netty.ChineseProverbServer;
import com.lishouheng.mengniu.service.UnlistService;
import org.opencv.core.Core;
import org.opencv.videoio.VideoCapture;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@Component
public class AutoRun{
    // 创建一个可重用固定个数的线程池
    ExecutorService fixedThreadPool = Executors.newFixedThreadPool(1);
    @PostConstruct
    public void init() {
        fixedThreadPool.execute(new Runnable() {
            @Override
            public void run() {
                System.out.println("程序已经执行");
                try{
                    System.loadLibrary(Core.NATIVE_LIBRARY_NAME);
                    int port=5020;
                    System.out.println(port);
                    new ChineseProverbServer().run(port);
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
        });
    }

}
