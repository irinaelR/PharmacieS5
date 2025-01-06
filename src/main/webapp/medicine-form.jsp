<%@ page import="java.util.List, pharmacy.entities.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="assets/css/output.css">
    <title>Forms of medicine</title>
</head>
<body class="ml-20 mr-20" style="background-color: #e0ecec;">

        <jsp:include page="aside.jsp" />

    <main class="ml-64 pt-5 flex">
        <div id="med_form" class="container mx-auto">
        <%
        
        Medicine m = (Medicine) request.getAttribute("medicine");
        
        %>
            <h2 class="text-2xl font-bold mb-6">Forms of <%= m.getName() %></h2>
        
            <div class="bg-white rounded-lg shadow-md p-6">
                <form action="new-form" method="post">
                    <input type="hidden" name="medId" value="<%= m.getId() %>" />
                    <div class="mb-4">
                        <label for="form" class="block text-gray-700 font-bold mb-2">Form :</label>
                        <select id="form" name="form" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                            <%
                            
                            List<MedForm> forms = (List<MedForm>) request.getAttribute("forms");
                            for(MedForm form : forms) {

                            %>

                            <option value="<%= form.getId() %>"><%= form.getName() %></option>

                            <%

                            }

                            %>
                        </select>
                    </div>
        
                    <div class="mb-4">
                        <label for="dose" class="block text-gray-700 font-bold mb-2">Dose :</label>
                        <div class="flex w-full">
                            <input type="number" id="dose" name="dose" rows="4" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                            <select id="measuring_unit" name="measuring_unit" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                                <%
                                
                                List<MeasuringUnit> units = (List<MeasuringUnit>) request.getAttribute("units");
                                for(MeasuringUnit unit : units) {

                                %>

                                <option value="<%= unit.getId() %>"><%= unit.getName() %></option>

                                <%

                                }
                                
                                %>
                            </select>
                        </div>
                    </div>
        
                    <div class="mb-4">
                        <label for="price" class="block text-gray-700 font-bold mb-2">Price :</label>
                        <input type="number" id="price" name="price" rows="4" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                    </div>
        
                    <div class="flex items-center justify-between">
                        <div class="flex items-center">
                            <button type="submit" class="mr-2 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                                Add
                            </button>
                            <%-- <button type="button" class="mr-2 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                                <a href="medicine-constraints.jsp">Add Constraints</a>
                            </button> --%>
                            <button class="mr-2 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                                <a href="new-constraints?medId=<%= m.getId() %>">Finish</a>
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