# Transcripción de Videos

**Transcripción de Videos** es una herramienta que permite convertir un archivo de video en formato `.mp4` en un archivo de texto con la transcripción completa del contenido hablado.  
Es ideal para tomar notas, analizar contenido o extraer información de manera eficiente.



## 🧰 Requisitos

Antes de comenzar, asegúrate de tener instaladas las siguientes herramientas en tu equipo:

- **Python**  
  Se recomienda instalar Python utilizando [`asdf`](https://asdf-vm.com), un gestor de versiones que facilita su manejo en distintos entornos.

- **ffmpeg**  
  Utilizado para la extracción de audio desde archivos `.mp4`. Puede instalarse, por ejemplo, con Homebrew:

  ```bash
  brew install ffmpeg
  ```



## ⚙️ Instalación

1. Clona el repositorio y entra en la carpeta del proyecto:

   ```bash
   cd transcript
   ```

2. Ejecuta el siguiente comando para instalar las dependencias:

   ```bash
   make install
   ```

   Esto creará un entorno virtual de Python y descargará automáticamente todas las dependencias necesarias para el proyecto.



## 🚀 Uso

Para transcribir un archivo `.mp4`, ejecuta el siguiente comando:

```bash
make transcript-mp4 MP4_FILE=/ruta/al/video.mp4 AUDIO_FILE=/ruta/al/audio.wav TRANSCRIPT_FILE=/ruta/a/la/transcripcion.txt
```

### Parámetros

- `MP4_FILE`: Ruta absoluta al archivo de video `.mp4`.
- `AUDIO_FILE`: Ruta donde se guardará el archivo `.wav` extraído del video.
- `TRANSCRIPT_FILE`: Ruta donde se guardará el archivo `.txt` con la transcripción del contenido.



## 📄 Licencia

Este proyecto está licenciado bajo la [MIT License](./LICENSE).  
Puedes usarlo, modificarlo y distribuirlo libremente, siempre que mantengas los créditos originales.
