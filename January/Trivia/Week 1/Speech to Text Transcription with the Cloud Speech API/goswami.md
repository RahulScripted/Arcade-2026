# 🎤 Google Cloud Speech-to-Text API Demo

Transcribe audio files using Google Cloud Speech-to-Text API with automated shell script. 🚀

## 📋 Prerequisites

- ☁️ Google Cloud project with billing enabled
- 🔊 Speech-to-Text API enabled
- 🔑 API key for authentication
- 💻 `curl` and `bash` available

## ⚡ Quick Setup

### 1. 🔑 Create API Key

1. Visit [Google Cloud Console](https://console.cloud.google.com/) 🌐
2. Select your project 📁
3. Go to **APIs & Services > Credentials** ⚙️
4. Click **Create credentials > API key** ➕
5. Copy the generated key 📋
6. Optionally restrict to Speech-to-Text API 🔒

### 2. ⚙️ Configure Script

Edit the `speechToText.sh` file and replace `API_KEY` with your actual key: ✏️

```bash
export API_KEY="your_actual_api_key_here"
```

# 📥 Download the script

```bash
curl -LO https://raw.githubusercontent.com/your-username/Arcade-2026/main/January/Trivia/Week%201/Speech%20to%20Text%20Transcription%20with%20the%20Cloud%20Speech%20API/speechToText.sh

sudo chmod +x speechToText.sh

./speechToText.sh
```

## 🎯 What It Does

The script transcribes two sample audio files:
- 🇺🇸 **English**: Brooklyn Bridge audio (FLAC format)
- 🇫🇷 **French**: Corbeau Renard audio (FLAC format)

Results are saved to `result_en.json` and `result_fr.json`. 💾

## 📊 Expected Output

After running the script, you'll see:
```
Speech-to-Text requests completed.
Results saved to result_en.json and result_fr.json
```

## 👀 View Results

```bash
# View English transcription 🇺🇸
cat result_en.json | jq '.results[0].alternatives[0].transcript'

# View French transcription 🇫🇷
cat result_fr.json | jq '.results[0].alternatives[0].transcript'
```