using LinearAlgebra

_A = [2 0 0; 0 3 0; 0 0 2]

function user_input()
	# função apenas para testar gr_dec
	println("[W] Por favor insira o valor de n")
	_M = parse(Int32, readline())
	A = zeros(Float64,_M,_M)
	A = zeros(Float64,3,3)
	#A = _A
	for j in 1:_M
		for i in 1:_M
			println("[W] Insira o valor da da posição $i x $j")
			A[i,j] = parse(Float64, readline())
		end
	end
	qr_dec(A)
end

function qr_dec(A)
    n = size(A, 1)
    Q = zeros(n, n)
    R = zeros(n, n)

    for j in 1:n
        v = A[:, j]
        for i in 1:j-1
            R[i, j] = dot(Q[:, i], A[:, j])
            v -= R[i, j] * Q[:, i]
        end
        R[j, j] = norm(v)
        Q[:, j] = v / R[j, j]
    end

    return Q, R
end

user_input()
