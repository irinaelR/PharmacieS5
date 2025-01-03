<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/output.css">
    <title>New illness</title>
</head>
<body class="bg-gray-100 ml-20 mr-20">

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
<main class="ml-64 p-8">
    <div class="container mx-auto">
        <h2 class="text-2xl font-bold mb-6">Update illness</h2>

        <div class="bg-white rounded-lg shadow-md p-6">
            <form action="#" method="post">
                <div class="mb-4">
                    <label for="name" class="block text-gray-700 font-bold mb-2">Name :</label>
                    <input value="default name" type="text" id="name" name="name" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                </div>

                <div class="mb-4">
                    <label for="description" class="block text-gray-700 font-bold mb-2">Description :</label>
                    <textarea id="description" name="description" rows="4" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">Default description</textarea>
                </div>

                <div class="mb-4">
                    <label for="isChronic" class="block text-gray-700 font-bold mb-2">Is chronic :</label>
                    <input type="checkbox" id="isChronic" name="isChronic" class="w-50">
                </div>

                <div class="flex items-center justify-between">
                    <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="submit">
                        Save changes
                    </button>
                    <a href="list-illness.jsp" class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800">
                        Cancel
                    </a>
                </div>
            </form>
        </div>
    </div>
</main>
<script>
    const dropdownButtons = document.querySelectorAll('.dropdown-button');

    dropdownButtons.forEach(button => {
        button.addEventListener('click', (event) => {
            const dropdown = button.nextElementSibling;
            dropdown.classList.toggle('hidden');
            event.stopPropagation(); // Empêche la propagation du clic au document
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
</script>
</body>
</html>