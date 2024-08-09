local function gerarNumeroAleatorio(min, max)
	return math.random(min, max)
end

local function lerEntrada()
	while true do
		io.write("Digite um número entre 1 e 100: ")
		local input = tonumber(io.read())
		if input and input >= 1 and input <= 100 then
			return input
		else
			print("Entrada inválida! Por favor, digite um número entre 1 e 100.")
		end
	end
end

local function jogoAdivinhacao()
	math.randomseed(os.time())

	local numeroSecreto = gerarNumeroAleatorio(1, 100)
	local tentativas = 0
	local maxTentativas = 10
	local tentativa

	print("Bem-vindo ao jogo de adivinhação! Você tem " .. maxTentativas .. " tentativas para adivinhar o número secreto.")

	while tentativas < maxTentativas do
		tentativa = lerEntrada()
		tentativas = tentativas + 1

		if tentativa == numeroSecreto then
			print("Parabéns! Você acertou o número em " .. tentativas .. " tentativa(s).")
			return
		elseif tentativa < numeroSecreto then
			print("Tente um número maior.")
		else
			print("Tente um número menor.")
		end

		print("Tentativas restantes: " .. (maxTentativas - tentativas))
	end

	print("Você não conseguiu adivinhar o número. O número secreto era: " .. numeroSecreto)
end

local function jogarNovamente()
	io.write("Deseja jogar novamente? (s/n): ")
	local resposta = io.read():lower()
	return resposta == "s" or resposta == "sim"
end

repeat
	jogoAdivinhacao()
until not jogarNovamente()

print("Obrigado por jogar!")
