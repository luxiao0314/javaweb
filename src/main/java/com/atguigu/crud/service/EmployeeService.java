package com.atguigu.crud.service;

import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.bean.EmployeeExample;
import com.atguigu.crud.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lucio on 28/05/2017.
 */
@Service
public class EmployeeService {

    @Autowired(required = false)
    EmployeeMapper employeeMapper;

    /**
     * 查询员工所有数据(分页查询)
     *
     * @param pn
     * @return
     */
    public List<Employee> getAll(Integer pn) {
        return employeeMapper.selectByExampleWithDept(null);//查询所有,没有条件
    }

    /**
     * 保存员工信息
     *
     * @param employee
     */
    public void saveEmp(Employee employee) {
        employeeMapper.insertSelective(employee);
    }

    /**
     * 检测名字是否可用,去重复
     *
     * @param empName
     * @return FALSE :名字不可用
     */
    public boolean checkUser(String empName) {
        EmployeeExample employee = new EmployeeExample();
        EmployeeExample.Criteria criteria = employee.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        //如果有返回记录数
        long l = employeeMapper.countByExample(employee);
        return l == 0;
    }
}
