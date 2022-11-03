<h1 align="center">Aplicações das Aggregations na API</h1>

<p align="justify" style="font-family:roboto;"> Essa documentação irá abordar as Aggregations utilizadas na API do sexto semestre da segunda metade de 2022. Para um melhor entendimento, é preciso saber que as aggregations funcionam como scripts, possibilitando a junção de diversas etapas para manipulação de muitos documentos dentro de uma collection.</p> 
<p align="justify" style="font-family:roboto;"> Com as aggregations é possível realizar diversas operações, como agrupamento, filtro, junção ou ordenação dos dados. Através das aggregation você realiza suas operações e o resultado pode ser escrito em uma nova collection, para que dessa forma você não perca os dados originais de suas operações, e foi dessa forma que garantimos a integridade e a segurança dos dados trabalhados em nosso projeto.</p>
<p align="justify" style="font-family:roboto;"> Assim como esperado, as aggregations utilizadas no projeto permitiram a manipulação dos dados de forma eficiente, porém seguindo a orientação e necessidade do cliente, para cada aggregation realizando operações sobre os dados, um novo script era necessário par conservação dos dados descartados durante as operações resultantes. Por exemplo, caso uma aggregation resultasse em trazer apenas os valores únicos, uma nova era necessária para salvar os documentos que seriam descartados por serem cópias de um mesmo valor.</p>

<h2 style="font-family:roboto;"> Aggregation utilizadas no projeto:</h2>

<h2 style="font-family:roboto;"> Utilizada na medical.repasse_trat_unique:</h2>
<b>TratamentMatchValues:</b> Utilizada para criar o merge entre a medical.repasse_trat_unique e a medical_mensalidade_valid values;

<h2 style="font-family:roboto;"> Utilizadas na medical.insurance_amil_repasse:</h2>	

<b>Treatment_unique_data:</b> Consiste em retirar valores duplicados da base de dados, salvando os valores únicos resultando na nova collection medical_repasse_trat_unique;

<b>TreatmentNotUniqueData_Repasse:</b> Diferente da Treatment_unique_data, esta aggregation filtra os valores não únicos que são excluídas na anterior resultando na collection medical_repasse_trat_not_unique;

<h2 style="font-family:roboto;"> Utilizadas na medical.insurance_amil_mensalidade</h2>

<b>Column_and_data_handling:</b> Utilizado para retirar valores duplicados referentes a collection medical.insurance_amil_mensalidade resultando na nova collection medical_mensalidade_unique;

<b>Compare_payment_values:</b> Aggregation utilizada para comparar os valores declarados quanto ao pagamento da mensalidade, com propósito de apresentar os valores reais das dívidas resultando na collection medical_final_mensalidade;

<h2 style="font-family:roboto;"> Utilizada na collection medical_final_mensalidade:</h2>

<b>Condition_filter_and_merge:</b> Filtra pelo campo condicao, utilizando do valor “SomenteCliente” para mergear os dados dessa collection com a medical_final_repasse.

<h2 style="font-family:roboto;">Utilizadas na collection medical_mensalidade_trat_unique:</h2>

<b>Invalid_negative_values:</b> Consiste em validar quais valores são inválidos (negativos), utilizando do campo valor_mensalidade, com o propósito de manter os dados inválidos na collection. O resultado da aggregation gera a collection medical_mensalidade_invalid_values.

<b>Valid_positive_values:</b> Consiste em validar os valores do campo valor_mensalidade na collection, salvando os dados válidos (positivos) em uma nova collection, retirando os inválidos (negativos). A collection resultante dessa agreggation é chamada de medical_mensalidade_valid_values.

