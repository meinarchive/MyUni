<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.tailwindcss.com"></script>
<title>Login Studente</title>
</head>
<body class="h-screen flex flex-col justify-center items-center">
	<h1 class="text-center text-gray-500 text-2xl">Portale Myuni</h1>
	<p class="font-bold text-sm text-gray-400 text-2xl mb-2">MyUni|
		Studente</p>
	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
		viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
		stroke-linecap="round" stroke-linejoin="round"
		class="lucide lucide-graduation-cap mb-4 text-green-500">
		<path
			d="M21.42 10.922a1 1 0 0 0-.019-1.838L12.83 5.18a2 2 0 0 0-1.66 0L2.6 9.08a1 1 0 0 0 0 1.832l8.57 3.908a2 2 0 0 0 1.66 0z" />
		<path d="M22 10v6" />
		<path d="M6 12.5V16a6 3 0 0 0 12 0v-3.5" /></svg>
	<div class="w-full max-w-xs">
		<form class="bg-[#f7f7f7] shadow-md rounded px-8 pt-6 pb-8 mb-4"
			action="loginStudente" method="POST">
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
		<a href="loginProfessore">
			<p
				class="text-right font-bold text-sm text-green-500 hover:text-green-800 mb-6">
				Sei un professore?</p>
		</a>
	</div>
</body>
</html>