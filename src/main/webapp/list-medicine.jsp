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
            <h2 class="text-2xl font-bold mb-6">Medicines</h2>

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
                        <th class="py-2 px-4">Actions</th>
                    </tr>
                </thead>
                <tbody>
                <%
                
                List<Medicine> medicines = (List<Medicine>) request.getAttribute("medicines");
                for(Medicine m : medicines) {
                    String checked = "";
                    if(m.getNeedsNotice()) {
                        checked = "checked";
                    }
                
                %>
                    <tr class="border-b border-gray-200 cursor-pointer" onclick="window.location.href='medicine-details.jsp'">
                        <td class="py-2 px-4"><%= m.getName() %></td>
                        <td class="py-2 px-4"><%= m.getLaboratory().getName() %></td>
                        <td class="py-2 px-4"><%= m.getCategory().getName() %></td>
                        <td class="py-2 px-4">
                            <input type="checkbox" disabled <%= checked %>>
                        </td>
                        <td class="py-2 px-4 flex space-x-2">
                            <div class="flex justify-between">
                                <button onclick="event.stopPropagation(); window.location.href='medicines?action=del&medicineId=<%= m.getId() %>';" class="border-2 border-gray-400 hover:border-gray-500 hover:text-gray-500 text-xs w-full mt-2 text-gray-400 font-bold py-1.5 px-4 rounded-lg mr-2" type="button"><i class="fa-solid fa-trash-can mr-2"></i>Delete</button>
                                <button onclick="event.stopPropagation(); window.location.href='update-medicine.jsp';" class="border-2 border-gray-400 hover:border-gray-500 hover:text-gray-500 text-xs w-full mt-2 text-gray-400 font-bold py-1.5 px-4 rounded-lg mr-2" type="button"><i class="fa-solid fa-pen-to-square mr-2"></i>Update</button>
                            </div>
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
    <h3 class="text-lg font-bold mb-4">Filters</h3>
    <hr>
    <form action="medicines" method="get" id="filterForm" style="flex-grow: 1; display: flex; flex-direction: column; justify-content: space-between;">
        <div>
            <div class="mb-4">
                <label for="laboratory" class="block text-gray-700 font-bold mb-2">Lab :</label>
                <select id="laboratory" name="laboratory" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                    <option value="-1">None</option>
                    <%
                    
                    List<Laboratory> laboratories = (List<Laboratory>) request.getAttribute("labs");
                    for(Laboratory l : laboratories) {
                                            
                    %>
                        <option value="<%= l.getId() %>"><%= l.getName() %></option>
                    <%
                    
                    }
                    
                    %>
                </select>
            </div>
            <div class="mb-4">
                <label for="category" class="block text-gray-700 font-bold mb-2">Category :</label>
                <select id="category" name="category" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                    <option value="-1">None</option>
                    <%
                    
                    List<MedCategory> categories = (List<MedCategory>) request.getAttribute("medCategories");
                    for(MedCategory mc : categories) {
                                            
                    %>
                        <option value="<%= mc.getId() %>"><%= mc.getName() %></option>
                    <%
                    
                    }
                    
                    %>
                </select>
            </div>
            <div class="mb-4">
                <label for="needsNotice" class="block text-gray-700 font-bold mb-2">Needs Notice :</label>
                <input id="needsNotice" name="needsNotice" type="radio" value="true"> Yes
                <input id="needsNotice" name="needsNotice" type="radio" value="false"> No
            </div>
            <div class="mb-4">
                <label for="constraint" class="block text-gray-700 font-bold mb-2">Constraints :</label>
                <select id="constraint" name="constraint" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                    <option value="-1">None</option>
                    <%
                    
                    List<MedicalConstraint> constraints = (List<MedicalConstraint>) request.getAttribute("constraints");
                    for(MedicalConstraint mc : constraints) {
                                            
                    %>
                        <option value="<%= mc.getId() %>"><%= mc.getName() %></option>
                    <%
                    
                    }
                    
                    %>
                </select>
            </div>
            <div class="mb-4">
                <label for="minPrice" class="block text-gray-700 font-bold mb-2">Min Price :</label>
                <input type="number" id="minPrice" name="minPrice" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="mb-4">
                <label for="maxPrice" class="block text-gray-700 font-bold mb-2">Max Price :</label>
                <input type="number" id="maxPrice" name="maxPrice" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
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