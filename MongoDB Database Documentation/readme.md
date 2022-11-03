<h1 align="center">Aplicações das Aggregations na API</h1>

<p align="justify" style="font-family:roboto;"> Essa documentação irá abordar as Aggregations utilizadas na API do sexto semestre da segunda metade de 2022. Para um melhor entendimento, é preciso saber que as aggregations funcionam como scripts, possibilitando a junção de diversas etapas para manipulação de muitos documentos dentro de uma collection.</p> 
<p align="justify" style="font-family:roboto;"> Com as aggregations é possível realizar diversas operações, como agrupamento, filtro, junção ou ordenação dos dados. Através das aggregation você realiza suas operações e o resultado pode ser escrito em uma nova collection, para que dessa forma você não perca os dados originais de suas operações, e foi dessa forma que garantimos a integridade e a segurança dos dados trabalhados em nosso projeto.</p>
<p align="justify" style="font-family:roboto;"> Assim como esperado, as aggregations utilizadas no projeto permitiram a manipulação dos dados de forma eficiente, porém seguindo a orientação e necessidade do cliente, para cada aggregation realizando operações sobre os dados, um novo script era necessário par conservação dos dados descartados durante as operações resultantes. Por exemplo, caso uma aggregation resultasse em trazer apenas os valores únicos, uma nova era necessária para salvar os documentos que seriam descartados por serem cópias de um mesmo valor.</p>

<h2 style="font-family:roboto;"> Aggregation utilizadas no projeto:</h2>

<h2 style="font-family:roboto;"> Utilizada na medical.repasse_trat_unique:</h2>
<p align="justify" style="font-family:roboto;">TratamentMatchValues: Utilizada para criar o merge entre a medical.repasse_trat_unique e a medical_mensalidade_valid values;</p>

<h2 style="font-family:roboto;"> Utilizadas na medical.insurance_amil_repasse:</h2>	
* Treatment_unique_data: Consiste em retirar valores duplicados da base de dados, salvando os valores únicos resultando na nova collection medical_repasse_trat_unique.

<p align="justify" style="font-family:roboto;">TreatmentNotUniqueData_Repasse: Diferente da Treatment_unique_data, esta aggregation filtra os valores não únicos que são excluídas na anterior resultando na collection medical_repasse_trat_not_unique.</p>

<h2 style="font-family:roboto;"> Utilizadas na medical.insurance_amil_mensalidade</h2>
<p align="justify" style="font-family:roboto;">Column_and_data_handling: Utilizado para retirar valores duplicados referentes a collection medical.insurance_amil_mensalidade resultando na nova collection medical_mensalidade_unique.</p>

<p align="justify" style="font-family:roboto;">Compare_payment_values: Aggregation utilizada para comparar os valores declarados quanto ao pagamento da mensalidade, com propósito de apresentar os valores reais das dívidas resultando na collection medical_final_mensalidade.</p>

<h2 style="font-family:roboto;"> Utilizada na collection medical_final_mensalidade:</h2>
<p align="justify" style="font-family:roboto;">Condition_filter_and_merge: Filtra pelo campo condicao, utilizando do valor “SomenteCliente” para mergear os dados dessa collection com a medical_final_repasse.</p>

Utilizadas na collection medical_mensalidade_trat_unique:

<p align="justify" style="font-family:roboto;">Invalid_negative_values: Consiste em validar quais valores são inválidos (negativos), utilizando do campo valor_mensalidade, com o propósito de manter os dados inválidos na collection. O resultado da aggregation gera a collection medical_mensalidade_invalid_values.</p>

<p align="justify" style="font-family:roboto;">Valid_positive_values: Consiste em validar os valores do campo valor_mensalidade na collection, salvando os dados válidos (positivos) em uma nova collection, retirando os inválidos (negativos). A collection resultante dessa agreggation é chamada de medical_mensalidade_valid_values.</p>

