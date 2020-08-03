package com.zhao.bean;

public class Employee {
    private Integer empId;

    private String empName;

    private String gener;

    private String email;

    private Integer dId;

    private Department dep;

    public Employee(Integer empId, String empName, String gener, String email, Integer dId) {
        this.empId = empId;
        this.empName = empName;
        this.gener = gener;
        this.email = email;
        this.dId = dId;
    }

    public Employee() {
    }

    @Override
    public String toString() {
        return "Employee{" +
                "empId=" + empId +
                ", empName='" + empName + '\'' +
                ", gener='" + gener + '\'' +
                ", email='" + email + '\'' +
                ", dId=" + dId +
                ", dep=" + dep +
                '}';
    }

    public Department getDep() {
        return dep;
    }

    public void setDep(Department dep) {
        this.dep = dep;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    public String getGener() {
        return gener;
    }

    public void setGener(String gener) {
        this.gener = gener == null ? null : gener.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }
}