#!/bin/sh

# This script is designed to test the transcript.sh script located in the transcript folder.
# It contains tests intended to validate the correct functioning of the transcript.sh code,
# ensuring that the results are as expected under different usage scenarios.

set -e

__FILENAME="$(realpath "$0")"
__DIRNAME="$(dirname "$__FILENAME")"

# -----------------------------------------------------------------------------
# Description:
#   Este archivo contiene pruebas automatizadas para el script transcript.sh,
#   ubicado en la carpeta transcript. Las pruebas verifican el comportamiento
#   esperado del script bajo diferentes escenarios, como la ausencia de
#   argumentos, rutas de origen inválidas y la correcta transcripción de un
#   video de muestra. El objetivo es asegurar la robustez y confiabilidad del
#   script transcript.sh mediante la ejecución de pruebas controladas.
# -----------------------------------------------------------------------------
function test_no_arguments() {
    set +e
    sh "$__DIRNAME/../transcript/transcript.sh"
    EXIT_CODE=$?
    set -e

    if [ $EXIT_CODE -eq 100 ]; then
        echo "✅ Test no_arguments: Passed"
    else
        echo "❌ Test no_arguments: Failed (expected exit code 100, got $EXIT_CODE)"
    fi
}

# -----------------------------------------------------------------------------
# Description:
#   Este archivo contiene pruebas automatizadas para el script transcript.sh,
#   ubicado en la carpeta transcript. Las pruebas verifican el comportamiento
#   esperado del script bajo diferentes escenarios, como la ausencia de
#   argumentos, rutas de origen inválidas y la correcta transcripción de un
#   video de muestra. El objetivo es asegurar la robustez y confiabilidad del
#   script transcript.sh mediante la ejecución de pruebas controladas.
# -----------------------------------------------------------------------------
function test_invalid_source() {
    set +e
    sh "$__DIRNAME/../transcript/transcript.sh" --source="invalid_path"
    EXIT_CODE=$?
    set -e
    if [ $EXIT_CODE -eq 101 ]; then
        echo "✅ Test invalid_source: Passed"
    else
        echo "❌ Test invalid_source: Failed (expected exit code 101, got $EXIT_CODE)"
    fi
}

# -----------------------------------------------------------------------------
# Description:
#   Esta función ejecuta pruebas para verificar la funcionalidad relacionada
#   con la transcripción de videos. Debe ser utilizada dentro del entorno de
#   pruebas automatizadas para asegurar que el proceso de transcripción
#   funciona correctamente.
# -----------------------------------------------------------------------------
function test_transcript_video() {
    local VIDEO_SAMPLE="$(realpath "$__DIRNAME/test_assets/sample_1/sample_video.webm")"
    local SOURCE_TXT="${VIDEO_SAMPLE%.webm}.txt"
    local SOURCE_WAV="${VIDEO_SAMPLE%.webm}.wav"

    [ -f "$SOURCE_TXT" ] && rm "$SOURCE_TXT"
    [ -f "$SOURCE_WAV" ] && rm "$SOURCE_WAV"

    set +e
    sh "$__DIRNAME/../transcript/transcript.sh" --source="$VIDEO_SAMPLE"
    EXIT_CODE=$?
    set -e

    if [ $EXIT_CODE -eq 0 ]; then
        echo "✅ Test transcript_video: Passed"
    else
        echo "❌ Test transcript_video: Failed (expected exit code 0, got $EXIT_CODE)"
    fi

    if [ -f "$SOURCE_TXT" ]; then
        echo "✅ Test transcript_video: Output file $SOURCE_TXT created successfully."
    else
        echo "❌ Test transcript_video: Output file $SOURCE_TXT not created."
    fi

    if [ -f "$SOURCE_WAV" ]; then
        echo "✅ Test transcript_video: Output file $SOURCE_WAV created successfully."
    else
        echo "❌ Test transcript_video: Output file $SOURCE_WAV not created."
    fi
}

test_no_arguments
test_invalid_source
test_transcript_video

