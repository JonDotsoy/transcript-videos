import whisper
import argparse
import os

available_models = whisper.available_models()

parser = argparse.ArgumentParser(description="Transcribe audio using Whisper")
parser.add_argument("--audio-path", required=True, help="Path to the audio file (e.g., audio.wav)")
parser.add_argument("--transcription-file", required=True, help="Path to save the transcription with timestamps")
parser.add_argument(
    "--whisper-model",
    default="base",
    choices=available_models,
    help=f"Whisper model to use (default: base). Available models: {', '.join(available_models)}"
)
args = parser.parse_args()

# Validate if the audio file exists
if not os.path.exists(args.audio_path):
    raise FileNotFoundError(f"The audio file '{args.audio_path}' does not exist.")

# Validate if the destination folder for the transcription file exists
transcription_folder = os.path.dirname(args.transcription_file)
if not os.path.exists(transcription_folder):
    os.makedirs(transcription_folder)

model = whisper.load_model(args.whisper_model)
result = model.transcribe(args.audio_path)

with open(args.transcription_file, "w") as f:
    for segment in result["segments"]:
        start = segment["start"]
        end = segment["end"]
        text = segment["text"]
        start_minutes, start_seconds = divmod(int(start), 60)
        end_minutes, end_seconds = divmod(int(end), 60)
        f.write(f"[{start_minutes:02d}:{start_seconds:02d} - {end_minutes:02d}:{end_seconds:02d}]\t{text}\n")

print(f"Transcription saved to {args.transcription_file}")
