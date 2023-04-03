using Random
using Printf

function bin_txt_generator()
	println("[W] O tamanho de um double em bytes em Julia é ",sizeof(Float64))
	txt = open("text.txt", "w")
	bin = open("binary.bin", "w")
	x = rand(Float64,1000)
	for i in 1:1000
		double = @sprintf("%.16f\n", x[i])
		write(txt,double)
		write(bin,x[i])
	end
	close(txt)
	println("[I] Arquivo txt criado")
	println("[I] O arquivo em texto possui ",stat("text.txt").size," bytes")
	close(bin)
	println("[I] Arquivo bin criado")
	println("[I] O arquivo binario possui ",stat("binary.bin").size," bytes")
end

bin_txt_generator()
