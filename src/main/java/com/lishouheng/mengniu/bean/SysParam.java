package com.lishouheng.mengniu.bean;

public class SysParam {

    private Integer id;

    private String k;

    private Integer v;

    public SysParam() {
    }

    public SysParam(String k, Integer v) {
        this.k = k;
        this.v = v;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getK() {
        return k;
    }

    public void setK(String k) {
        this.k = k;
    }

    public Integer getV() {
        return v;
    }

    public void setV(Integer v) {
        this.v = v;
    }
}
