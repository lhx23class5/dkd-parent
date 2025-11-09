package com.dkd.manage.service.impl;

import com.dkd.common.utils.DateUtils;
import com.dkd.manage.domain.Emp;
import com.dkd.manage.domain.Role;
import com.dkd.manage.mapper.EmpMapper;
import com.dkd.manage.mapper.RegionMapper;
import com.dkd.manage.mapper.RoleMapper;
import com.dkd.manage.service.IEmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 工单员工Service业务层处理
 *
 * @author ruoyi
 * @date 2025-11-10
 */
@Service
public class EmpServiceImpl implements IEmpService {
    @Autowired
    private EmpMapper empMapper;
    @Autowired
    private RegionMapper regionMapper;
    @Autowired
    private RoleMapper roleMapper;

    /**
     * 查询工单员工
     *
     * @param id 工单员工主键
     * @return 工单员工
     */
    @Override
    public Emp selectEmpById(Long id) {
        return empMapper.selectEmpById(id);
    }

    /**
     * 查询工单员工列表
     *
     * @param emp 工单员工
     * @return 工单员工
     */
    @Override
    public List<Emp> selectEmpList(Emp emp) {
        return empMapper.selectEmpList(emp);
    }

    /**
     * 批量删除工单员工
     *
     * @param ids 需要删除的工单员工主键
     * @return 结果
     */
    @Override
    public int deleteEmpByIds(Long[] ids) {
        return empMapper.deleteEmpByIds(ids);
    }

    /**
     * 删除工单员工信息
     *
     * @param id 工单员工主键
     * @return 结果
     */
    @Override
    public int deleteEmpById(Long id) {
        return empMapper.deleteEmpById(id);
    }

    /**
     * 新增人员列表
     *
     * @param emp 人员列表
     * @return 结果
     */
    @Override
    public int insertEmp(Emp emp) {
        // 补充区域名称
        emp.setRegionName(regionMapper.selectRegionById(emp.getRegionId()).getRegionName());
        // 补充角色信息
        Role role = roleMapper.selectRoleByRoleId(emp.getRoleId());
        emp.setRoleName(role.getRoleName());
        emp.setRoleCode(role.getRoleCode());
        emp.setCreateTime(DateUtils.getNowDate());
        return empMapper.insertEmp(emp);
    }

    /**
     * 修改人员列表
     *
     * @param emp 人员列表
     * @return 结果
     */
    @Override
    public int updateEmp(Emp emp) {
        // 补充区域名称
        emp.setRegionName(regionMapper.selectRegionById(emp.getRegionId()).getRegionName());
        // 补充角色信息
        Role role = roleMapper.selectRoleByRoleId(emp.getRoleId());
        emp.setRoleName(role.getRoleName());
        emp.setRoleCode(role.getRoleCode());
        emp.setUpdateTime(DateUtils.getNowDate());
        return empMapper.updateEmp(emp);
    }
}
