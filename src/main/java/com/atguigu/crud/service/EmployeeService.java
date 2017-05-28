package com.atguigu.crud.service;

import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lucio on 28/05/2017.
 */
@Service
public class EmployeeService {

    @Autowired(required=false)
    EmployeeMapper employeeMapper;

    /**
     * 查询员工所有数据(分页查询)
     *
     * @return
     * @param pn
     */
    public List<Employee> getAll(Integer pn) {
        return employeeMapper.selectByExampleWithDept(null);//查询所有,没有条件
    }
}
