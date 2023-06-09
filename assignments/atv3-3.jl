_A = [15 2 3 4; 2 5 7 5; 3 7 9 6; 4 5 6 7]

function qr_decomposition(A)
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

function _eigen(A)
    n = size(A, 1)
    k_max = 1000
    tol = 1e-8
    for k in 1:k_max
        Q, R = qr_decomposition(A)
        A = R * Q
        # Verificar convergência
        off_diag = sum(abs.(A[i, j]) for i in 1:n, j in 1:n if i != j)
        if off_diag < tol
            break
        end
    end
    eigen_v = diag(A)
    return eigen_v
end

A = _eigen(_A)
B = eigen(_A)
println("[I] Resultado do metodo builtin (Equivalente do eig de Matlab em Julia):")
println(B.values)
println("[I] Resultado dos autovalores com método utilizando decomposição QR:")
println(A)
