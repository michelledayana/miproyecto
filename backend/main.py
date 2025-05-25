from fastapi import FastAPI, Request
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
from fastapi.responses import HTMLResponse
import os

app = FastAPI()

# Montar archivos estáticos (CSS, JS, imágenes)
app.mount("/static", StaticFiles(directory="static"), name="static")

# Cargar plantillas desde la carpeta templates
templates = Jinja2Templates(directory="templates")

@app.get("/", response_class=HTMLResponse)
async def hola_mundo(request: Request):
    return templates.TemplateResponse(
        "index.html",
        {"request": request, "mensaje": "¡Hola Mundo! 🌍"}
    )

if __name__ == "__main__":
    import uvicorn
    port = int(os.getenv("PORT", 8000))  # Compatible con Railway
    uvicorn.run(app, host="0.0.0.0", port=port)
