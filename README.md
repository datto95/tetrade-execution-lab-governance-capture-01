# governance-capture-01

[![CI](https://github.com/datto95/tetrade-execution-lab-governance-capture-01/actions/workflows/ci.yml/badge.svg)](https://github.com/datto95/tetrade-execution-lab-governance-capture-01/actions/workflows/ci.yml)

Didactic proof of concept for the Tetrade execution lab.

This lab demonstrates governance capture via repeated voting with the same stake:

- vulnerable path: proposal vote accounting does not prevent double-voting.
- attacker loops votes with one stake unit and crosses execution threshold.
- fixed path: one vote per address per proposal blocks capture.

## Lab scope

- src/VulnerableGovernanceTreasury.sol: flawed governance vote accounting.
- src/FixedGovernanceTreasury.sol: per-proposal voter tracking.
- src/GovernanceCaptureAttacker.sol: simulator for repeated-vote capture.
- test/GovernanceCaptureExploit.t.sol: exploit, fix, negative control, and fuzz tests.
- scripts/generate_evidence.py: reproducible JSON evidence generation and schema check.

## Didactic docs

- `docs/GUIA_ALUNO.md`
- `docs/GUIA_INSTRUTOR.md`
- `docs/CHECKLIST_AUDITORIA.md`
- `docs/ROTEIRO.md`

## Prerequisites

- Foundry installed (forge --version)
- Python 3.10+

## Quick start

```bash
forge build
forge test -vvv
python3 scripts/generate_evidence.py
python3 scripts/generate_evidence.py --validate-only evidence/evidence.json
```

## Expected signals

- vulnerable governance can be captured by repeated votes from one staker.
- fixed governance rejects second vote from same voter.
- negative control shows honest multi-voter execution still works.

## Useful commands

```bash
make build
make test
make gas-report
make evidence
make validate
```
