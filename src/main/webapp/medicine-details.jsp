<%@ page import="java.util.List,java.util.Map,pharmacy.entities.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="assets/css/output.css">
    <title>Document</title>
</head>
<body class="ml-20 mr-20" style="background-color: #e2ebeb;">
        <jsp:include page="aside.jsp" />


    <main class="ml-64 pt-5">
        <h1 class="text-3xl font-bold mb-6">Medicine details</h1>
        <div class="container mx-auto justify-between">

            <div class="bg-white rounded-3xl overflow-hidden mb-8 p-6">
                <%
                    Medicine m = (Medicine) request.getAttribute("medicine");
                %>
                <h3 class="text-2xl font-bold mb-6">Medicine <%= m.getName() %></h3>
                <hr>
                <div class="px-6 py-4">
                    <div class="flex items-center mb-2">
                        <div>
                            <h3 class="text-lg font-semibold text-gray-900"><%= m.getLaboratory().getName() %></h3>
                            <p class="text-sm text-gray-500">Lab</p>
                        </div>
                    </div>
                    <div class="flex items-center mb-2">
                        <div>
                            <h3 class="text-lg font-semibold text-gray-900"><%= m.getCategory().getName() %></h3>
                            <p class="text-sm text-gray-500">Category</p>
                        </div>
                    </div>
                    <div class="flex items-center">
                        <div>
                            <h3 class="text-lg font-semibold text-gray-900">Needs notice</h3>
                            <p class="text-sm text-gray-500">Status</p>
                            <div class="mt-1">
                                <%

                                if(m.getNeedsNotice()) {
                                        
                                %>
                                
                                <span class="inline-flex items-center rounded-3xl bg-green-50 px-2 py-1 text-xs font-medium text-green-700 ring-1 ring-inset ring-green-600/20 mr-1">Yes</span>

                                <%    
                                    } else { 
                                %>

                                <span class="inline-flex items-center rounded-3xl bg-red-50 px-2 py-1 text-xs font-medium text-red-700 ring-1 ring-inset ring-red-600/10">No</span>
                                
                                <%
                                
                                    }
                                
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="flex justify-between gap-0.5">
                <div class="bg-white mb-8 overflow-x-auto rounded-3xl p-6 w-3/6">
                    <h3 class="text-lg font-semibold text-gray-700 mb-4"><i class="fas fa-pills mr-2"></i>Forms</h3>
                    <hr>
                    <table class="table-auto w-full border-collapse">
                        <thead>
                            <tr class="text-left font-semibold text-gray-600 uppercase bg-gray-50">
                                <th class="py-2 px-4 border border-gray-200">Form</th>
                                <th class="py-2 px-4 border border-gray-200">Dosage</th>
                                <th class="py-2 px-4 border border-gray-200">Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                Map<MedicinesFormat,List<MedicinesDosage>> medDosages = (Map<MedicinesFormat,List<MedicinesDosage>>) request.getAttribute("medDosage");
                                
                                for(Map.Entry<MedicinesFormat,List<MedicinesDosage>> entry:medDosages.entrySet()) 
                                {
                                    MedicinesFormat medFormat = (MedicinesFormat) entry.getKey();
                                    List<MedicinesDosage> medDosage = (List<MedicinesDosage>) entry.getValue();
                            %>

                            <tr class="border-b border-gray-200" rowspan=<%= medDosage.size() %>>
                                <td class="py-2 px-4 border border-gray-200"><%= medFormat.getMedForm().getName() %></td>
                                <td class="py-2 px-4 border border-gray-200"><%= medDosage.get(0).getDose() %> <%= medDosage.get(0).getUnit().getName() %></td>
                                <td class="py-2 px-4 border border-gray-200"><%= medDosage.get(0).getPrice() %> MGA</td>
                            </tr>

                            <%
                            
                                for(int i = 1;i<medDosage.size();i++) 
                                {

                            %>
                            
                            <tr class="border-b border-gray-200">
                                <td class="py-2 px-4 border border-gray-200"><%= medDosage.get(i).getDose() %></td>
                                <td class="py-2 px-4 border border-gray-200"><%= medDosage.get(i).getPrice() %></td>
                            </tr>
                            
                            <%

                                }

                                }
                            %>
                        </tbody>
                    </table>
                    <div class="p-6">
                        <a href="new-form?medicineId=<%= m.getId() %>" class="text-blue-500 hover:text-blue-700 font-medium">Add</a>
                    </div>
                </div>
                <div class="bg-white mb-8 overflow-x-auto rounded-3xl p-6 w-3/6 flex flex-col justify-between">
                    <div>
                        <div class="flex items-center mb-4">
                            <div class="bg-red-100 text-red-600 rounded-full p-2 mr-3">
                                <i class="fas fa-exclamation-circle"></i>
                            </div>
                            <h3 class="text-xl font-medium text-gray-900">Cannot be taken by:</h3>
                        </div>
                        <ul class="list-none space-y-3 text-gray-700">
                            <%

                                List<MedicalConstraint> medConstraints = (List<MedicalConstraint>) request.getAttribute("medConstraint");

                                for(MedicalConstraint medConstraint:medConstraints) 
                                {

                            %>

                            <li class="flex items-center">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2 text-red-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                                </svg>
                                <span><%= medConstraint.getName() %></span>
                            </li>
                            
                            <%

                                }

                            %>
                        </ul>
                    </div>
                    <div class="p-6">
                        <a href="new-constraints?medId=<%= m.getId() %>" class="text-blue-500 hover:text-blue-700 font-medium">Add</a>
                    </div>
                </div>
            </div>
            <div class="bg-white rounded-3xl p-6 mb-8">
                <h3 class="text-lg font-semibold text-gray-700 mb-4"><i class="fas fa-exchange-alt mr-2"></i> Substitutes</h3>
                <div class="flex flex-wrap justify-start gap-6">
                    <div class="bg-white rounded-3xl p-6 border border-gray-200 mb-5 flex flex-col justify-between" style="height: 100%">
                        <div class="mb-8">
                            <h4 class="text-2xl font-semibold text-gray-900 mb-2">Paracetamol</h4>
                            <p class="text-md font-semibold text-gray-900">Generic Lab</p>
                            <p class="text-sm text-gray-500">Lab</p>
                            <p class="text-lg font-semibold text-gray-900">Analgesics</p>
                            <p class="text-sm text-gray-500">Category</p>
                        </div>
                        <button class="text-blue-500 hover:text-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 font-medium text-sm mt-auto">See More</button>
                    </div>
            
                    <div class="bg-white rounded-3xl p-6 border border-gray-200 mb-5 flex flex-col justify-between" style="height: 100%">
                        <div class="mb-8">
                            <h4 class="text-2xl font-semibold text-gray-900 mb-2">Ibuprofen</h4>
                            <p class="text-md font-semibold text-gray-900">Another Lab</p>
                            <p class="text-sm text-gray-500">Lab</p>
                            <p class="text-lg font-semibold text-gray-900">Anti-inflammatory</p>
                            <p class="text-sm text-gray-500">Category</p>
                        </div>
                        <button class="text-blue-500 hover:text-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 font-medium text-sm mt-auto">See More</button>
                    </div>
            
                    <div class="bg-white rounded-3xl p-6 border border-gray-200 mb-5 flex flex-col justify-between" style="height: 100%">
                        <div class="mb-8">
                            <h4 class="text-2xl font-semibold text-gray-900 mb-2">Aspirin</h4>
                            <p class="text-md font-semibold text-gray-900">Bayer</p>
                            <p class="text-sm text-gray-500">Lab</p>
                            <p class="text-lg font-semibold text-gray-900">Analgesics</p>
                            <p class="text-sm text-gray-500">Category</p>
                        </div>
                        <button class="text-blue-500 hover:text-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 font-medium text-sm mt-auto">See More</button>
                    </div>
                </div>
            </div>
            

        </div>
    </main>
    <script src="assets/script/script.js"></script>
</body>
</html>