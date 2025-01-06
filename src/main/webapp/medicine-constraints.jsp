<%@ page import="java.util.List, pharmacy.entities.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="assets/css/output.css">
    <title>New medical constraint</title>
</head>
<body class="ml-20 mr-20" style="background-color: #e0ecec;">

        <jsp:include page="aside.jsp" />

    <main class="ml-64 pt-5 flex">

    <%
    
    Medicine m = (Medicine) request.getAttribute("medicine");
    List<MedicalConstraint> mConstraints = (List<MedicalConstraint>) request.getAttribute("medConstraints");
    List<MedicalConstraint> list = (List<MedicalConstraint>) request.getAttribute("constraintsList");
    
    %>
        <div id="medical-constraints" class="container mx-auto">
            <h2 class="text-2xl font-bold mb-6">Constraints of <%= m.getName() %></h2>
            <div class=" bg-white p-6 rounded-lg">   
                <div class="mb-8">
                    <h4 class="text-gray-800 font-semibold">Current Constraints</h4>
                    <ul class="list-none space-y-3 text-gray-700">
                        <%
                        
                        for(MedicalConstraint mc : mConstraints) {

                        
                        %>
                        <li class="flex items-center">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2 text-red-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                            </svg>
                            <span><%= mc.getName() %></span>
                        </li>

                        <%
                        
                        }
                        
                        %>
                        
                    </ul>
                </div>
                <form action="new-constraints" method="post">
                <input type="hidden" name="medId" value="<%= m.getId() %>">
                    <div class="mb-4">
                        <label for="constraint" class="block text-gray-700 font-bold mb-2">Constraints :</label>
                        <select id="constraint" name="constraint" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                            <%
                            
                            for(MedicalConstraint mc : list) {

                            %>

                            <option value="<%= mc.getId() %>"><%= mc.getName() %></option>

                            <%

                            }
                            
                            %>
                        </select>
                    </div>
        
                    <div class="flex items-center justify-between">
                        <div class="flex items-center">
                            <button type="submit" class="mr-2 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                                Add
                            </button>
                            <button class="mr-2 bg-transparent text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="submit">
                                <a href="#" class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800">
                                    Finish
                                </a>
                            </button>
                        </div>
                        <%-- <a href="#" class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800">
                            Cancel
                        </a> --%>
                    </div>
                </form>
            </div>
        </div>
    </main>
    <script src="assets/script/script.js"></script>
</body>
</html>