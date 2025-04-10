venv_path = venv
python_bin = $(shell which python)

.PHONY: all
all: transcript-mp4

.PHONY: install
install: ${venv_path} ${venv_path}/lib/python3.13/site-packages/whisper ${venv_path}/lib/python3.13/site-packages/argparse.py ${venv_path}/lib/python3.13/site-packages/torch
# pip install torch argparse

${venv_path}/lib/python3.13/site-packages/whisper: ${venv_path}
	pip install git+https://github.com/openai/whisper.git

${venv_path}/lib/python3.13/site-packages/torch: ${venv_path}
	pip install torch

${venv_path}/lib/python3.13/site-packages/argparse.py: ${venv_path}
	pip install argparse

${venv_path}:
	$(python_bin) -m venv "${venv_path}"

.PHONY: transcript-mp4
transcript-mp4: install
	@if [ -z "$(MP4_FILE)" ]; then \
		echo "Error: MP4_FILE is not set"; \
		exit 1; \
	fi
	@if [ ! -f "$(MP4_FILE)" ]; then \
		echo "Error: MP4_FILE does not exist"; \
		exit 1; \
	fi
	@if [ -z "$(AUDIO_FILE)" ]; then \
		echo "Error: AUDIO_FILE is not set"; \
		exit 1; \
	fi
	@if ! echo "$(AUDIO_FILE)" | grep -qE '\.wav$$'; then \
		echo "Error: AUDIO_FILE must end with .wav"; \
		exit 1; \
	fi
	@if [ -z "$(TRANSCRIPT_FILE)" ]; then \
		echo "Error: TRANSCRIPT_FILE is not set"; \
		exit 1; \
	fi
	@if ! echo "$(TRANSCRIPT_FILE)" | grep -qE '\.txt$$'; then \
		echo "Error: TRANSCRIPT_FILE must end with .txt"; \
		exit 1; \
	fi
	ffmpeg -i "$(MP4_FILE)" -vn -acodec pcm_s16le -ar 16000 -ac 1 "$(AUDIO_FILE)"
	python transcript-audio.py --audio-path="$(AUDIO_FILE)" --transcription-file="$(TRANSCRIPT_FILE)"

.PHONY: transcript-wav
transcript-wav: install
	@if [ -z "$(AUDIO_FILE)" ]; then \
		echo "Error: AUDIO_FILE is not set"; \
		exit 1; \
	fi
	@if ! echo "$(AUDIO_FILE)" | grep -qE '\.wav$$'; then \
		echo "Error: AUDIO_FILE must end with .wav"; \
		exit 1; \
	fi
	@if [ -z "$(TRANSCRIPT_FILE)" ]; then \
		echo "Error: TRANSCRIPT_FILE is not set"; \
		exit 1; \
	fi
	@if ! echo "$(TRANSCRIPT_FILE)" | grep -qE '\.txt$$'; then \
		echo "Error: TRANSCRIPT_FILE must end with .txt"; \
		exit 1; \
	fi
	python transcript-audio.py --audio-path="$(AUDIO_FILE)" --transcription-file="$(TRANSCRIPT_FILE)"
