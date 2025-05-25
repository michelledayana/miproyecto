FROM python:3.9-slim

WORKDIR /app

# Copia requirements.txt primero para cachear dependencias
COPY ./bakend/requirements.txt .   # Añadido ./

RUN pip install --no-cache-dir -r requirements.txt

# Copia TODO el contenido de backend
COPY ./bakend/ .   # Cambiado de '/backend' a './backend/'

# Configuración del puerto
ENV PORT=8000
EXPOSE $PORT

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "${PORT}"]
