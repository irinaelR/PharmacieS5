<%@ page import="java.util.List, pharmacy.entities.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdn.tailwindcss.com"></script> 
    <link rel="stylesheet" href="assets/css/output.css">
    <title>New medicine</title>
</head>
<body class="ml-20 mr-20" style="background-color: #e0ecec;">
        <jsp:include page="aside.jsp" />

<main class="ml-64 pt-5 flex">
    <div id="medicine" class="container mx-auto">
        <h2 class="text-2xl font-bold mb-6">New medicine</h2>

        <div class="bg-white rounded-lg shadow-md p-6">
            <form action="new-medicine" method="post">
            <%
            
            String action = request.getParameter("action");
            Medicine medicine = null;

            String nameValue = "";
            int labId = -1;
            int categId = -1;
            String yesChecked = "";
            String noChecked = "";

            if(action != null && action.equalsIgnoreCase("update")) {
                medicine = (Medicine) request.getAttribute("medicine");
                nameValue = medicine.getName();
                categId = medicine.getCategoryId();
                labId = medicine.getLabId();
                yesChecked = medicine.getNeedsNotice() ? "checked" : "";
                noChecked = !medicine.getNeedsNotice() ? "checked" : "";
            %>

            <input type="hidden" name="action" value="<%= action %>">    
            <input type="hidden" name="id" value="<%= medicine.getId() %>">

            <%

            }
            
        
            %>
                <div class="mb-4">
                    <label for="name" class="block text-gray-700 font-bold mb-2">Name :</label>
                    <input type="text" id="name" name="name" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="<%= nameValue %>">
                </div>

                <div class="mb-4">
                    <label for="laboratory" class="block text-gray-700 font-bold mb-2">Laboratory :</label>
                    <select id="laboratory" name="laboratory" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                        <%
                        
                        List<Laboratory> labs = (List<Laboratory>) request.getAttribute("laboratories");
                        for(Laboratory lab : labs) {
                            String selected = "";
                            if(lab.getId() == labId) {
                                selected = "selected";
                            }
                        %>

                        <option value="<%= lab.getId() %>" <%= selected %>><%= lab.getName() %></option>

                        <% 
                        
                        }
                        
                        %>
                    </select>
                </div>

                <div class="mb-4">
                    <label for="category" class="block text-gray-700 font-bold mb-2">Category :</label>
                    <select id="category" name="category" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                        <%
                        
                        List<MedCategory> categories = (List<MedCategory>) request.getAttribute("categories");
                        for(MedCategory categ : categories) {
                            String selected = "";
                            if(categ.getId() == categId) {
                                selected = "selected";
                            }

                        %>

                        <option value="<%= categ.getId() %>" <%= selected %>><%= categ.getName() %></option>

                        <% 
                        
                        }
                        
                        %>
                    </select>
                </div>

                <div class="mb-4">
                    <label for="needsNotice" class="block text-gray-700 font-bold mb-2">Need notice :</label>
                    <input type="radio" id="needsNotice" name="needsNotice" class="w-50" value="true" <%= yesChecked %>> Yes
                    <input type="radio" id="needsNotice" name="needsNotice" class="w-50" value="false" <%= noChecked %>> No
                </div>

                <div class="flex items-center justify-between">
                    <button id="ok_button" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                        Ok
                    </button>
                </div>
            </form>
        </div>

    </div>
</main>
<script src="assets/script/script.js"></script>
</body>
</html>
