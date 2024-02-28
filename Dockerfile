FROM peaceiris/hugo:v0.123.6-full

# Installing just
RUN apt-get update && apt-get -y install lsb-release

# Adding makedeb bin repo
RUN wget -qO - 'https://proget.makedeb.org/debian-feeds/prebuilt-mpr.pub' | gpg --dearmor |  tee /usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg 1> /dev/null
RUN echo "deb [arch=all,$(dpkg --print-architecture) signed-by=/usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg] https://proget.makedeb.org prebuilt-mpr $(lsb_release -cs)" |  tee /etc/apt/sources.list.d/prebuilt-mpr.list

# Install
RUN apt-get update
RUN apt-get install -y just
