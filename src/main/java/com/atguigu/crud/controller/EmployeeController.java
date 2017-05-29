package com.atguigu.crud.controller;

import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.bean.Msg;
import com.atguigu.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
     * 使用返回json的形式:需要导入jackJson包
     *
     * @param pn
     * @return
     */
    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
        List<Employee> employeeList = employeeService.getAll(pn);
        PageInfo<Employee> pageInfo = new PageInfo<Employee>(employeeList, 5);   //连续传入5页
        return Msg.success().add("pageInfo", pageInfo);
    }

    /**
     * list 页面进行展示:查询员工数据(分页查询)
     *
     * @return
     */
//    @RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {  //pageNum
        PageHelper.startPage(pn, 5);
        List<Employee> employeeList = employeeService.getAll(pn);
        PageInfo<Employee> pageInfo = new PageInfo<Employee>(employeeList, 5);   //连续传入5页
        model.addAttribute("pageInfo", pageInfo);
        return "list";
    }

    /**
     * 员工保存,post
     *
     * @return
     */
    @RequestMapping(value = "/emp", method = RequestMethod.POST)
    @ResponseBody //表示返回json
    public Msg saveEmp(Employee employee) {
        employeeService.saveEmp(employee);
        return Msg.success();
    }

    /**
     * 检测用户名是否可用
     */

    @RequestMapping(value = "/checkuser", method = RequestMethod.POST)
    @ResponseBody //表示返回json
    public Msg checkUser(@RequestParam("empName") String empName) {
        boolean hasUser = employeeService.checkUser(empName);
        if (hasUser) {
            return Msg.success();
        }
        return Msg.fail();
    }
}
