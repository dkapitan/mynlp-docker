# MyNLP Docker

Dockercontainer based on:
- Python 3.10.6
- [scispacy](https://github.com/allenai/scispacy) 0.5.1
- [prodigy](https://prodi.gy/). **Note:** Wheels are required in `/prodigy-1.11.8` in the root of this repository 

## Build container locally

```
docker build -t mynlp-p310:latest .
```

## Build container for AWS

TODO