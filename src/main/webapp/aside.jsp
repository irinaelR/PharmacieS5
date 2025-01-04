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
                    <a href="illnesses" class="block p-3 hover:bg-gray-300">Illnesses list</a>
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