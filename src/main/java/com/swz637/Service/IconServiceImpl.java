package com.swz637.Service;

import com.swz637.Bean.Icon;
import com.swz637.Dao.IconMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.sql.Blob;

/**
 * @ author: lsq637
 * @ since: 2022-08-30 10:36:36
 * @ describe:
 */
public class IconServiceImpl implements IconService{
    @Autowired
    IconMapper iconMapper;
    @Override
    public void save(Icon img) {
        iconMapper.save(img);
    }

    @Override
    public Icon getById(String id) {
        return iconMapper.getById(id);
    }

    @Override
    public void updateImg(Icon img) {
        iconMapper.updateImg(img);
    }
}
