FROM python:3.9-slim

WORKDIR /app

# Instala dependencias
COPY backend/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia todo el código
COPY backend /app

# Expone el puerto y ejecuta la aplicación
ENV PORT=8000
EXPOSE $PORT
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "${PORT}"]
