<%@ page import="java.util.List, pharmacy.entities.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="assets/css/output.css">
    <title>List of vente</title>
</head>
<body class="ml-20 mr-20" style="background-color: #e0ecec;">
    <div id="overlay" style="position: fixed;top: 0;left: 0;width: 100vw;background-color: black;height: 100vh;z-index: 100;opacity: 0;display: none;"></div>
    <jsp:include page="aside.jsp" />
    
<main class="ml-64 relative">
    <div class="container mx-auto">
        <div class="flex justify-between m-5">
            <h2 class="text-2xl font-bold mb-6">Sales</h2>    
            <button id="filterButton" class="bg-white text-gray-600 font-bold py-2 px-4 rounded-lg flex items-center">
                <i class="fas fa-filter mr-2"></i> Filter
            </button>
        </div>
        
        <div class="container mx-auto bg-white p-10 rounded-lg shadow-lg">
            <table class="table-auto w-full">
                <thead>
                    <tr class="text-left font-semibold text-gray-600 uppercase">
                        <th class="py-2 px-4">Date</th>
                        <th class="py-2 px-4">Client</th>
                        <th class="py-2 px-4">Medicine</th>
                        <th class="py-2 px-4">Quantite</th>
                        <th class="py-2 px-4">Price</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    
                        List<Sales> sales = (List<Sales>) request.getAttribute("sales");
                        for(Sales sale :sales)
                        {
                            List<SalesDetails> details = sale.getDetails();

                    %>
                    <tr class="border-b border-gray-200">
                        <td class="py-2 px-4" rowspan="<%= details.size() %>"><%= sale.getDate() %></td>
                        <td class="py-2 px-4" rowspan="<%= details.size() %>"><%= sale.getClient().getName() %></td>
                        <td class="py-2 px-4"><%= details.get(0).getMedDosage().getDisplayName() %></td>
                        <td class="py-2 px-4"><%= details.get(0).getQuantity() %></td>
                        <td class="py-2 px-4"><%= details.get(0).getUnitPrice() %></td>
                    </tr>
                        <%
                        
                        for(int i = 1; i < details.size(); i++) {

                        
                        
                        %>
                    <tr>
                        <td class="py-2 px-4"><%= details.get(i).getMedDosage().getDisplayName() %></td>
                        <td class="py-2 px-4"><%= details.get(i).getQuantity() %></td>
                        <td class="py-2 px-4"><%= details.get(i).getUnitPrice() %></td>
                    </tr>
                    <%

                        }

                    }

                    %>
                </tbody>
            
            </table>            
        </div>
    </div>
</main>
<div id="filterSidebar" class="w-80 h-screen bg-white shadow-lg z-100 p-6" style="position: fixed; top: 0; right: 0; transform: translateX(100%); z-index: 200; display: flex; flex-direction: column; justify-content: space-between;">
    <h3 class="text-lg font-bold mb-4">Filters</h3>
    <hr>
    <form action="sales-list" method="get" id="filterForm" style="flex-grow: 1; display: flex; flex-direction: column; justify-content: space-between;">
        <div>
            <div class="mb-4">
                <label for="laboratory" class="block text-gray-700 font-bold mb-2">Form :</label>
                <select id="form_med_id" name="form_med_id" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                    <option value="-1">None</option>
                    <%
                    
                    List<MedForm> medForms = (List<MedForm>) request.getAttribute("medForms");
                    for(MedForm l : medForms) {
                                            
                    %>
                        <option value="<%= l.getId() %>"><%= l.getName() %></option>
                    <%
                    
                    }
                    
                    %>
                </select>
            </div>
            <div class="mb-4">
                <label for="laboratory" class="block text-gray-700 font-bold mb-2">Age group :</label>
                <select id="age_categ_id" name="age_categ_id" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                    <option value="-1">None</option>
                    <%
                    
                    List<AgeGroup> ageGroups = (List<AgeGroup>) request.getAttribute("ageGroups");
                    for(AgeGroup l : ageGroups) {
                                            
                    %>
                        <option value="<%= l.getId() %>"><%= l.getName() %></option>
                    <%
                    
                    }
                    
                    %>
                </select>
            </div>
        <div>
            <hr>
            <button type="submit" class="bg-transparent hover:text-blue-950 text-blue-500 font-bold py-2 px-4">Done</button>
        </div>
    </form>
</div>
<script src="assets/script/script.js"></script>
</body>
</html>