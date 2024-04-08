# Utilize a imagem base do Python 3.11 com Alpine
FROM python:3.11-alpine

# Defina o diretório de trabalho no container
WORKDIR /app

# Copie o requirements.txt para o container e instale as dependências
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copie o resto do seu código de aplicação para o container
COPY . /app

# Informe ao Docker que a aplicação roda na porta 80
EXPOSE 80

# Comando para rodar a aplicação usando o Uvicorn com um caminho de importação absoluto
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]