package com.swz637.Bean;

import com.mysql.cj.jdbc.Blob;

import java.util.Arrays;

/**
 * @ author: lsq637
 * @ since: 2022-08-30 10:29:50
 * @ describe:
 */
public class Icon {
    private String id;
    private byte[] data;

    @Override
    public String toString() {
        return "Icon{" +
                "id=" + id +
                ", data=" + Arrays.toString(data) +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public byte[] getData() {
        return data;
    }

    public void setData(byte[] data) {
        this.data = data;
    }

    public Icon(String id, byte[] data) {
        this.id = id;
        this.data = data;
    }

    public Icon() {
    }
}
