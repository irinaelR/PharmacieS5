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
                    <a href="new-illness" class="block p-3 hover:bg-gray-300">Insert illness</a>
                </div>
            </div>            
            <div class="relative">
                <button class="hover:bg-white hover:text-gray-900 dropdown-button flex items-center w-full p-2 rounded-t-xl font-semibold text-gray-500">
                    <i class="fas fa-medkit mr-2"></i>Medicines
                </button>
                <div class="dropdown absolute hidden w-full bg-white rounded-b-lg shadow-lg z-10">
                    <a href="medicines" class="block p-3 hover:bg-gray-300">Medicines list</a>
                    <a href="new-medicine" class="block p-3 hover:bg-gray-300">Insert medicine</a>
                </div>
            </div>   
            <div class="relative">
                <button class="hover:bg-white hover:text-gray-900 dropdown-button flex items-center w-full p-2 rounded-t-xl font-semibold text-gray-500">
                    <i class="fas fa-microscope mr-2"></i>Laboratory
                </button>
                <div class="dropdown absolute hidden w-full bg-white rounded-b-lg shadow-lg z-10">
                    <a href="laboratories" class="block p-3 hover:bg-gray-300">Laboratory list</a>
                    <a href="new-laboratory" class="block p-3 hover:bg-gray-300">Insert laboratory</a>
                </div>
            </div>
            <div class="relative">
                <button class="hover:bg-white hover:text-gray-900 dropdown-button flex items-center w-full p-2 rounded-t-xl font-semibold text-gray-500">
                    <i class="fas fa-star mr-2"></i>Best products
                </button>
                <div class="dropdown absolute hidden w-full bg-white rounded-b-lg shadow-lg z-10">
                    <a href="list-product-month" class="block p-3 hover:bg-gray-300">Product list</a>
                    <a href="insert-product-month" class="block p-3 hover:bg-gray-300">Insert product</a>
                </div>
            </div>

            <div class="relative">
                <button class="hover:bg-white hover:text-gray-900 dropdown-button flex items-center w-full p-2 rounded-t-xl font-semibold text-gray-500">
                    <i class="fas fa-credit-card mr-2"></i>Transactions
                </button>
                <div class="dropdown absolute hidden w-full bg-white rounded-b-lg shadow-lg z-10">
                    <a href="sales" class="block p-3 hover:bg-gray-300">Sell medicine</a>
                    <a href="sales-list" class="block p-3 hover:bg-gray-300">List sales</a>
                    <a href="commission" class="block p-3 hover:bg-gray-300">List commission</a>
                    <%-- <a href="buy" class="block p-3 hover:bg-gray-300">Restock medicine</a> --%>
                </div>
            </div>   

            <div class="relative">
                <button class="hover:bg-white hover:text-gray-900 dropdown-button flex items-center w-full p-2 rounded-t-xl font-semibold text-gray-500">
                    <i class="fas fa-person mr-2"></i>Clients
                </button>
                <div class="dropdown absolute hidden w-full bg-white rounded-b-lg shadow-lg z-10">
                    <a href="list-clients" class="block p-3 hover:bg-gray-300">List clients</a>
                    <%-- <a href="sales-list" class="block p-3 hover:bg-gray-300">List sales</a> --%>
                    <%-- <a href="buy" class="block p-3 hover:bg-gray-300">Restock medicine</a> --%>
                </div>
            </div>          
            
            <div class="relative">
                <button class="hover:bg-white hover:text-gray-900 dropdown-button flex items-center w-full p-2 rounded-t-xl font-semibold text-gray-500">
                    <i class="fas fa-coin mr-2"></i>Pricing
                </button>
                <div class="dropdown absolute hidden w-full bg-white rounded-b-lg shadow-lg z-10">
                    <a href="list-pricing" class="block p-3 hover:bg-gray-300">List price product</a>
                    <a href="insert-pricing" class="block p-3 hover:bg-gray-300">New pricing</a>

                </div>
            </div>  
        </nav>

    </aside>