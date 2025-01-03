<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="assets/css/output.css">
    <title>Document</title>
</head>
<body class="bg-gray-100 ml-20 mr-20">
    <div id="overlay" style="position: fixed;top: 0;left: 0;width: 100vw;background-color: black;height: 100vh;z-index: 100;opacity: 0;display: none;"></div>
    <aside class="fixed top-0 left-0 h-screen w-64">
        <div class="flex items-center" style="padding-top: 30px;padding-left: 30px;">
            <img src="assets/img/pillule.png" alt="" class="h-12 w-auto mr-4">
            <h1 class="text-2xl font-bold text-gray-700">
                Pharmacy
            </h1>
        </div>
        <nav class="flex flex-col p-8">
            <div class="p-2 text-xs text-gray-500 bg-white rounded-md shadow-lg">PAGES</div>
            <div class="relative">
                <button class="dropdown-button flex items-center w-full p-3 rounded-md">
                    Illnesses
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 ml-auto" viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd" />
                    </svg>
                </button>
                <div class="dropdown absolute hidden w-full bg-gray-100 rounded-md shadow-lg z-10">
                    <a href="list-illness.jsp" class="block p-3 hover:bg-white">Illnesses list</a>
                    <a href="new-illness.jsp" class="block p-3 hover:bg-white">Insert illness</a>
                </div>
            </div>            
            <div class="relative">
                <button class="dropdown-button flex items-center w-full p-3 rounded-md">
                    Medicines
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 ml-auto" viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd" />
                    </svg>
                </button>
                <div class="dropdown absolute hidden w-full bg-gray-100 rounded-md shadow-lg z-10">
                    <a href="list-medicine.jsp" class="block p-3 hover:bg-white">Medicines list</a>
                    <a href="new-medicine.jsp" class="block p-3 hover:bg-white">Insert medicine</a>
                </div>
            </div>   
            <div class="relative">
                <button class="dropdown-button flex items-center w-full p-3 rounded-md">
                    Laboratory
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 ml-auto" viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd" />
                    </svg>
                </button>
                <div class="dropdown absolute hidden w-full bg-gray-100 rounded-md shadow-lg z-10">
                    <a href="list-laboratory.jsp" class="block p-3 hover:bg-white">Laboratory list</a>
                    <a href="new-laboratory.jsp" class="block p-3 hover:bg-white">Insert laboratory</a>
                </div>
            </div>          
        </nav>

    </aside>
<main class="ml-64 p-8 relative">
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
                    <tr class="border-b border-gray-200 cursor-pointer" onclick="window.location.href='medicine-details.jsp'">
                        <td class="py-2 px-4">Aspirin</td>
                        <td class="py-2 px-4">Bayer</td>
                        <td class="py-2 px-4">Analgesic</td>
                        <td class="py-2 px-4">
                            <input type="checkbox" disabled>
                        </td>
                        <td class="py-2 px-4 flex space-x-2">
                            <button onclick="event.stopPropagation(); window.location.href='#';" class="bg-blue-500 hover:bg-blue-700 w-full mt-2 text-white font-bold py-1.5 px-4 rounded-lg mr-2" type="button"><i class="fa-solid fa-trash-can mr-2"></i>Delete</button>
                            <button onclick="event.stopPropagation(); window.location.href='update-medicine.jsp';" class="bg-green-500 hover:bg-green-700 w-full mt-2 text-white font-bold py-1.5 px-4 rounded-lg" type="button"><i class="fa-solid fa-pen-to-square mr-2"></i>Update</button>
                        </td>
                    </tr>
                    <tr class="border-b border-gray-200 cursor-pointer" onclick="window.location.href='medicine-details.jsp'">
                        <td class="py-2 px-4">Ibuprofen</td>
                        <td class="py-2 px-4">Advil</td>
                        <td class="py-2 px-4">NSAID</td>
                        <td class="py-2 px-4">
                            <input type="checkbox" checked disabled>
                        </td>
                        <td class="py-2 px-4 flex space-x-2">
                            <button onclick="event.stopPropagation(); window.location.href='#';" class="bg-blue-500 hover:bg-blue-700 w-full mt-2 text-white font-bold py-1.5 px-4 rounded-lg mr-2" type="button"><i class="fa-solid fa-trash-can mr-2"></i>Delete</button>
                            <button onclick="event.stopPropagation(); window.location.href='update-medicine.jsp';" class="bg-green-500 hover:bg-green-700 w-full mt-2 text-white font-bold py-1.5 px-4 rounded-lg" type="button"><i class="fa-solid fa-pen-to-square mr-2"></i>Update</button>
                        </td>
                    </tr>
                    <tr class="border-b border-gray-200 bg-gray-100">
                        <td class="py-2 px-4">Paracetamol</td>
                        <td class="py-2 px-4">Generic</td>
                        <td class="py-2 px-4">Analgesic/Antipyretic</td>
                        <td class="py-2 px-4">
                            <input type="checkbox" disabled>
                        </td>
                        <td class="py-2 px-4 flex space-x-2">
                            <button onclick="event.stopPropagation(); window.location.href='#';" class="bg-blue-500 hover:bg-blue-700 w-full mt-2 text-white font-bold py-1.5 px-4 rounded-lg mr-2" type="button"><i class="fa-solid fa-trash-can mr-2"></i>Delete</button>
                            <button onclick="event.stopPropagation(); window.location.href='update-medicine.jsp';" class="bg-green-500 hover:bg-green-700 w-full mt-2 text-white font-bold py-1.5 px-4 rounded-lg" type="button"><i class="fa-solid fa-pen-to-square mr-2"></i>Update</button>
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
                <label for="laboratory" class="block text-gray-700 font-bold mb-2">Lab :</label>
                <select id="laboratory" name="laboratory" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                    <option value="lab_type_id">Lab_type_name</option>
                    <option value="lab_type_id">Lab_type_name</option>
                    <option value="lab_type_id">Lab_type_name</option>
                </select>
            </div>
            <div class="mb-4">
                <label for="category" class="block text-gray-700 font-bold mb-2">Category :</label>
                <select id="category" name="category" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                    <option value="med_category_id">med_category_name</option>
                    <option value="med_category_id">med_category_name</option>
                    <option value="med_category_id">med_category_name</option>
                </select>
            </div>
            <div class="mb-4">
                <label for="needsNotice" class="block text-gray-700 font-bold mb-2">Needs Notice :</label>
                <input id="needsNotice" type="checkbox">
            </div>
            <div class="mb-4">
                <label for="category" class="block text-gray-700 font-bold mb-2">Constraints :</label>
                <select id="category" name="category" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                    <option value="medical_constraints_id">medical_constraints_name</option>
                    <option value="medical_constraints_id">medical_constraints_name</option>
                    <option value="medical_constraints_id">medical_constraints_name</option>
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

<script>
    const dropdownButtons = document.querySelectorAll('.dropdown-button');
    dropdownButtons.forEach(button => {
        button.addEventListener('click', (event) => {
            const dropdown = button.nextElementSibling;
            dropdown.classList.toggle('hidden');
            event.stopPropagation(); 
        });
    });

    document.addEventListener('click', (event) => {
        dropdownButtons.forEach(button => {
            const dropdown = button.nextElementSibling;
            if (!dropdown.classList.contains('hidden')) { 
                if (!button.contains(event.target) && !dropdown.contains(event.target)) {
                    dropdown.classList.add('hidden');
                }
            }
        });
    });
    const filterButton = document.getElementById('filterButton');
    const filterSidebar = document.getElementById('filterSidebar');
    const overlay = document.getElementById('overlay');

    filterSidebar.style.transition = 'transform 0.3s ease-in-out';
    overlay.style.transition = 'opacity 0.3s ease-in-out';

    filterButton.addEventListener('click', () => {
        overlay.style.display = 'block';
        setTimeout(() => {
            overlay.style.opacity = '0.5'; 
        }, 10); 
        filterSidebar.style.transform = 'translateX(0)'; 
    });

    overlay.addEventListener('click', () => {
        overlay.style.opacity = '0'; 
        setTimeout(() => {
            overlay.style.display = 'none'; 
        }, 300); 
        filterSidebar.style.transform = 'translateX(100%)'; 
    });
</script>
</body>
</html>