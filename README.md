# Calculadora TCP (Cliente/Servidor)

Bruno Antico Galin 10417318

Gustavo Fugulin Soares da Silva 10418552

Projeto de uma calculadora distribuída, permitindo que um cliente enviar operações matemáticas para o servidor executar e devolver o resultado.
---

## Como compilar e executar
# Compilação

````bash
# Servidor
make server

#Cliente
make client
````
# Execução

````bash
# Servidor
make run-server

# Cliente
make run-client
````

## Formato do protocolo
Cliente se conecta
````bash
[CLIENTE] Conectado em 127.0.0.1:5001
[CLIENTE] Digite contas como [OPERAÇÃO OP1 OP2] e pressione ENTER. As operações podem ser soma (ADD), subtração (SUB), multiplicação (MUL), e divisão (DIV). Ctrl+D para sair.
Bem-vindo à calculadora!
````

Servidor recebe novo cliente
````bash
Servidor conectado e ouvindo em 0.0.0.0: 5001 ...
Novo cliente conectado 127.0.0.1:59890 (fd=4)
````

Cliente -> Servidor (Cliente envia a operação ao servidor)
````bash
ADD 10 5

SUB 10 5

MUL 10.00 5.555

DIV 10.50 5.55

DIV 5 0
````

Servidor -> Cliente (Servidor envia o resultado da operação)
````bash
OK 15.000000

OK 5.000000

OK 55.550000

OK 1.891892

ERR EZDV divisao_por_zero
````

Exemplo do terminal
````bash
@BrunoAG77 ➜ /workspaces/calculadora-socket (main) $ make run-client
./client 127.0.0.1 5001
[CLIENTE] Conectado em 127.0.0.1:5001
[CLIENTE] Digite contas como [OPERAÇÃO OP1 OP2] e pressione ENTER. As operações podem ser soma (ADD), subtração (SUB), multiplicação (MUL), e divisão (DIV). Ctrl+D para sair.
Bem-vindo à calculadora!
ADD 10 20
OK 30.000000
ADD 2.675 8.79
OK 11.465000
QUIT
Calculadora encerrada.
[CLIENTE] Servidor encerrou a conexão.
@BrunoAG77 ➜ /workspaces/calculadora-socket (main) $ 
````

Cliente encerra a conexão
````bash
QUIT
Calculadora encerrada.
[CLIENTE] Servidor encerrou a conexão.
````

Servidor encerra a conexão
````bash
^CCalculadora encerrada com CTRL + C
````

## Decisões de projeto
- Tratamento de erro (entrada inválida (sintaxe ou operador inválidos) e divisão por zero);
- Logs simples no servidor (conexões, requisições, desconexões);
- Tratamento para encerramento do servidor com CTRL + C;
- Resultados podem ter até 6 casas decimais;

## Limitações
- Servidor é single-thread, atendendo um cliente de cada vez;
- Executa apenas as quatro operações básicas;
- Executa conta para apenas dois algarismos;
