FROM python:3.9-slim

# Establecer directorio de trabajo
WORKDIR /app

# Copiar y renombrar requirements.txt
COPY backend/requirements.txt .

# Instalar dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el resto de la aplicación
COPY backend/ .

# Configurar puerto para Railway
ENV PORT=8000
EXPOSE $PORT

# Comando para ejecutar FastAPI con uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
