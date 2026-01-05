FROM python:3.11-slim

COPY dist/scie-pants-linux-x86_64 /usr/local/bin/pants
ENV SCIE_BASE=/usr/local/pants/

RUN mkdir -p $SCIE_BASE && cd $SCIE_BASE && touch pants.toml && \
    PANTS_VERSION=2.30.0 pants --version

CMD ["sh", "-c", "PANTS_VERSION=2.30.0 pants --version"]

# Run to test:
# cargo run -p package -- scie && docker build -f fix.Dockerfile -t pants-test . && docker run --network=none pants-test
