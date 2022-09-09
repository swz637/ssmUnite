package com.swz637.Service;

import com.swz637.Bean.Icon;

import java.sql.Blob;

/**
 * @ author: lsq637
 * @ since: 2022-08-30 10:36:00
 * @ describe:
 */
public interface IconService {
    void save(Icon img);
    Icon getById(String id);
    void updateImg(Icon img);
}
