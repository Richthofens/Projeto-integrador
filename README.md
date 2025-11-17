# Projeto-integrador (EPI360)

Estrutura organizada do projeto:

- `app.py` - entrada principal do Flask (mantida no root para simplicidade)
- `config.py` - configuração/DB connection
- `templates/` - templates Jinja2
- `static/`
  - `css/` - folhas de estilo (moved `index-style.css`)
  - `icons/` - favicon e ícones

Tarefas realizadas:
- Criadas pastas `static/css` e `static/icons`.
- Copiada a folha de estilos para `static/css/index-style.css`.
- Copiado o favicon para `static/icons/`.
- Atualizado `templates/epi360.html` para apontar aos novos caminhos.

Como testar:

1. Ative o venv:

```powershell
& .\venv\Scripts\Activate.ps1
```

2. Instale dependências (se necessário):

```powershell
pip install -r requirements.txt
```

3. Rode a aplicação:

```powershell
python app.py
```

Abra http://127.0.0.1:5000
