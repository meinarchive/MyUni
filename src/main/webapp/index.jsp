<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.tailwindcss.com"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css"
	rel="stylesheet" />
<title>Insert title here</title>
</head>
<body>
	<div class="container mx-auto px-4">
		<nav class="my-4 mb-10 bg-[#f7f7f7] px-6 py-4 shadow">
			<div class="flex justify-between items-center">
				<div class="text-lg text-gray-700 font-bold">
					<a href="" class="flex items-center"> <svg
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
					<a href=""
						class="text-gray-700 text-sm font-bold mx-4 hover:text-green-500">Home</a>
					<a href="#"
						class="text-gray-700 text-sm font-bold mx-4 hover:text-green-500">Didattica</a>
					<a href="#"
						class="text-gray-700 text-sm font-bold mx-4 hover:text-green-500">Blog
						Alunni</a> <a
						href="${pageContext.request.contextPath}/loginProfessore"
						class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline mx-2">Login
						Professore</a> <a
						href="${pageContext.request.contextPath}/loginStudente"
						class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">Login
						Studente</a>
				</div>
			</div>
		</nav>


		<div id="controls-carousel" class="relative w-full"
			data-carousel="slide">
			<div class="relative h-56 overflow-hidden rounded-lg md:h-96">
				<div class="hidden duration-700 ease-in-out" data-carousel-item>
					<img src="images/slide1.jpg"
						class="absolute block w-full -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2"
						alt="...">
				</div>
				<div class="hidden duration-700 ease-in-out"
					data-carousel-item="active">
					<img src="images/slide2.jpg"
						class="absolute block w-full -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2"
						alt="...">
				</div>
				<div class="hidden duration-700 ease-in-out" data-carousel-item>
					<img src="images/slide3.jpg"
						class="absolute block w-full -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2"
						alt="...">
				</div>
				<div class="hidden duration-700 ease-in-out" data-carousel-item>
					<img src="images/slide4.jpg"
						class="absolute block w-full -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2"
						alt="...">
				</div>
				<div class="hidden duration-700 ease-in-out" data-carousel-item>
					<img src="images/slide5.jpg"
						class="absolute block w-full -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2"
						alt="...">
				</div>
			</div>
			<button type="button"
				class="absolute top-0 start-0 z-30 flex items-center justify-center h-full px-4 cursor-pointer group focus:outline-none"
				data-carousel-prev>
				<span
					class="inline-flex items-center justify-center w-10 h-10 rounded-full bg-green-500 hover:bg-green-700 text-white focus:ring-4 focus:ring-green-300 focus:outline-none">
					<svg class="w-4 h-4" aria-hidden="true"
						xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
            <path stroke="currentColor" stroke-linecap="round"
							stroke-linejoin="round" stroke-width="2" d="M5 1 1 5l4 4" />
        </svg> <span class="sr-only">Previous</span>
				</span>
			</button>
			<button type="button"
				class="absolute top-0 end-0 z-30 flex items-center justify-center h-full px-4 cursor-pointer group focus:outline-none"
				data-carousel-next>
				<span
					class="inline-flex items-center justify-center w-10 h-10 rounded-full bg-green-500 hover:bg-green-700 text-white focus:ring-4 focus:ring-green-300 focus:outline-none">
					<svg class="w-4 h-4" aria-hidden="true"
						xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
            <path stroke="currentColor" stroke-linecap="round"
							stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4" />
        </svg> <span class="sr-only">Next</span>
				</span>
			</button>

		</div>
	</div>
	<!-- About Us Section -->
	<section class="py-12 px-4">
		<div class="max-w-4xl mx-auto text-center">
			<h2 class="text-3xl font-bold text-gray-800">Chi siamo</h2>
			<p class="mt-4 text-lg text-gray-600">In un mondo in rapida
				evoluzione, la nostra universita' si erge come faro dell'istruzione
				superiore, plasmando il futuro attraverso l'illuminazione delle
				menti e la coltivazione delle potenzialità individuali. Fondata con
				la visione di ispirare, innovare e influenzare positivamente, siamo
				un'istituzione che abbraccia la sfida di preparare gli studenti per
				una società dinamica e globalizzata.</p>
		</div>
	</section>
	<section class="py-12 px-4 bg-gray-100">
		<div class="max-w-6xl mx-auto">
			<h2 class="text-3xl font-bold text-gray-800 text-center">I
				nostri Corsi</h2>
			<div
				class="mt-8 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
				<div class="bg-white shadow rounded-lg p-6">
					<h3 class="text-xl font-bold text-gray-800">Intelligenza
						Artificiale</h3>
					<p class="text-gray-600 mt-2">Il corso di Intelligenza
						Artificiale Applicata offre agli studenti una panoramica avanzata
						delle applicazioni pratiche dell'intelligenza artificiale (IA).
						Gli studenti esploreranno algoritmi di apprendimento automatico e
						reti neurali.</p>
					<a href="#"
						class="mt-4 inline-block bg-green-500 text-white font-bold py-2 px-4 rounded hover:bg-green-700">Richiedi
						informazioni</a>
				</div>
				<div class="bg-white shadow rounded-lg p-6">
					<h3 class="text-xl font-bold text-gray-800">Ingegneria
						Informatica</h3>
					<p class="text-gray-600 mt-2">Il corso di Ingegneria del
						Software Avanzata è progettato per approfondire la comprensione
						degli studenti dei principi chiave e delle pratiche avanzate nella
						progettazione,sviluppo e manutenzione di sistemi software
						complessi.</p>
					<a href="#"
						class="mt-4 inline-block bg-green-500 text-white font-bold py-2 px-4 rounded hover:bg-green-700">Richiedi
						informazioni</a>
				</div>
				<div class="bg-white shadow rounded-lg p-6">
					<h3 class="text-xl font-bold text-gray-800">Ingegneria
						Meccanica</h3>
					<p class="text-gray-600 mt-2">Il corso di Ingegneria Meccanica
						offre agli studenti una formazione completa nell'ambito
						dell'ingegneria,con un'enfasi sui principi meccanici. Gli studenti
						acquisiscono competenze per la progettazione di sistemi meccanici.</p>
					<a href="#"
						class="mt-4 inline-block bg-green-500 text-white font-bold py-2 px-4 rounded hover:bg-green-700">Richiedi
						informazioni</a>
				</div>
			</div>
		</div>
	</section>
	<footer class="bg-gray-800 text-white">
		<div class="max-w-6xl mx-auto px-4 py-10">
			<div class="md:flex md:justify-between">
				<div class="mb-6 md:mb-0">
					<a href="#" class="flex items-center"> <svg
							xmlns="http://www.w3.org/2000/svg"
							class="h-8 w-8 text-green-500 mr-2" fill="none"
							viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
            <path
								d="M21.42 10.922a1 1 0 0 0-.019-1.838L12.83 5.18a2 2 0 0 0-1.66 0L2.6 9.08a1 1 0 0 0 0 1.832l8.57 3.908a2 2 0 0 0 1.66 0z"></path>
            <path d="M22 10v6"></path>
            <path d="M6 12.5V16a6 3 0 0 0 12 0v-3.5"></path>
          </svg> <span class="font-bold text-lg">MyUni</span>
					</a>
					<p class="mt-2">Empowering students and educators to achieve
						their best.</p>
				</div>
				<div class="grid grid-cols-2 gap-8 sm:grid-cols-3 md:grid-cols-4">
					<div>
						<h6 class="font-bold uppercase">Risorse</h6>
						<ul class="mt-4">
							<li><a href="#" class="hover:text-green-400">Blog</a></li>
							<li><a href="#" class="hover:text-green-400">eBooks</a></li>
							<li><a href="#" class="hover:text-green-400">Webinari</a></li>
						</ul>
					</div>
					<div>
						<h6 class="font-bold uppercase">Supporto</h6>
						<ul class="mt-4">
							<li><a href="#" class="hover:text-green-400">FAQs</a></li>
							<li><a href="#" class="hover:text-green-400">Aiuto</a></li>
							<li><a href="#" class="hover:text-green-400">Contatti</a></li>
						</ul>
					</div>
					<div>
						<h6 class="font-bold uppercase">Legale</h6>
						<ul class="mt-4">
							<li><a href="#" class="hover:text-green-400">Termini di
									servizio</a></li>
							<li><a href="#" class="hover:text-green-400">Privacy
									Policy</a></li>
							<li><a href="#" class="hover:text-green-400">Cookie
									Policy</a></li>
						</ul>
					</div>
					<div>
						<h6 class="font-bold uppercase">Follow Us</h6>
						<ul class="mt-4">
							<li><a href="#" class="hover:text-green-400">Facebook</a></li>
							<li><a href="#" class="hover:text-green-400">Twitter</a></li>
							<li><a href="#" class="hover:text-green-400">LinkedIn</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="text-center mt-10 border-t border-gray-700 pt-8">
				&copy; 2024 MyUni. All rights reserved.</div>
	</footer>


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>
</body>
</html>