<%@ page import="java.util.List, pharmacy.entities.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="assets/css/output.css">
    <title>Document</title>
</head>
<body class="ml-20 mr-20" style="background-color: #e0ecec;">
    <div id="overlay" style="position: fixed;top: 0;left: 0;width: 100vw;background-color: black;height: 100vh;z-index: 100;opacity: 0;display: none;"></div>
    <jsp:include page="aside.jsp" />
<main class="ml-64 relative">
    <div class="container mx-auto">
        <div class="flex justify-between m-5">
        <%
        
        String ymString = (String) request.getAttribute("ymString");
        if(ymString == null || ymString.isBlank()) {
            ymString = (String) request.getAttribute("year");
        }
        
        %>
            <h2 class="text-2xl font-bold mb-6">List recommended products for <%= ymString %></h2>

            <button id="filterButton" class="bg-white text-gray-600 font-bold py-2 px-4 rounded-lg flex items-center">
                <i class="fas fa-filter mr-2"></i> Filter
            </button>
        </div>
        
        <div class="container mx-auto bg-white p-10 rounded-lg shadow-lg">
            <table class="table-auto w-full">
                <thead>
                    <tr class="text-left font-semibold text-gray-600 uppercase">
                        <th class="py-2 px-4">Name</th>
                        <th class="py-2 px-4">Lab</th>
                        <th class="py-2 px-4">Category</th>
                        <th class="py-2 px-4">Needs Notice</th>
                        <th class="py-2 px-4">Date</th>
                    </tr>
                </thead>
                <tbody>
                <%
                
                List<Medicine> medicines = (List<Medicine>) request.getAttribute("medicines");
                List<ProductMonth> pm = (List<ProductMonth>) request.getAttribute("months");
                for(int i = 0; i < medicines.size(); i++) {
                    Medicine m = medicines.get(i);
                    ProductMonth mo = pm.get(i);
                    String checked = "";
                    if(m.getNeedsNotice()) {
                        checked = "checked";
                    }
                
                %>
                    <tr class="border-b border-gray-200 cursor-pointer" onclick="window.location.href='medicine-details?medId=<%= m.getId() %>'">
                        <td class="py-2 px-4"><%= m.getName() %></td>
                        <td class="py-2 px-4"><%= m.getLaboratory().getName() %></td>
                        <td class="py-2 px-4"><%= m.getCategory().getName() %></td>
                        <td class="py-2 px-4">
                            <input type="checkbox" disabled <%= checked %>>
                        </td>
                        <td class="py-2 px-4 flex space-x-2">
                            <%= mo.getDateValidity() %>
                        </td>
                    </tr>
                <%
                }
                %>
                </tbody>
            </table>
            
        </div>
    </div>
    
</main>
<div id="filterSidebar" class="w-80 h-screen bg-white shadow-lg z-100 p-6" style="position: fixed; top: 0; right: 0; transform: translateX(100%); z-index: 200; display: flex; flex-direction: column; justify-content: space-between;">
    <!-- <h3 class="text-lg font-bold mb-4">Filters</h3> -->
    <!-- <hr> -->
    <form action="list-product-month" method="get" id="filterForm" style="flex-grow: 1; display: flex; flex-direction: column; justify-content: space-between;">
        <div>
            <div class="mb-4">
                <label for="month" class="block text-gray-700 font-bold mb-2">Month :</label>
                <input type="month" id="month" name="month" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="">
            </div>
            <div class="mb-4">
                <label for="year" class="block text-gray-700 font-bold mb-2">Year :</label>
                <input type="number" id="year" name="year" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="">
            </div>

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