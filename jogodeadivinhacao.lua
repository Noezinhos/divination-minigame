-- Função para gerar um número aleatório entre min e max
local function gerarNumeroAleatorio(min, max)
	return math.random(min, max)
end

-- Função para ler a entrada do jogador
local function lerEntrada()
	io.write("Digite um número entre 1 e 100: ")
	return tonumber(io.read())
end

-- Função principal do jogo
local function jogoAdivinhacao()
	math.randomseed(os.time()) -- Inicializa a semente para gerar números aleatórios

	local numeroSecreto = gerarNumeroAleatorio(1, 100)
	local tentativas = 0
	local tentativa

	print("Bem-vindo ao jogo de adivinhação! Você tem 10 tentativas para adivinhar o número secreto.")

	while tentativas < 10 do
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
	end

	print("Você não conseguiu adivinhar o número. O número secreto era: " .. numeroSecreto)
end

-- Inicia o jogo
jogoAdivinhacao()