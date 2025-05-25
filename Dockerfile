FROM python:3.9-slim

WORKDIR /app

# Copia requirements.txt primero
COPY backend/requirements.txt .

# Instala dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Copia toda la aplicación
COPY backend .

# Configura puerto
ENV PORT=8000
EXPOSE $PORT

# Comando de ejecución
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
