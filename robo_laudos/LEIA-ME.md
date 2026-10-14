# Robô de Laudos

Copie `robo_laudos.py`, `requirements.txt` e `INICIAR.bat` para `C:\Users\Home\Desktop\Aula Laudos` (onde está o vídeo).

1. Instale o Python 3.10+ (marque "Add to PATH").
2. Defina sua chave da API Anthropic (uma vez, no Prompt de Comando):
   `setx ANTHROPIC_API_KEY "sua-chave"`
3. **Aprender:** `python robo_laudos.py aprender` → transcreve o vídeo, captura as telas e gera
   `instrucoes_laudo.md` (o método e o modelo de laudo ensinados). Revise/corrija esse arquivo se quiser.
4. **Gerar laudos:** coloque os dados de cada laudo em `entrada\` (um arquivo ou uma subpasta por laudo:
   PDF, Word, Excel, TXT, CSV, fotos) e rode `python robo_laudos.py gerar`.
   Os laudos saem em `laudos\` (.docx e .md).

Ou simplesmente dê dois cliques em `INICIAR.bat`.
