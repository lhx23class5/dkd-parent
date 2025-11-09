package com.dkd.manage.domain;

import com.dkd.common.annotation.Excel;
import com.dkd.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 工单角色对象 tb_role
 *
 * @author ruoyi
 * @date 2025-11-10
 */
public class Role extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * $column.columnComment
     */
    private Long roleId;

    /**
     * 角色编码
     */
    @Excel(name = "角色编码")
    private String roleCode;

    /**
     * 角色名称
     */
    @Excel(name = "角色名称")
    private String roleName;

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public String getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE).append("roleId", getRoleId()).append("roleCode", getRoleCode()).append("roleName", getRoleName()).toString();
    }
}
