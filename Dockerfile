# Builder stage
FROM rust:1.59.0 AS builder

RUN apt-get update && \
    TZ=Asia/Tokyo apt-get install -y tzdata && \
    apt-get install -y \
    build-essential \
    git \
    clang \
    lld \
    cmake \
    libstdc++-10-dev \
    libssl-dev \
    libxxhash-dev \
    zlib1g-dev \
    pkg-config \
    musl-tools

# install mold
ENV mold_version=v1.1
RUN git clone --branch "$mold_version" --depth 1 https://github.com/rui314/mold.git && \
    cd mold && \
    make -j$(nproc) CXX=clang++ && \
    make install && \
    mv /mold/mold /usr/bin/mold && \
    mv /mold/mold-wrapper.so /usr/bin/mold-wrapper.so && \
    make clean

WORKDIR /app
COPY . .
RUN rustup target add x86_64-unknown-linux-musl
ENV SQLX_OFFLINE true
RUN cargo build --release --target x86_64-unknown-linux-musl

# Runtime stage
FROM gcr.io/distroless/static

COPY --from=builder /app/target/x86_64-unknown-linux-musl/release/zero2prod zero2prod
COPY configuration configuration
ENV APP_ENVIRONMENT production
ENTRYPOINT ["./zero2prod"]