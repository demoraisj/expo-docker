FROM reactnativecommunity/react-native-android:latest

WORKDIR /app

# Configs
RUN git config --global --add safe.directory /app

# NPM packages
RUN npm install --unsafe-perm -g @expo/ngrok expo-cli eas-cli sharp-cli

# System Packages
RUN apt update
RUN apt install -y usbutils

# @TODO - Need to add expo credentials variables before this
# Gradle depencies cache
# COPY . .
# RUN npm install
# RUN npm run build:android-dev

# Cleanup
RUN rm -rf *
RUN apt remove wget
RUN apt autoremove && apt clean && rm -rf /var/lib/apt/lists/*

CMD /bin/bash -c "echo 'The container was successfully started, you can now exec any commands into it.' && yarn install && tail -f /dev/null"
