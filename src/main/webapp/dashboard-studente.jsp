<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="unidev.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.tailwindcss.com"></script>
<title>Studente | Unidev</title>
</head>
<body>



	<div class="container mx-auto px-4">
		<nav class="my-4 mb-10 bg-[#f7f7f7] px-6 py-4 shadow">
			<div class="flex justify-between items-center">
				<div class="text-lg text-gray-700 font-bold">
					<a href="dashboardStudente" class="flex items-center"> <svg
							xmlns="http://www.w3.org/2000/svg" width="24" height="24"
							viewBox="0 0 24 24" fill="none" stroke="currentColor"
							stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
							class="lucide lucide-graduation-cap text-green-500 mr-2">
          <path
								d="M21.42 10.922a1 1 0 0 0-.019-1.838L12.83 5.18a2 2 0 0 0-1.66 0L2.6 9.08a1 1 0 0 0 0 1.832l8.57 3.908a2 2 0 0 0 1.66 0z"></path>
          <path d="M22 10v6"></path>
          <path d="M6 12.5V16a6 3 0 0 0 12 0v-3.5"></path>
        </svg> MyUni
					</a>
				</div>
				<div class="flex items-center">
					<a href="dashboardStudente"
						class="text-gray-700 text-sm font-bold mx-4 hover:text-green-500">Home</a>
					<a href="#"
						class="text-gray-700 text-sm font-bold mx-4 hover:text-green-500">Profilo</a>
					<a href="#"
						class="text-gray-700 text-sm font-bold mx-4 hover:text-green-500">Dettagli</a>
					<a href="loginStudente"
						class="ml-10 bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">Log
						out</a>
				</div>
			</div>
		</nav>
		<h2 class="text-2xl text-center font-bold my-6">Elenco Corsi</h2>

		<%
		List<Corso> corsi = (List<Corso>) request.getAttribute("corsi");
		List<Registrazione> registrazioni = (List<Registrazione>) request.getAttribute("registrazioni");
		Map<Integer, Integer> corsoToAppelloMap = (Map<Integer, Integer>) request.getAttribute("corsoToAppelloMap");
		Set<Integer> appelliRegistrati = new HashSet<>();
		if (registrazioni != null) {
			for (Registrazione reg : registrazioni) {
				appelliRegistrati.add(reg.getAppello_id());
			}
		}

		if (corsi == null || corsi.isEmpty()) {
		%>
		<div class="text-center text-lg font-semibold mt-5 mb-5">Non ci
			sono corsi disponibili al momento.</div>
		<%
		} else {
		%>
		<table class="table-auto w-full mb-6">
			<thead>
				<tr class="bg-green-500 text-white">
					<th class="px-4 py-2">ID</th>
					<th class="px-4 py-2">Titolo</th>
					<th class="px-4 py-2">Descrizione</th>
					<th class="px-4 py-2">Azione</th>
				</tr>
			</thead>
			<tbody class="text-gray-700">
				<%
				for (Corso corso : corsi) {
					Integer appelloId = corsoToAppelloMap.get(corso.getCorso_id());
					boolean isRegistrato = appelliRegistrati.contains(appelloId);
				%>
				<tr class="bg-white border-b hover:bg-gray-50">
					<td class="border px-4 py-4"><%=corso.getCorso_id()%></td>
					<td class="border px-4 py-4"><%=corso.getTitolo()%></td>
					<td class="border px-4 py-4"><%=corso.getDescrizione()%></td>
					<td class="border px-4 py-4">
						<%
						if (appelloId != null && !isRegistrato) {
						%>
						<form action="RegistraAppello" method="post">
							<input type="hidden" name="appello_id" value="<%=appelloId%>" />
							<button type="submit"
								class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
								Registrati</button>
						</form> <%
 } else if (isRegistrato) {
 %> <span
						class="bg-blue-300 text-white font-bold py-2 px-4 rounded cursor-not-allowed">
							Registrato </span> <%
 } else {
 %> <span
						class="text-gray-500 font-bold py-2 px-4"> Nessun appello
							disponibile </span> <%
 }
 %>
					</td>
				</tr>
				<%
				}
				%>

			</tbody>
		</table>
		<%
		}
		%>
	</div>

	<div class="container mx-auto px-4">
		<h2 class="text-2xl text-center font-bold my-6">Le mie
			Registrazioni</h2>
		<%
		if (registrazioni == null || registrazioni.isEmpty()) {
		%>
		<div class="text-center text-lg font-semibold mt-5 mb-5">Non ci
			sono registrazioni effettuate.</div>
		<%
		} else {
		%>
		<table class="table-auto w-full mb-6">
			<thead>
				<tr class="bg-blue-500 text-white">
					<th class="px-4 py-2">ID Registrazione</th>
					<th class="px-4 py-2">Titolo Corso</th>
				</tr>
			</thead>
			<tbody class="text-gray-700">
				<%
				for (Registrazione registrazione : registrazioni) {
				%>
				<tr class="bg-white border-b hover:bg-gray-50">
					<td class="border px-4 py-2"><%=registrazione.getRegistrazione_id()%></td>
					<td class="border px-4 py-2"><%=registrazione.getCorso_titolo()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<%
		}
		%>
	</div>
</body>
</html>