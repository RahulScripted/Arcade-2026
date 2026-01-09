# 🌐 Google Cloud Translation API Demo

Translate text using Google Cloud Translation API with automated shell script. 🚀

## 📋 Prerequisites

- ☁️ Google Cloud project with billing enabled
- 🔤 Cloud Translation API enabled
- 🔑 API key for authentication
- 💻 `curl` and `bash` available

## ⚡ Quick Setup

### 1. 🔑 Create API Key

1. Visit [Google Cloud Console](https://console.cloud.google.com/) 🌐
2. Select your project 📁
3. Go to **APIs & Services > Credentials** ⚙️
4. Click **Create credentials > API key** ➕
5. Copy the generated key 📋
6. Optionally restrict to Translation API 🔒

# 📥 Download the script

```bash
curl -LO https://raw.githubusercontent.com/your-username/Arcade-2026/main/January/Trivia/Week%201/Translate%20Text%20with%20the%20Cloud%20Translation%20API/translateText.sh

sudo chmod +x translateText.sh

./translateText.sh
```

## 🎯 What It Does

The script automatically:
- 🔧 Enables the Translation API service
- 🔑 Creates an API key named "awesome"
- 🌍 Translates text between different languages
- 📊 Displays results with colored output

## 📊 Expected Output

After running the script, you'll see colored output showing:
```
Starting Lab Execution...
Enabling apikeys.googleapis.com service...
Creating API key with display name 'awesome'...
API Key Name: [key-name]
API Key Value: [api-key-string]
```