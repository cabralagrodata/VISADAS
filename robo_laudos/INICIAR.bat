@echo off
cd /d "%~dp0"
pip install -q -r requirements.txt
if not exist instrucoes_laudo.md python robo_laudos.py aprender
python robo_laudos.py gerar
pause
