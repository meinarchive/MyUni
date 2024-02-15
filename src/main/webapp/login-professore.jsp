<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.tailwindcss.com"></script>
<title>Login Professore</title>
</head>
<body class="h-screen flex flex-col	 justify-center items-center">
	<h1 class="text-center text-gray-500 text-2xl">Portale MyUni</h1>
	<p class="font-bold text-sm text-gray-400 text-2xl mb-2">MyUni|
		Professore</p>
	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
		viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
		stroke-linecap="round" stroke-linejoin="round"
		class="lucide lucide-apple mb-4 text-green-500">
		<path
			d="M12 20.94c1.5 0 2.75 1.06 4 1.06 3 0 6-8 6-12.22A4.91 4.91 0 0 0 17 5c-2.22 0-4 1.44-5 2-1-.56-2.78-2-5-2a4.9 4.9 0 0 0-5 4.78C2 14 5 22 8 22c1.25 0 2.5-1.06 4-1.06Z" />
		<path d="M10 2c1 .5 2 2 2 5" /></svg>

	<div class="w-full max-w-xs">
		<form class="bg-[#f7f7f7] shadow-md rounded px-8 pt-6 pb-8 mb-4"
			action="loginProfessore" method="POST">
			<%
			if (request.getAttribute("errorMessage") != null) {
			%>
			<div
				class="mb-4 bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative"
				role="alert">
				<strong>Errore!</strong> <span class="block sm:inline"><%=request.getAttribute("errorMessage")%></span>
			</div>
			<%
			}
			%>
			<div class="mb-4">
				<label class="block text-gray-700 text-sm font-bold mb-2"
					for="username"> Username </label> <input
					class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
					id="username" name="username" type="text" placeholder="Username">

			</div>
			<div class="mb-6">
				<label class="block text-gray-700 text-sm font-bold mb-2"
					for="password"> Password </label> <input
					class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline"
					id="password" name="password" type="password"
					placeholder="******************">

			</div>
			<div class="flex items-center justify-between">
				<button
					class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
					type="submit">Log In</button>
			</div>
		</form>
		<a href="loginStudente">
			<p
				class="text-right font-bold text-sm text-green-500 hover:text-green-800 mb-6">
				Sei un studente?</p>
		</a>
	</div>
</body>
</html>