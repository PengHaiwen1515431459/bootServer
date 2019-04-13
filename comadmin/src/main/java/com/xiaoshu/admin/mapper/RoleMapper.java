package com.xiaoshu.admin.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xiaoshu.admin.entity.Menu;
import com.xiaoshu.admin.entity.Role;
import java.util.Set;

import org.apache.ibatis.annotations.Param;

public interface RoleMapper extends BaseMapper<Role> {

    void saveRoleMenus(@Param("roleId") Integer roleId,  @Param("menus") Set<Menu> menuSet);

    Role selectRoleById(@Param("roleId") Integer roleId);

    void dropRoleMenus(@Param("roleId") Integer roleId);

    void dropRoleUsers(@Param("roleId") Integer roleId);
}