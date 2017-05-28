package com.atguigu.crud.controller;

import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @Description 处理员工crud请求
 * @Author lucio
 * @Email lucio0314@163.com
 * @Date
 * @Version
 */
@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    /**
     * list 页面进行展示:查询员工数据(分页查询)
     * @return
     */
    @RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model){  //pageNum
        PageHelper.startPage(pn,5);
        List<Employee> employeeList = employeeService.getAll(pn);
        PageInfo<Employee> pageInfo = new PageInfo<Employee>(employeeList,5);   //连续传入5页
        model.addAttribute("pageInfo",pageInfo);
        return "list";
    }
}
