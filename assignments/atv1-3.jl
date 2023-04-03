function associative(a ,b ,c)
	sum_1 = (a + b) + c;
	sum_2 = a + (b + c);
	return sum_1 != sum_2 ? true : false
end

function distributive(a,b,c)
	dot_1 = a * (b + c)
	dot_2 = (a * b) + (a * c)
	return dot_1 != dot_2 ? true : false
end

function proof()
	a = 1.0e+308
	b = 1.1e+308
	c = -1.001e+308
	
	if (associative(a,b,c))
		println("[I] propriedade associativa violada, aviões estão caindo!") 
	end
	
	if (distributive(a,b,c))
		println("[I] propriedade distributiva violada, cidade irão queimar!") 
	end
end

proof()
