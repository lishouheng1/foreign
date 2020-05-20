package com.lishouheng.mengniu.bean;

import lombok.Data;

@Data
public class Parameter {
//    灵敏度
    private Integer ssty;
//    阈值
    private Integer thred;
//    框点X坐标
    private Integer x;
//     框点Y坐标
    private Integer y;
//    框宽度
    private Integer width;
//    框长度
    private Integer length;

    public Parameter(Integer ssty, Integer thred, Integer x, Integer y, Integer width, Integer length) {
        this.ssty = ssty;
        this.thred = thred;
        this.x = x;
        this.y = y;
        this.width = width;
        this.length = length;
    }

    public Integer getSsty() {
        return ssty;
    }

    public void setSsty(Integer ssty) {
        this.ssty = ssty;
    }

    public Integer getThred() {
        return thred;
    }

    public void setThred(Integer thred) {
        this.thred = thred;
    }

    public Integer getX() {
        return x;
    }

    public void setX(Integer x) {
        this.x = x;
    }

    public Integer getY() {
        return y;
    }

    public void setY(Integer y) {
        this.y = y;
    }

    public Integer getWidth() {
        return width;
    }

    public void setWidth(Integer width) {
        this.width = width;
    }

    public Integer getLength() {
        return length;
    }

    public void setLength(Integer length) {
        this.length = length;
    }

    @Override
    public String toString() {
        return "Parameter{" +
                "ssty=" + ssty +
                ", thred=" + thred +
                ", x=" + x +
                ", y=" + y +
                ", width=" + width +
                ", length=" + length +
                '}';
    }
}
