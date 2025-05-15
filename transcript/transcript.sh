#!/bin/sh

set -e

# -------------------------------------------------
# __FILENAME stores the absolute path to the currently executing script file.
# This is useful for referencing the script's location regardless of the current working directory.
# -------------------------------------------------
__FILENAME="$(realpath "$0")"

# -------------------------------------------------
# __DIRNAME almacena el directorio donde se encuentra el archivo cuyo nombre está en la variable $__FILENAME.
# Utiliza el comando dirname para extraer la ruta del directorio contenedor del archivo.
# -------------------------------------------------
__DIRNAME="$(dirname "$__FILENAME")"

# -------------------------------------------------
# Importing utility functions
# -------------------------------------------------
. "$__DIRNAME/../utils/utils.sh"

# -------------------------------------------------
# Path to the source file to be used in the script.
# It must be assigned with the location of the input file.
# -------------------------------------------------
SOURCE_PATH=""

# -------------------------------------------------
# Variable to control if the user wants to force overwrite the audio file if it already exists
# 0 = No, 1 = Yes
# Default value is 0 (No)
# This variable is used to check if the user has provided the --force option
# -------------------------------------------------
FORCE_OVERWRITE=0

AUDIO_PATH=""
TRANSCRIPT_PATH=""
WHISPER_MODEL="base"

while [ $# -gt 0 ]; do
    case "$1" in
        --source=*)
            SOURCE_PATH="${1#*=}"
            shift
            ;;
        --source)
            shift
            SOURCE_PATH="$1"
            shift
            ;;
        --force)
            FORCE_OVERWRITE=1
            shift
            ;;
        --force=*)
            FORCE_OVERWRITE="${1#*=}"
            shift
            ;;
        --wav=*)
            AUDIO_PATH="${1#*=}"
            shift
            ;;
        --wav)
            shift
            AUDIO_PATH="$1"
            shift
            ;;
        --txt=*)
            TRANSCRIPT_PATH="${1#*=}"
            shift
            ;;
        --txt)
            shift
            TRANSCRIPT_PATH="$1"
            shift
            ;;
        --whisper-model=*)
            WHISPER_MODEL="${1#*=}"
            shift
            ;;
        --whisper-model)
            shift
            WHISPER_MODEL="$1"
            shift
            ;;
        *)
            shift
            ;;
    esac
done

if [ -z "$SOURCE_PATH" ]; then
    echo_error " Error: Debes especificar el parámetro --source"
    exit 100
fi

if [ ! -f "$SOURCE_PATH" ]; then
    echo_error " Error: El archivo '$SOURCE_PATH' no existe."
    exit 101
fi

if [ -z "$AUDIO_PATH" ]; then
    AUDIO_PATH="${SOURCE_PATH%.*}.wav"
fi
if [ -z "$TRANSCRIPT_PATH" ]; then
    TRANSCRIPT_PATH="${SOURCE_PATH%.*}.txt"
fi

if [ -f "${AUDIO_PATH}" ] || [ $FORCE_OVERWRITE -eq 1 ]; then
    echo_debug " El archivo de audio ya existe: ${AUDIO_PATH}, omitiendo conversión."
else    
    echo_debug " Transcribiendo el archivo de audio: $SOURCE_PATH"
    ffmpeg -y -i "${SOURCE_PATH}" -vn -acodec pcm_s16le -ar 16000 -ac 1 "${AUDIO_PATH}"
fi

if [ ! -f "${TRANSCRIPT_PATH}" ] || [ $FORCE_OVERWRITE -eq 1 ]; then
    echo_debug " Generando transcripción de audio: $AUDIO_PATH"
    echo_debug " Guardando transcripción en: $TRANSCRIPT_PATH"
    echo_debug " Usando el modelo Whisper: $WHISPER_MODEL"
    python $__DIRNAME/transcript-audio.py --audio-path="${AUDIO_PATH}" --transcription-file="${TRANSCRIPT_PATH}" --whisper-model="${WHISPER_MODEL}"
else
    echo_debug " El archivo de transcripción ya existe: ${TRANSCRIPT_PATH}, omitiendo transcripción."
fi
