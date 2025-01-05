<%@ page import="java.util.List, pharmacy.entities.Illness" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="assets/css/output.css">
    <title>New illness</title>
</head>
<body class="ml-20 mr-20" style="background-color: #e0ecec;">

        <jsp:include page="aside.jsp" />

<main class="ml-64 pt-5 flex">
    <div class="container mx-auto">
        <h2 class="text-2xl font-bold mb-6">New illness</h2>

        <div class="bg-white rounded-lg shadow-md p-6">
            <form action="new-illness" method="post">
                <%
                
                String action = request.getParameter("action");
                Illness i = null;

                String nameValue = "";
                String descValue = "";
                String yesChecked = "";
                String noChecked = "";

                if(action != null && action.equalsIgnoreCase("update")) { 
                
                    i = (Illness) request.getAttribute("illness");
                    nameValue = i.getName();
                    descValue = i.getDescri();
                    yesChecked = i.getIsChronic() ? "checked" : "";
                    noChecked = !i.getIsChronic() ? "checked" : "";
                
                %>

                <input type="hidden" name="action" value="<%= action %>">    
                <input type="hidden" name="id" value="<%= i.getId() %>">    

                <%

                }
                
                %>
                <div class="mb-4">
                    <label for="name" class="block text-gray-700 font-bold mb-2">Name :</label>
                    <input type="text" id="name" name="name" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" value="<%= nameValue %>">
                </div>

                <div class="mb-4">
                    <label for="description" class="block text-gray-700 font-bold mb-2">Description :</label>
                    <textarea id="description" name="descri" rows="4" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"><%= descValue %></textarea>
                </div>

                <div class="mb-4">
                    <label for="isChronic" class="block text-gray-700 font-bold mb-2">Is chronic :</label>
                    <input type="radio" id="isChronic" name="isChronic" value="true" class="w-50" <%= yesChecked %>> Yes
                    <input type="radio" id="isChronic" name="isChronic" value="false" class="w-50" <%= noChecked %>> No
                </div>

                <div class="flex items-center justify-between">
                    <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="submit">
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