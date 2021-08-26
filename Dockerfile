FROM domoticz/domoticz:latest

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install --no-install-recommends python3 python3-dev python3-pip libffi-dev libssl-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Cloning plugins
COPY ./zigbee2mqtt /opt/domoticz/userdata/plugins/zigbee2mqtt
COPY ./xiaomi-mirobot /opt/domoticz/userdata/plugins/xiaomi-mirobot

# Install Roborock
WORKDIR /opt/domoticz/plugins/xiaomi-mirobot
RUN pip install --upgrade pip && \
    pip3 install -U setuptools && \
    pip3 install -U virtualenv && \
    pip3 install wheel && \
    virtualenv -p python3 .env && \
    pip3 install msgpack-python
