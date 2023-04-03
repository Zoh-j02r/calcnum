function iterator()
	aux::Float64 = 0.0
	# valor de tolerancia 
	tol = eps() * 10
	for i in 1:30
		aux += 0.2
		if abs(aux - 3.6) < tol
			println("[I] ",aux)
		end
	end
end

iterator()
