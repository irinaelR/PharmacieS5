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
<main class="ml-64 pt-5 flex">
    <div id="medicine" class="container mx-auto">
        <h2 class="text-2xl font-bold mb-6">New medicine</h2>

        <div class="bg-white rounded-lg shadow-md p-6">
            <form action="medicine-form.jsp" method="post">
                <div class="mb-4">
                    <label for="name" class="block text-gray-700 font-bold mb-2">Name :</label>
                    <input type="text" id="name" name="name" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                </div>

                <div class="mb-4">
                    <label for="laboratory" class="block text-gray-700 font-bold mb-2">Laboratory :</label>
                    <select id="laboratory" name="laboratory" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                        <option value="lab_id">Lab_name</option>
                        <option value="lab_id">Lab_name</option>
                        <option value="lab_id">Lab_name</option>
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
                    <label for="needsNotice" class="block text-gray-700 font-bold mb-2">Need notice :</label>
                    <input type="checkbox" id="needsNotice" name="needsNotice" class="w-50">
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
