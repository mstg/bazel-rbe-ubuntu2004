FROM ubuntu:22.04

ADD get_arch /get_arch

RUN apt-get -y update && \
    apt-get -y install ca-certificates curl && \
    install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc && \
    chmod a+r /etc/apt/keyrings/docker.asc && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get -y update && \
    apt-get -y install git golang docker-ce-cli unzip zip python3 wget vim rpm && \
    apt-get -y install openjdk-17-jdk openjdk-17-jre openjdk-17-jdk-headless && \
    apt-get -y install clang-15 libc++-15-dev libc++abi-15-dev llvm-15 lld-15 libunwind-15-dev && \
    apt-get clean

RUN ln -s /usr/lib/jvm/java-17-openjdk-$(/get_arch) /usr/lib/jvm/java-17-openjdk

ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk

COPY --from=ghcr.io/tracemachina/nativelink:q352rkiy66n6azx5vy314y4dr5sb1pgy /nix/store/605ri6dw46iskqlzqn6qrllncr5aq0z4-nativelink-0.3.0/bin/nativelink /usr/bin/nativelink

