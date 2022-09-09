package com.swz637.Bean;

/**
 * @ author: lsq637
 * @ since: 2022-08-28 10:12:06
 * @ describe:
 */
public class User {
    private int uid;
    private String uName;
    private String pwd;

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", uName='" + uName + '\'' +
                ", pwd='" + pwd + '\'' +
                '}';
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public User() {
    }

    public User(int uid, String uName, String pwd) {
        this.uid = uid;
        this.uName = uName;
        this.pwd = pwd;
    }
}
