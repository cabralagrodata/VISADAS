# Contexto: croquis de visada (VISADAS)

Arquivo para retomar o trabalho de croquis de visada em outro computador.
Coloque-o na pasta dos scripts (pode renomear para `CLAUDE.md`, que o Claude Code lê automaticamente) e peça: "leia CONTEXTO_VISADAS.md e continue".

## O que é o trabalho
Gerar, para cada imóvel de uma OS, um **croqui de visada** em folha **A1** (PDF):
- planta do imóvel recortada do **PPD** (PDF do CAD), sem as tabelas, caixas e molduras do PPD;
- **setas numeradas** indicando posição e direção de cada foto;
- as **fotos** da vistoria;
- carimbo com data, SIAD e **assinaturas** (inclusive a da **Ana**).

## Scripts (estavam em `C:\Users\Home\...`; copiar para o computador novo)
- `main.py`: ponto de entrada, gera os croquis em lote.
- `gerador_croqui.py`: recorte da planta, limpeza do PPD, montagem da folha A1.
- `_prep<OS>_<imovel>.py` (ex.: `_prep002_0004.py`): ajustes manuais por imóvel (setas extras etc.).
- `checa.py`: confere os ângulos das setas.
- PNGs das assinaturas.

## Pastas usadas
- `Desktop\Visadas OS 07\Visadas\Feitas`: saída da OS 07.
- `Desktop\Visadas OS 07\Visadas\Fotos faltantes`: fotos extraídas de zip.
- `Vistoria Kael\OS-007`: fotos da vistoria.
- `VISADAS OS 02\0004` e `VF`: destino do PDF final de cada imóvel.
- Google Drive: pastas por SIAD (só subir depois de assinado).

## Regras já implementadas (não desfazer)
- As setas e os números vêm dos blocos do CAD em cada PPD, sem leitura manual. Pulos na numeração são do próprio desenho.
- Setas que se cruzam: cada número é casado com a ponta certa.
- Rótulos de confrontante que tocam a zona do lote aparecem inteiros. As caixas de assinatura do PPD ficam de fora.
- Remover do PPD: a moldura do título das tabelas, a caixa cinza "CONFRONTANTE NN" sem "Assinaturas:" (unindo as faixas) e a moldura da caixa de escala junto com a barra. Uma segunda passada pinta de branco os traços que sobram nas áreas marcadas, sem afetar texto.
- Datas preservadas (bug antigo: "01/10/2026" virava "1/1/2026").
- **Bug corrigido:** o cache de tabelas usava `id()` do documento como chave, e um PDF herdava tabelas de outro. A chave agora inclui o nome do arquivo.
- **Não rodar lotes em paralelo:** eles disputam o mesmo arquivo temporário. Gerar em sequência.
- Folhas com muitas setas (ex.: 28) reduzem a escala (1/350, 1/500) sem sobrepor rótulos.
- SIAD com nome de pasta errado no Drive (ex.: "00115-8" é o 000115-8).

## Situação / pendências
1. **OS 07**: 25 croquis prontos e conferidos (ainda não assinados nem enviados ao Drive).
2. **0004 (SIAD 000819-1, OS 02)**: faltam 7 setas verdes novas (números aparentes 85, 87, 89, 91, 92, 93, 94), vistas em `Downloads\Planta_SIAD_000819-1_Fotos_Externas_GPS.pdf`, regiões em pt:
   - (479–540, 762–800), perto dos círculos 10, 11 e 12;
   - (665–694, 730–755), acima do Ed. 002;
   - (862–1044, 689–815), à direita dos Ed. 001 e 002.
   Passos: ler cada seta com zoom e conferir com as fotos novas; acrescentar em `_prep002_0004.py`; gerar de novo; rodar `checa.py`; copiar para `0004` e `VF`.
3. **0004 e 0213 sem a assinatura da Ana**: corrigir e gerar de novo. Suspeita: a limpeza de caixas cinza/"Assinaturas:" está apagando a assinatura, ou falta o caminho do PNG.
4. **OS 004, 006 e 009**: gerados em lote antes da correção do cache, então podem ter tabelas herdadas. Revisar sem regravar e só regerar com autorização.

## Como conferir
Gerar um painel de miniaturas das folhas e dar zoom só onde houver dúvida (restos de tabela, caixa cinza, rótulo cortado, assinatura faltando).
