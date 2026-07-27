# Guia do Aluno - governance-capture-01

## Objetivo

Explorar como a contabilizacao de votos sem controle de unicidade permite que a mesma stake seja usada repetidamente para capturar governanca.

## Requisitos

- Foundry instalado (`forge`, `cast`, `anvil`)
- Python 3.10+

## Passo a passo

1. Compile os contratos.

   ```bash
   forge build
   ```

2. Execute os testes.

   ```bash
   forge test -vvv
   ```

3. Gere a evidencia.

   ```bash
   python3 scripts/generate_evidence.py
   ```

4. Valide a evidencia gerada.

   ```bash
   python3 scripts/generate_evidence.py --validate-only evidence/evidence.json
   ```

## O que observar

- O contrato vulneravel soma votos repetidos do mesmo endereco.
- O atacante consegue atravessar o threshold com uma unica stake.
- O contrato corrigido bloqueia o segundo voto do mesmo usuario.
- O negative control mostra que votos honestos de usuarios distintos continuam validos.

## Testes-chave

- `testGovernanceCaptureOnVulnerable`
- `testDoubleVoteBlockedOnFixed`
- `testNegativeControlHonestMultiVoterExecution`
- `testFuzzFixedSingleVotePerUser`
- `testFuzzNonStakerCannotVote`

## Dica

Compare `voteYes` nos dois contratos e identifique onde o voto ja foi contado precisa ser lembrado.
