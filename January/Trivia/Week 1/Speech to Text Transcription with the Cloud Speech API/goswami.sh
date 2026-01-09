#!/bin/bash

# ================================
# Google Cloud Speech-to-Text Demo
# ================================

# Replace API_KEY with your actual key before running
export API_KEY=API_KEY


# ---------- Step 1: English audio transcription ----------
cat > request.json <<EOF
{
  "config": {
    "encoding": "FLAC",
    "languageCode": "en-US"
  },
  "audio": {
    "uri": "gs://cloud-samples-data/speech/brooklyn_bridge.flac"
  }
}
EOF

curl -s -X POST \
  -H "Content-Type: application/json" \
  --data-binary @request.json \
  "https://speech.googleapis.com/v1/speech:recognize?key=\${API_KEY}" \
  > result_en.json



# ---------- Step 2: French audio transcription ----------
rm -f request.json

cat > request.json <<EOF
{
  "config": {
    "encoding": "FLAC",
    "languageCode": "fr"
  },
  "audio": {
    "uri": "gs://cloud-samples-data/speech/corbeau_renard.flac"
  }
}
EOF

curl -s -X POST \
  -H "Content-Type: application/json" \
  --data-binary @request.json \
  "https://speech.googleapis.com/v1/speech:recognize?key=\${API_KEY}" \
  > result_fr.json

echo "Speech-to-Text requests completed."
echo "Results saved to result_en.json and result_fr.json"
