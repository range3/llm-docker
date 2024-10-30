# range3/llm-docker

Docker image for the simonw/llm

# install
```console
curl -LO https://raw.githubusercontent.com/range3/llm-docker/refs/heads/master/bin/llm
chmod +x llm
./llm --help
```

Get Gemini API key (free now)  
https://ai.google.dev/

```console
./llm keys set gemini
<ENTER YOUR API KEY>

./llm models default gemini-1.5-pro-latest
```

# Usage
```console
./llm hello!
Hello! How can I help you today?

echo "10+20" | llm calculate?
10 + 20 = 30
```

# Update container image explicitly
```console
docker pull ghcr.io/range3/llm:latest
```
