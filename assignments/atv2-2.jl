using LinearAlgebra
# Matrix experimental
_A = [ 1.0  2.0  3.0  4.0  5.0 ;
	   2.0  3.0  4.0  5.0  1.0 ;
	   3.0  4.0  5.0  1.0  2.0 ;
	   4.0  5.0  1.0  2.0  3.0 ;
	   5.0  1.0  2.0  3.0  4.0 ]

function user_input()
	println("[W] Por favor insira o tamanho da coluna da matrix")
	_M = parse(Int32, readline())
	println("[W] Por favor insira o tamanho da linha da matrix")
	_N = parse(Int32, readline())
	A = zeros(_M,_N)
	#A = _A
	b = zeros(_N)
	
	for j in 1:_N
		for i in 1:_M
			println("[W] Insira o valor da da posição $i x $j")
			A[i,j] = parse(Float64, readline())
		end
	end

	for i in 1:_N
		println("[W] Insira o valor do vetor na linha $i")
			b[i] = parse(Float64, readline())
	end
	gauss_elim(A, b)
end

function gauss_elim(A, b)
    n = size(A,1)
    # Forma a matrix aumentada 
    Ab = [A b]
    for k = 1:n-1
        # Pivotamento parcial
        p = k
        for i = k+1:n
            if abs(Ab[i,k]) > abs(Ab[p,k])
                p = i
            end
        end
        Ab[[k,p],:] = Ab[[p,k],:]  

        # Eliminação
        for i = k+1:n
            factor = Ab[i,k] / Ab[k,k]
            Ab[i,k:end] -= factor * Ab[k,k:end]
        end
    end

    x = zeros(n)
    # Substituição retroativa para encontrar a solução
    for i = n:-1:1
        x[i] = (Ab[i,end] - dot(Ab[i,i+1:end-1], x[i+1:end])) / Ab[i,i]
    end
    return x
end

user_input()
