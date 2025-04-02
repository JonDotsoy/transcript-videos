import whisper
import argparse

parser = argparse.ArgumentParser(description="Transcribe audio using Whisper")
parser.add_argument("--audio-path", required=True, help="Path to the audio file (e.g., audio.wav)")
parser.add_argument("--transcription-file", required=True, help="Path to save the transcription with timestamps")
args = parser.parse_args()

model = whisper.load_model("base")
result = model.transcribe(args.audio_path)

with open(args.transcription_file, "w") as f:
    for segment in result["segments"]:
        start = segment["start"]
        end = segment["end"]
        text = segment["text"]
        f.write(f"[{start:.2f}s - {end:.2f}s] {text}\n")

print(f"Transcription saved to {args.transcription_file}")
