package com.dkd.manage.mapper;

import com.dkd.manage.domain.Emp;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * 工单员工Mapper接口
 *
 * @author ruoyi
 * @date 2025-11-10
 */
public interface EmpMapper {
    /**
     * 查询工单员工
     *
     * @param id 工单员工主键
     * @return 工单员工
     */
    Emp selectEmpById(Long id);

    /**
     * 查询工单员工列表
     *
     * @param emp 工单员工
     * @return 工单员工集合
     */
    List<Emp> selectEmpList(Emp emp);

    /**
     * 新增工单员工
     *
     * @param emp 工单员工
     * @return 结果
     */
    int insertEmp(Emp emp);

    /**
     * 修改工单员工
     *
     * @param emp 工单员工
     * @return 结果
     */
    int updateEmp(Emp emp);

    /**
     * 删除工单员工
     *
     * @param id 工单员工主键
     * @return 结果
     */
    int deleteEmpById(Long id);

    /**
     * 批量删除工单员工
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    int deleteEmpByIds(Long[] ids);

    /**
     * 根据区域id修改区域名称
     *
     * @param regionName
     * @param regionId
     * @return 结果
     */
    @Update("update tb_emp set region_name=#{regionName} where region_id=#{regionId}")
    int updateByRegionId(@Param("regionName") String regionName, @Param("regionId") Long regionId);
}
