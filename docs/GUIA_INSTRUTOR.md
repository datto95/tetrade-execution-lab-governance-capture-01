# Guia do Instrutor - governance-capture-01

## Objetivo da atividade

Demonstrar como um sistema de votacao sem controle de voto unico pode ser capturado por repeticao da mesma stake.

## Roteiro sugerido

1. Apresente a tesouraria de governanca vulneravel e o threshold.
2. Mostre o ataque com multiplas chamadas de voto do mesmo endereco.
3. Execute o teste do contrato corrigido.
4. Discuta por que rastrear votos por proposta e essencial.
5. Feche com a evidencia em JSON.

## Perguntas para debate

- O que torna um voto reutilizavel?
- O threshold por si so impede captura?
- O rastreamento por endereco e suficiente ou o sistema precisa de mais contexto?
- O negative control evita qual falso positivo?
- Como o fuzz ajuda a validar propostas, stakes e ordens de voto?

## Resultado esperado

O participante deve concluir que:

- votos precisam de unicidade por proposta;
- o threshold perde sentido se a mesma stake puder ser contada varias vezes;
- testes positivos e negativos devem coexistir;
- evidencia automatizada reduz ambiguidade na avaliacao.

## Materiais de apoio

- `README.md`
- `docs/ROTEIRO.md`
- `docs/CHECKLIST_AUDITORIA.md`
