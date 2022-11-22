# Guia de instalação e uso da API D-END

1- Instalar o GIT BASH em sua máquina.
Link para baixar: https://git-scm.com/downloads

2- Acesse o link: https://github.com/API6Sem22/API6Back
Clique em “code” e logo em seguida copie o link HTTPS, conforme imagem abaixo
![image](https://user-images.githubusercontent.com/55815856/203441469-2b0898f5-5b9a-4c5a-94f5-30904cb33654.png)

3-	Abra um “terminal” no diretório no qual deseja colocar o projeto, e execute o seguinte comando: GIT CLONE https://github.com/API6Sem22/API6Back
![image](https://user-images.githubusercontent.com/55815856/203441490-b10a6cd5-1f6e-45ed-845a-b2a8cf2065bd.png)

4-	Utilize a IDE desejada adicionar um arquivo chamado “.ENV”.

5-	Neste novo arquivo, é necessário declarar as seguintes variáveis de ambiente:
“URL_CSV”, “BANCO_CREDENTIALS”, “COLLECTION”, “CLUSTER”, “COLLECTION_LOGS”

Sendo “URL_CSV” o diretório onde se encontra o csv, “BANCO_CREDENTIALS” a url com os itens de autenticação do mongoDB, “COLLECTION” sendo o nome da collection onde será armazenado os itens, “CLUSTER” o nome do banco de dados e “COLLECTION_LOGS” deve ser preenchido com o valor “logging”.

6-	É preciso que a versão do Python seja igual ou superior: 3.10.4

7-	Após finalizar as configurações no arquivo “.ENV”, localize em sua IDE o botão “RUN” para rodar a aplicação.

