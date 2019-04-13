package com.xiaoshu.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xiaoshu.admin.entity.Menu;
import com.xiaoshu.admin.entity.vo.ShowMenuVo;

import java.util.List;
import java.util.Map;

public interface MenuService extends IService<Menu> {

    List<ShowMenuVo> getShowMenuByUser(Integer userId);

    List<Menu> selectAllMenus(Map<String,Object> map);

    List<Menu> selectAllMenuList(Map<String,Object> map);

    Menu selectById(Integer parentId);

    Integer getCountByName(String name);

    Integer getCountByPermission(String permission);

    Integer selectFirstLevelMenuMaxSort();

    Integer seleclMenuMaxSortByPArentId(Integer parentId);

    void saveOrUpdateMenu(Menu menu);
}
