FROM python:3.9-slim

WORKDIR /app

# Copia primero requirements.txt para cachear dependencias
COPY backend/requirements.txt .

# Instala dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Copia el resto de los archivos
COPY backend /app

# Puerto y comando de ejecución
ENV PORT=8000
EXPOSE $PORT
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "${PORT}"]
