<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="assets/css/output.css">
    <title>New illness</title>
</head>
<body class="ml-20 mr-20" style="background-color: #e0ecec;">

        <jsp:include page="aside.jsp" />

<main class="ml-64 pt-5 flex">
    <div class="container mx-auto">
        <h2 class="text-2xl font-bold mb-6">New illness</h2>

        <div class="bg-white rounded-lg shadow-md p-6">
            <form action="#" method="post">
                <div class="mb-4">
                    <label for="name" class="block text-gray-700 font-bold mb-2">Name :</label>
                    <input type="text" id="name" name="name" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                </div>

                <div class="mb-4">
                    <label for="description" class="block text-gray-700 font-bold mb-2">Description :</label>
                    <textarea id="description" name="description" rows="4" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"></textarea>
                </div>

                <div class="mb-4">
                    <label for="isChronic" class="block text-gray-700 font-bold mb-2">Is chronic :</label>
                    <input type="checkbox" id="isChronic" name="isChronic" class="w-50">
                </div>

                <div class="flex items-center justify-between">
                    <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="submit">
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