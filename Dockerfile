FROM python:3.9-slim

WORKDIR /app

# Copia requirements.txt primero (usa ruta relativa)
COPY ./backend/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copia el resto de la aplicación
COPY ./backend .

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
