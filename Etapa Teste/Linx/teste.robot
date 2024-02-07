*** Settings ***
Documentation     Teste para o processo seletivo de Analista de Testes Sênior.
Resource  resource.robot


*** Test Cases ***
Cenario 01: Eu como usuario, gostaria de acessar site Linx, consultar as filiais e filtrar os segmentos de carreira
  #Step 1 -  Acessa site https:// linx.com.br
  Acesso ao Site Linx
  #Step2 - Localiza Menu e acessa Institucional> Matriz e filiais
  Acessar Menu   Institucional  Matriz e filiais
  #Step3 - Valida se Filial Cascavel/PR está visivel e se Aparecida de Goiania não está
  Filal deverá ser visivel em tela    Cascavel/PR
  Filal não deverá ser visivel em tela    Aparecida de Goiania
  #Step4 - Retorna a tela inicial
  Retornar a tela inicial
  #Step5 - Localiza Menu e acessa Institucional> Carreira Linx
  Acessar Menu      Institucional   Carreira Linx
  #Step6 - Identifica filtro valida se existe segmento Suporte na lista, Filtra Segmento Tecnologia e Produto e Valida se Filtragem está Correta
  Filtrar segmento em Carreira Linx      Linx - Suporte      Linx - Tecnologia e Produto











    