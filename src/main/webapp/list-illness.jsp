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
            <h2 class="text-2xl font-bold mb-6">Illnesses</h2>    
            <button id="filterButton" class="bg-white text-gray-600 font-bold py-2 px-4 rounded-lg flex items-center">
                <i class="fas fa-filter mr-2"></i> Filter
            </button>
        </div>
        
        <div class="container mx-auto bg-white p-10 rounded-lg shadow-lg">
            <table class="table-auto w-full">
                <thead>
                    <tr class="text-left font-semibold text-gray-600 uppercase">
                        <th class="py-2 px-4">Name</th>
                        <th class="py-2 px-4">Description</th>
                        <th class="py-2 px-4">Chronic</th>
                        <th class="py-2 px-4">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="border-b border-gray-200">
                        <td class="py-2 px-4">Common Cold</td>
                        <td class="py-2 px-4">Viral infection of the upper respiratory tract.</td>
                        <td class="py-2 px-4">
                            <input type="checkbox" disabled>
                        </td>
                        <td class="py-2 px-4">
                            <div class="flex justify-between">
                                <button onclick="event.stopPropagation(); window.location.href='#';" class="border-2 border-gray-400 hover:border-gray-500 hover:text-gray-500 text-xs w-full mt-2 text-gray-400 font-bold py-1.5 px-4 rounded-lg mr-2" type="button"><i class="fa-solid fa-trash-can mr-2"></i>Delete</button>
                                <button onclick="event.stopPropagation(); window.location.href='update-illness.jsp';" class="border-2 border-gray-400 hover:border-gray-500 hover:text-gray-500 text-xs w-full mt-2 text-gray-400 font-bold py-1.5 px-4 rounded-lg mr-2" type="button"><i class="fa-solid fa-pen-to-square mr-2"></i>Update</button>
                            </div>
                        </td>
                    </tr>
                    <tr class="border-b border-gray-200">
                        <td class="py-2 px-4">Asthma</td>
                        <td class="py-2 px-4">Chronic respiratory disease causing inflammation of the airways.</td>
                        <td class="py-2 px-4">
                            <input type="checkbox" checked disabled>
                        </td>
                        <td class="py-2 px-4">
                            <div class="flex justify-between">
                                <button onclick="event.stopPropagation(); window.location.href='#';" class="border-2 border-gray-400 hover:border-gray-500 hover:text-gray-500 text-xs w-full mt-2 text-gray-400 font-bold py-1.5 px-4 rounded-lg mr-2" type="button"><i class="fa-solid fa-trash-can mr-2"></i>Delete</button>
                                <button onclick="event.stopPropagation(); window.location.href='update-illness.jsp';" class="border-2 border-gray-400 hover:border-gray-500 hover:text-gray-500 text-xs w-full mt-2 text-gray-400 font-bold py-1.5 px-4 rounded-lg mr-2" type="button"><i class="fa-solid fa-pen-to-square mr-2"></i>Update</button>
                            </div>
                        </td>
                    </tr>
                    <tr class="border-b border-gray-200 cursor-pointer" onclick="location.href='#';">
                        <td class="py-2 px-4">Diabetes</td>
                        <td class="py-2 px-4">Metabolic disorder characterized by elevated blood sugar levels.</td>
                        <td class="py-2 px-4">
                            <input type="checkbox" checked disabled>
                        </td>
                        <td class="py-2 px-4">
                            <div class="flex justify-between">
                                <button onclick="event.stopPropagation(); window.location.href='#';" class="border-2 border-gray-400 hover:border-gray-500 hover:text-gray-500 text-xs w-full mt-2 text-gray-400 font-bold py-1.5 px-4 rounded-lg mr-2" type="button"><i class="fa-solid fa-trash-can mr-2"></i>Delete</button>
                                <button onclick="event.stopPropagation(); window.location.href='update-illness.jsp';" class="border-2 border-gray-400 hover:border-gray-500 hover:text-gray-500 text-xs w-full mt-2 text-gray-400 font-bold py-1.5 px-4 rounded-lg mr-2" type="button"><i class="fa-solid fa-pen-to-square mr-2"></i>Update</button>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>            
        </div>
    </div>
</main>
<div id="filterSidebar" class="w-80 h-screen bg-white shadow-lg z-100 p-6" style="position: fixed; top: 0; right: 0; transform: translateX(100%); z-index: 200; display: flex; flex-direction: column; justify-content: space-between;">
    <h3 class="text-lg font-bold mb-4">Filters</h3>
    <hr>
    <form action="#" method="post" id="filterForm" style="flex-grow: 1; display: flex; flex-direction: column; justify-content: space-between;">
        <div>
            <div class="mb-4">
                <label for="name" class="block text-gray-700 font-bold mb-2">Name :</label>
                <input type="text" id="name" name="name" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>

            <div class="mb-4">
                <label for="medicine" class="block text-gray-700 font-bold mb-2">Medicine :</label>
                <input type="text" id="medicine" name="medicine" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>

            <div class="mb-4">
                <label for="isChronic" class="block text-gray-700 font-bold mb-2">Is chronic :</label>
                <input type="checkbox" id="isChronic" name="isChronic" class="w-50">
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