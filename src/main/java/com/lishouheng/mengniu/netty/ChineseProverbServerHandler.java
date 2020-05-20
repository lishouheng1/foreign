package com.lishouheng.mengniu.netty;

import com.lishouheng.mengniu.bean.Parameter;
import com.lishouheng.mengniu.bean.SysParam;
import com.lishouheng.mengniu.init.AutoRun;
import com.lishouheng.mengniu.opencv.OpencvOpt;
import com.lishouheng.mengniu.service.UnlistService;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.channel.socket.DatagramPacket;
import org.opencv.core.Mat;
import org.opencv.videoio.VideoCapture;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StopWatch;

import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.List;


public class ChineseProverbServerHandler extends SimpleChannelInboundHandler<DatagramPacket>
{
    VideoCapture capture =new VideoCapture(1);
    {capture.open(1);
   }

    Parameter p=new Parameter(120,10,50,50,400,400);
    StopWatch sw =new StopWatch("OpencvOpt");
    String next=null;
    Mat dst = new Mat();
    Mat src1 = new Mat();
    Mat src = new Mat();
    byte[] bys=new byte[1024];
    byte[] by =new byte[26];
    DatagramSocket  ds=null;
    byte[] bys1 = "OPEN1".getBytes();
    byte[] bys2="CLOSEALL".getBytes();
    // 2-长度
    int len1 = bys1.length;
    int len2=bys2.length;
    // 3-IP地址
    InetAddress address;

    {
        try {
            ds=new DatagramSocket();
            address = InetAddress.getByName("192.168.1.50");
        } catch (UnknownHostException e) {
            e.printStackTrace();
        } catch (SocketException e) {
            e.printStackTrace();
        }
    }

    // 4-端口
    int port = 502;
    java.net.DatagramPacket dp1 = new java.net.DatagramPacket(bys1,len1,address,port);
    java.net.DatagramPacket dp2 = new java.net.DatagramPacket(bys2,len2,address,port);

    @Override
    public void exceptionCaught(ChannelHandlerContext ctx,Throwable cause)
        throws Exception{
//      ctx.close();
        cause.printStackTrace();
    }

    @Override
    protected void channelRead0(ChannelHandlerContext ctx,DatagramPacket packet) throws Exception {
        //利用ByteBuf的toString()方法获取请求消息
        packet.content().getBytes(0,by);
        String btr=getBufHexStr(by);
        System.out.println(btr);
        String str = btr.substring(21, 22);
        System.out.println(str);
        if("3".equals(str)&&!"B".equals(next)){
sw.start("OpencvOpt.OpencvOpt");
            if (OpencvOpt.OpencvOpt(p,capture,dst,src1,src)){
                // 回复一条信息给客户端
                ds.send(dp1);
                sw.stop();
                System.out.println(sw.prettyPrint());
            }else {

                System.out.println("正常");
                sw.stop();
                System.out.println(sw.prettyPrint());
            }

        }

        if("6".equals(str)){
            //创建新的DatagramPacket对象，传入返回消息和目的地址（IP和端口）
            // 回复一条信息给客户端
                ds.send(dp2);
        }
        next=str;
    }

    public static String getBufHexStr(byte[] raw){
        String HEXES = "0123456789ABCDEF";
        if ( raw == null ) {
            return null;
        }
        final StringBuilder hex = new StringBuilder( 2 * raw.length );
        for ( final byte b : raw ) {
            hex.append(HEXES.charAt((b & 0xF0) >> 4))
                    .append(HEXES.charAt((b & 0x0F)));
        }
        return hex.toString();
    }
//    public static void SendInfo(DatagramSocket ds, byte[] bys,java.net.DatagramPacket dp) throws IOException
//    {
//        //（3）调用socket对象的发送方法发送数据包
//        ds.send(dp);
//        System.out.println(dp);
////        byte[] byr = new byte[1024];
////        int lens = byr.length;
////        java.net.DatagramPacket dpr = new java.net.DatagramPacket(byr, lens);
////        ds.receive(dpr);
////        InetAddress address2 = dpr.getAddress();
////        String ip = address2.getHostAddress();
////        byte[] bys2 = dpr.getData();
////        int len2 = dpr.getLength();
////        String s = new String(bys2, 0, len2);
////        System.out.println(ip + ":" + s);
//    }
}