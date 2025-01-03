<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/output.css">
    <title>Document</title>
</head>
<body class="bg-gray-100 m-20">

    <aside class="fixed top-0 left-0 h-screen w-64">
        <div class="p-4">
            <h1 class="text-xl font-bold text-gray-700">Soft UI Dashboard PRO</h1>
        </div>
        <nav class="flex flex-col p-8">
            <a href="#" class="flex items-center p-3 rounded-md">Dashboards</a>
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

            <div class="p-2 text-xs text-gray-500 bg-white rounded-md shadow-lg">DOCS</div>
            <a href="#" class="flex items-center p-3 rounded-md">Basic</a>
            <a href="#" class="flex items-center p-3 rounded-md">Components</a>
            <a href="#" class="flex items-center p-3 rounded-md">Change Log</a>
        </nav>
        <div class="absolute bottom-0 p-4 w-full bg-blue-500 rounded-b-md text-white">
            <p>Need Help?</p>
            <button class="bg-white text-blue-500 py-2 px-4 rounded mt-2 w-full">Documentation</button>
        </div>
    </aside>

    <main class="ml-64 p-8">
        <div class="container mx-auto">
            <h2 class="text-2xl font-bold mb-6">General Statistics</h2>

            <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
                <div class="bg-white rounded-lg shadow-lg p-6">
                    <h3 class="text-lg font-semibold text-gray-700 mb-2">Today's Money</h3>
                    <p class="text-2xl font-bold text-green-500">$53,000 <span class="text-sm">-55%</span></p>
                </div>
                <div class="bg-white rounded-lg shadow-lg p-6">
                    <h3 class="text-lg font-semibold text-gray-700 mb-2">New Clients</h3>
                    <p class="text-2xl font-bold text-green-500">+3,462 <span class="text-sm">-3%</span></p>
                </div>
                <div class="bg-white rounded-lg shadow-lg p-6">
                    <h3 class="text-lg font-semibold text-gray-700 mb-2">Today's Users</h3>
                    <p class="text-2xl font-bold text-red-500">2,300 <span class="text-sm">+3%</span></p>
                </div>
                <div class="bg-white rounded-lg shadow-lg p-6">
                    <h3 class="text-lg font-semibold text-gray-700 mb-2">Sales</h3>
                    <p class="text-2xl font-bold text-green-500">$103,430 <span class="text-sm">+5%</span></p>
                </div>
            </div>

            <div class="bg-white rounded-lg shadow-lg p-6 mb-8">
                <h3 class="text-lg font-semibold text-gray-700 mb-4">Sales by Country</h3>
                <table class="table-auto w-full">
                    <thead>
                        <tr class="text-left font-semibold text-gray-600 uppercase">
                            <th class="py-2 px-4">Country</th>
                            <th class="py-2 px-4">Sales</th>
                            <th class="py-2 px-4">Value</th>
                            <th class="py-2 px-4">Bounce</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="border-b border-gray-200">
                            <td class="py-2 px-4">United States</td>
                            <td class="py-2 px-4">2500</td>
                            <td class="py-2 px-4">$230,900</td>
                            <td class="py-2 px-4">29.9%</td>
                        </tr>
                        <tr class="border-b border-gray-200">
                            <td class="py-2 px-4">Germany</td>
                            <td class="py-2 px-4">3,900</td>
                            <td class="py-2 px-4">$440,000</td>
                            <td class="py-2 px-4">40.22%</td>
                        </tr>
                        <tr class="border-b border-gray-200">
                            <td class="py-2 px-4">Great Britain</td>
                            <td class="py-2 px-4">1,400</td>
                            <td class="py-2 px-4">$190,700</td>
                            <td class="py-2 px-4">22.44%</td>
                        </tr>
                        <tr class="border-b border-gray-200">
                            <td class="py-2 px-4">Brazil</td>
                            <td class="py-2 px-4">562</td>
                            <td class="py-2 px-4">$143,960</td>
                            <td class="py-2 px-4">32.14%</td>
                        </tr>
                    </tbody>
                </table>
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