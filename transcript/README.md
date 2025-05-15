# Transcript Script Documentation

## Descripción

Este proyecto contiene un script llamado `transcript.sh` que automatiza la extracción de audio y la transcripción de archivos de video o audio utilizando [ffmpeg](https://ffmpeg.org/) y [Whisper](https://github.com/openai/whisper). El script está diseñado para ser robusto y fácil de usar desde la línea de comandos, permitiendo convertir archivos de video a audio y luego generar una transcripción en texto.

## Uso

```sh
sh transcript.sh --source=<ruta_al_archivo_de_entrada> [opciones]
```

### Parámetros principales
- `--source <ruta>`: **(Obligatorio)** Ruta al archivo de video o audio de entrada.
- `--wav <ruta>`: Ruta de salida para el archivo de audio WAV generado (opcional, por defecto usa el mismo nombre que el archivo fuente con extensión `.wav`).
- `--txt <ruta>`: Ruta de salida para el archivo de transcripción (opcional, por defecto usa el mismo nombre que el archivo fuente con extensión `.txt`).
- `--force`: Fuerza la sobrescritura de los archivos de audio y transcripción si ya existen.
- `--whisper-model <modelo>`: Modelo de Whisper a utilizar (por defecto: `base`).

### Ejemplo de uso

```sh
sh transcript.sh --source="video.mp4" --whisper-model="small" --force
```

Esto generará `video.wav` y `video.txt` en el mismo directorio que el archivo fuente, usando el modelo Whisper `small` y sobrescribiendo archivos existentes si es necesario.

## Dependencias
- [ffmpeg](https://ffmpeg.org/)
- Python 3 con el script `transcript-audio.py` y la librería Whisper instalada
- utilidades de shell estándar (`realpath`, `dirname`)
- Funciones utilitarias definidas en `../utils/utils.sh`

## Salidas y Códigos de Error
- Si no se especifica `--source`, el script termina con código **100**.
- Si el archivo fuente no existe, termina con código **101**.
- Si todo es exitoso, termina con código **0**.

## Pruebas Automatizadas

Las pruebas se encuentran en `tests/transcript.spec.sh` y cubren los siguientes escenarios:

- **Sin argumentos:** Verifica que el script falla con el código correcto si no se pasa `--source`.
- **Ruta inválida:** Verifica que el script falla con el código correcto si el archivo fuente no existe.
- **Transcripción exitosa:** Usa un video de muestra y verifica que se generen correctamente los archivos `.wav` y `.txt`.

Para ejecutar las pruebas:

```sh
sh tests/transcript.spec.sh
```

Cada prueba imprime un mensaje de éxito o error según el resultado.

---

> **Nota:** Asegúrate de tener los permisos de ejecución necesarios y todas las dependencias instaladas antes de ejecutar el script o las pruebas.
