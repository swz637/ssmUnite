package com.swz637.Dao;

import com.swz637.Bean.Icon;

import java.sql.Blob;

/**
 * @ author: lsq637
 * @ since: 2022-08-30 10:29:35
 * @ describe:
 */
public interface IconMapper {
    void save(Icon img);
    Icon getById(String id);
    void updateImg(Icon img);
}
