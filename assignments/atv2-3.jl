
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
	solve_linear_system(A, b)
end

function get_plu(A)
    n = size(A,1)
    P = Matrix{Float64}(I, n, n)
    L = Matrix{Float64}(I, n, n)
    U = copy(A)

    for k = 1:n-1
        # Pivotamento parcial
        p = k
        for i = k+1:n
            if abs(U[i,k]) > abs(U[p,k])
                p = i
            end
        end
        if p != k
            U[[k,p],k:end] = U[[p,k],k:end]
            P[[k,p],:] = P[[p,k],:]
            L[[k,p],1:k-1] = L[[p,k],1:k-1]
        end
        # Eliminação
        for i = k+1:n
            nl = U[i,k] / U[k,k] 
			L[i,k] = nl 
            U[i,k:end] -= nl * U[k,k:end]
        end
    end
    L = L + Matrix{Float64}(I, n, n)
	return P, L, U
end

function solve_linear_system(A, b)
    P, L, U = get_plu(A)
    b_permuted = P * b
    y = L \ b_permuted
    x = U \ y
    return x
end

user_input()
