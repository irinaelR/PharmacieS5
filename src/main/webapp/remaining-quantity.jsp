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
<main class="ml-64 pt-5 relative">
    <div class="container mx-auto">
    <h2 class="text-2xl font-bold mb-6">Header</h2>
        <div class="container mx-auto bg-white p-10 rounded-lg shadow-lg">
            <table class="table-auto w-full">
                <thead>
                    <tr class="text-left font-semibold text-gray-600 uppercase">
                        <th class="py-2 px-4">Medicine</th>
                        <th class="py-2 px-4">Remaining quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="border-b border-gray-200 cursor-pointer">
                        <td class="py-2 px-4">Aspirin</td>
                        <td class="py-2 px-4">200</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</main>
<script src="assets/script/script.js"></script>
</body>
</html>