<%@ page import="java.util.List, pharmacy.entities.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdn.tailwindcss.com"></script> 
    <link rel="stylesheet" href="assets/css/output.css">
    <title>New vente</title>
</head>
<body class="ml-20 mr-20" style="background-color: #e0ecec;">
        <jsp:include page="aside.jsp" />

<main class="ml-64 pt-5 flex">
    <div id="medicine" class="container mx-auto">
        <h2 class="text-2xl font-bold mb-6">Vente</h2>

        <div class="bg-white rounded-lg shadow-md p-6">
            <form action="sales" method="post">

                <div class="mb-4">
                    <label for="date_sales" class="block text-gray-700 font-bold mb-2">Date :</label>
                    <input type="date" id="date_sales" name="date_sales" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="">
                </div>

                <div class="mb-4">
                    <label for="id_client" class="block text-gray-700 font-bold mb-2">Client :</label>
                    <select id="id_client" name="id_client" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                        <%
                        
                        List<Client> clients = (List<Client>) request.getAttribute("clients");
                        for(Client client : clients) {
                            String selected = "";
    
                        %>

                        <option value="<%= client.getId() %>" <%= selected %>><%= client.getName() %></option>

                        <% 
                        
                        }
                        
                        %>
                    </select>
                </div>

                
                <div class="mb-4">
                    <label for="employee" class="block text-gray-700 font-bold mb-2">Employee :</label>
                    <select id="employee" name="employee" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                        <%

                        List<Employee> emps = (List<Employee>) request.getAttribute("employees");
                        for(Employee emp : emps) {
                            String selected = "";
    
                        %>

                        <option value="<%= emp.getId() %>" ><%= emp.getName() %></option>

                        <% 
                        
                        }
                        
                        %>
                    </select>
                </div>

                <!-- <div class="mb-4">
                    <label for="commission" class="block text-gray-700 font-bold mb-2">Commission :</label>
                    <input type="number" id="commission" name="commission" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="">
                </div> -->

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
