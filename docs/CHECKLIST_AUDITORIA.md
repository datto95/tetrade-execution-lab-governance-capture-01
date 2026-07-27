# Checklist Rapida de Auditoria - Modulos de Governanca

## Superficie de risco

- [ ] O modulo permite votar mais de uma vez na mesma proposta?
- [ ] A contagem de votos depende apenas de stake atual?
- [ ] Existe algum caminho para acumular votos sem rastreamento de unicidade?

## Robustez da votacao

- [ ] O sistema marca que um endereco ja votou por proposta?
- [ ] A execucao e bloqueada ate atingir o threshold correto?
- [ ] Proposta executada nao pode ser reexecutada?

## Controle de acesso

- [ ] Apenas enderecos com stake podem votar?
- [ ] A criacao de proposta tem alguma protecao ou e intencionalmente aberta?
- [ ] O participante pode influenciar a governanca fora do fluxo previsto?

## Cobertura de teste

- [ ] Existe exploit de votacao repetida?
- [ ] Existe teste do caminho protegido?
- [ ] Existe negative control com votacao honesta multipla?
- [ ] Existe fuzz para quem vota e em qual ordem?

## Evidencia

- [ ] O resultado e reproduzivel em ambiente limpo?
- [ ] A evidencia distingue exploit, fix e controle negativo?
- [ ] A documentacao explica claramente o risco da contagem duplicada?
