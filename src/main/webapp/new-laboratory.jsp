<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdn.tailwindcss.com"></script> 
    <link rel="stylesheet" href="assets/css/output.css">
    <title>New laboratory</title>
</head>
<body class="ml-20 mr-20" style="background-color: #e0ecec;">

        <jsp:include page="aside.jsp" />

<main class="ml-64 pt-5 flex">
    <div id="medicine" class="container mx-auto">
        <h2 class="text-2xl font-bold mb-6">New laboratory</h2>

        <div class="bg-white rounded-lg shadow-md p-6">
            <form action="medicine-form.jsp" method="post">
                <div class="mb-4">
                    <label for="name" class="block text-gray-700 font-bold mb-2">Name :</label>
                    <input type="text" id="name" name="name" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                </div>

                <div class="mb-4">
                    <label for="category" class="block text-gray-700 font-bold mb-2">Category :</label>
                    <select id="category" name="category" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                        <option value="lab_type_id">Lab_type_name</option>
                        <option value="lab_type_id">Lab_type_name</option>
                        <option value="lab_type_id">Lab_type_name</option>
                    </select>
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
