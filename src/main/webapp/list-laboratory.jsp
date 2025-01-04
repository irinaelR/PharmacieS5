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
    <aside class="fixed top-0 left-0 h-screen w-64" style="background-color: #f1f7f7;;">
        <div class="flex items-center" style="padding-top: 30px;padding-left: 30px;">
            <h1 class="text-2xl font-bold text-gray-700">
                <i class="fas fa-mortar-pestle mr-3"></i>Pharmacy
            </h1>
        </div>
        <nav class="flex flex-col p-8">
            <div class="p-3 text-xs text-gray-200 bg-gray-900 rounded-2xl mb-4"><i class="fas fa-bars mr-2"></i>PAGES</div>
            <div class="relative">
                <button class="hover:bg-white hover:text-gray-900 dropdown-button flex items-center w-full p-2 rounded-t-xl font-semibold text-gray-500">
                   <i class="fas fa-disease mr-2"></i> Illnesses
                </button>
                <div class="dropdown absolute hidden w-full bg-white rounded-b-lg shadow-lg z-10">
                    <a href="list-illness.jsp" class="block p-3 hover:bg-gray-300">Illnesses list</a>
                    <a href="new-illness.jsp" class="block p-3 hover:bg-gray-300">Insert illness</a>
                </div>
            </div>            
            <div class="relative">
                <button class="hover:bg-white hover:text-gray-900 dropdown-button flex items-center w-full p-2 rounded-t-xl font-semibold text-gray-500">
                    <i class="fas fa-medkit mr-2"></i>Medicines
                </button>
                <div class="dropdown absolute hidden w-full bg-white rounded-b-lg shadow-lg z-10">
                    <a href="list-medicine.jsp" class="block p-3 hover:bg-gray-300">Medicines list</a>
                    <a href="new-medicine.jsp" class="block p-3 hover:bg-gray-300">Insert medicine</a>
                </div>
            </div>   
            <div class="relative">
                <button class="hover:bg-white hover:text-gray-900 dropdown-button flex items-center w-full p-2 rounded-t-xl font-semibold text-gray-500">
                    <i class="fas fa-microscope mr-2"></i>Laboratory
                </button>
                <div class="dropdown absolute hidden w-full bg-white rounded-b-lg shadow-lg z-10">
                    <a href="list-laboratory.jsp" class="block p-3 hover:bg-gray-300">Laboratory list</a>
                    <a href="new-laboratory.jsp" class="block p-3 hover:bg-gray-300">Insert laboratory</a>
                </div>
            </div>          
        </nav>

    </aside>
<main class="ml-64 relative">
    <div class="container mx-auto">
        <div class="flex justify-between m-5">
            <h2 class="text-2xl font-bold mb-6">Laboratories</h2>

            <button id="filterButton" class="bg-white text-gray-600 font-bold py-2 px-4 rounded-lg flex items-center">
                <i class="fas fa-filter mr-2"></i> Filter
            </button>
        </div>
        
        <div class="container mx-auto bg-white p-10 rounded-lg shadow-lg">
            <table class="table-auto w-full">
                <thead>
                    <tr class="text-left font-semibold text-gray-600 uppercase">
                        <th class="py-2 px-4">Name</th>
                        <th class="py-2 px-4">Type</th>
                        <th class="py-2 px-4">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="border-b border-gray-200">
                        <td class="py-2 px-4">Biochemistry Lab</td>
                        <td class="py-2 px-4">Performs tests on blood, urine, and other bodily fluids.</td>
                        <td class="py-2 px-4 flex space-x-2">
                            <div class="flex justify-between">
                                <button onclick="event.stopPropagation(); window.location.href='#';" class="border-2 border-gray-400 hover:border-gray-500 hover:text-gray-500 text-xs w-full mt-2 text-gray-400 font-bold py-1.5 px-4 rounded-lg mr-2" type="button"><i class="fa-solid fa-trash-can mr-2"></i>Delete</button>
                                <button onclick="event.stopPropagation(); window.location.href='update-laboratory.jsp';" class="border-2 border-gray-400 hover:border-gray-500 hover:text-gray-500 text-xs w-full mt-2 text-gray-400 font-bold py-1.5 px-4 rounded-lg mr-2" type="button"><i class="fa-solid fa-pen-to-square mr-2"></i>Update</button>
                            </div>
                        </td>
                    </tr>
                    <tr class="border-b border-gray-20">
                        <td class="py-2 px-4">Hematology Lab</td>
                        <td class="py-2 px-4">Analyzes blood components, including red and white blood cells.</td>
                        <td class="py-2 px-4 flex space-x-2">
                            <div class="flex justify-between">
                                <button onclick="event.stopPropagation(); window.location.href='#';" class="border-2 border-gray-400 hover:border-gray-500 hover:text-gray-500 text-xs w-full mt-2 text-gray-400 font-bold py-1.5 px-4 rounded-lg mr-2" type="button"><i class="fa-solid fa-trash-can mr-2"></i>Delete</button>
                                <button onclick="event.stopPropagation(); window.location.href='update-laboratory.jsp';" class="border-2 border-gray-400 hover:border-gray-500 hover:text-gray-500 text-xs w-full mt-2 text-gray-400 font-bold py-1.5 px-4 rounded-lg mr-2" type="button"><i class="fa-solid fa-pen-to-square mr-2"></i>Update</button>
                            </div>
                        </td>
                    </tr>
                    <tr class="border-b border-gray-200">
                        <td class="py-2 px-4">Microbiology Lab</td>
                        <td class="py-2 px-4">Identifies and studies microorganisms, such as bacteria and viruses.</td>
                        <td class="py-2 px-4 flex space-x-2">
                            <div class="flex justify-between">
                                <button onclick="event.stopPropagation(); window.location.href='#';" class="border-2 border-gray-400 hover:border-gray-500 hover:text-gray-500 text-xs w-full mt-2 text-gray-400 font-bold py-1.5 px-4 rounded-lg mr-2" type="button"><i class="fa-solid fa-trash-can mr-2"></i>Delete</button>
                                <button onclick="event.stopPropagation(); window.location.href='update-laboratory.jsp';" class="border-2 border-gray-400 hover:border-gray-500 hover:text-gray-500 text-xs w-full mt-2 text-gray-400 font-bold py-1.5 px-4 rounded-lg mr-2" type="button"><i class="fa-solid fa-pen-to-square mr-2"></i>Update</button>
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
                <label for="category" class="block text-gray-700 font-bold mb-2">Category :</label>
                <select id="category" name="category" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                    <option value="lab_type_id">Lab_type_name</option>
                    <option value="lab_type_id">Lab_type_name</option>
                    <option value="lab_type_id">Lab_type_name</option>
                </select>
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