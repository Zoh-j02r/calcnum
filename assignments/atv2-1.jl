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
	for j in 1:_N
		for i in 1:_M
			println("[W] Insira o valor da da posição $i x $j")
			A[i,j] = parse(Float64, readline())
		end
	end
	gauss_elim(A)
end

function gauss_elim(A)
    n = size(A,1)
    for k = 1:n-1
		# Pivotamento parcial
        p = k
        for i = k+1:n
            if abs(A[i,k]) > abs(A[p,k])
                p = i
            end
        end
        A[[k,p],:] = A[[p,k],:]  
		# Eliminação
        for i = k+1:n
            nl = A[i,k] / A[k,k]
            A[i,k:end] -= nl * A[k,k:end]
        end
    end
	return A
end

user_input()
