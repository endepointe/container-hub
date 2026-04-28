FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
  gcc g++ make libcap2-bin libpcap-dev \
  iproute2 tcpdump iputils-ping nmap \
  python3-full python3-pip python3-dev sqlite3 \
  vim curl git procps \
  && rm -rf /var/lib/apt/lists/*

RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

RUN pip install --no-cache-dir flask flask-sqlalchemy scapy

WORKDIR /workspace
EXPOSE 6161
CMD ["/bin/bash"]
