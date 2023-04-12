using LinearAlgebra

A_t = [8.0 1.0 -1.0; 2.0 1.0 9.0; 1.0 -7.0 2.0]
b_t = [5.0; 25.0; -10.0]
# adciona um margem para lidar com erro numerico
err_n = 0.005

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
            nl = Ab[i,k] / Ab[k,k]
            Ab[i,k:end] -= nl * Ab[k,k:end]
        end
    end

    x = zeros(n)
    # Substituição retroativa para encontrar a solução
    for i = n:-1:1
        x[i] = (Ab[i,end] - dot(Ab[i,i+1:end-1], x[i+1:end])) / Ab[i,i]
    end
	if A_t*x > b_t .- err_n
		println("[I] A x de fato é igual a b usando eliminação gaussina")
	else
		println("[E] Eliminação gaussina falhou")
	end
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
	y = L \ (P*b)
	x = U \ y
	if A_t*x > b_t .- err_n
		println("[I] A x de fato é igual a b usando decomposição LU")
	else
		println("[E] Decomposição LU falhou")
	end
end

function julia_lu_method(A,b)
	x = lu(A) \ b
	if A_t*x > b_t .- err_n
		println("[I] A x de fato é igual a b usando metodo built-in")
	end
end

@time gauss_elim(A_t,b_t)
@time solve_linear_system(A_t,b_t)
@time julia_lu_method(A_t,b_t)
