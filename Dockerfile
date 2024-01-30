FROM peaceiris/hugo:v0.122.0-full

# Installing just
RUN wget -qO - 'https://proget.makedeb.org/debian-feeds/makedeb.pub' | gpg --dearmor | tee /usr/share/keyrings/makedeb-archive-keyring.gpg 1> /dev/null
RUN echo 'deb [signed-by=/usr/share/keyrings/makedeb-archive-keyring.gpg arch=all] https://proget.makedeb.org/ makedeb main' |  tee /etc/apt/sources.list.d/makedeb.list
RUN  apt-get update
RUN  apt-get install -y just