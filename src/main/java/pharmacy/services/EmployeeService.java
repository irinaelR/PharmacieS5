package pharmacy.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import pharmacy.entities.*;

public class EmployeeService extends Service {

    private SalesService salesService;

    public EmployeeService() throws Exception {
        super();
        this.salesService = new SalesService();
    }

    public Employee findById(int id) throws Exception {
        Object o = this.getQueryManager().findById(null, new Employee(id));
        return (o == null) ? null : (Employee) o;
    }

    private void populateList(List<Employee> employees, List<Object> obj) {
        for (Object object : obj) {
            employees.add((Employee) object);
        }
    }

    public List<Employee> getAll(String[] conditions, Object[] values, String[] afterWhere) throws Exception {
        List<Employee> results = new ArrayList<>();
        List<Object> obj = this.getQueryManager().find(null, Employee.class, conditions, values, afterWhere);
        populateList(results, obj);
        return results;
    }

    public List<Sales> getEmpSales(String empId, String dateMin, String dateMax) throws Exception {
        String[] conditions = salesService.filterConditions(null, null, empId, dateMin, dateMax);
        Object[] values = salesService.filterValues(null, null, empId, dateMin, dateMax);

        return salesService.getAll(conditions, values, null);
    }

    public double getTotalCommissions(String empId, String dateMin, String dateMax) throws Exception {
        List<Sales> sales = getEmpSales(empId, dateMin, dateMax);
        double total = 0;

        for (Sales s : sales) {
            total += salesService.getTotalCommission(s);
        }

        return total;
    }

    public Map<Employee, Double> getCommissionsPerEmp(String dateMin, String dateMax) throws Exception {
        Map<Employee, Double> results = new HashMap<>();

        List<Employee> emps = getAll(null, null, null);
        for (Employee employee : emps) {
            double com = getTotalCommissions(employee.getId() + "", dateMin, dateMax);
            results.put(employee, com);
        }

        return results;
    }
    
}
