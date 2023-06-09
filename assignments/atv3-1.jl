using LinearAlgebra
using NLsolve

x0 = [1.0 1.0 1.0]

function Jac(x)
	# Bruh
end

function fun!(f,x)
    f[1] = x[1]^2 + x[2]^2 + x[3]^2 - 1
    f[2] = sin(x[1]) + x[3]^2 + x[3]
    f[3] = x[1]^2 - 2x[2] + x[3]
end

println("Solução do item B(nlsolve é o equivalente de fsolve em Julia):")
ans = nlsolve(fun!, x0)
println("Solução do item C:")
println(abs(fun(x0)))
# 🤯 não consegui fazer o item D 🤯
