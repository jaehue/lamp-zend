FROM tutum/lamp

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install php5 php5-cli php5-gd php-pear php5-curl curl lynx lynx-cur vim htop wget

# Instal composer
RUN curl -sS "https://getcomposer.org/installer" | php -- --install-dir=/usr/local/bin --filename=composer 

# Configure timezone and locale
RUN echo "Asia/Seoul" > /etc/timezone; dpkg-reconfigure -f noninteractive tzdata 
RUN export LANGUAGE=en_US.UTF-8; export LANG=en_US.UTF-8; export LC_ALL=en_US.UTF-8; locale-gen en_US.UTF-8; DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales 

# Instal Zend Framework 
RUN wget https://packages.zendframework.com/releases/ZendFramework-1.12.7/ZendFramework-1.12.7.tar.gz 
RUN mkdir /home/ZendFramework1 
RUN tar -xzf ZendFramework-1.12.7.tar.gz -C /home/ 
RUN rm -f ZendFramework-1.12.7.tar.gz 
RUN pear install Image_Text-beta

# php.ini settings
RUN sed -ie 's/\;date\.timezone\ \=/date\.timezone\ \=\ Asia\/Seoul/g' /etc/php5/apache2/php.ini 
RUN sed -i "s/;include_path = \"\.:.*/include_path = \".:\/usr\/share\/php:\/home\/ZendFramework-1.12.7\/library\"/" /etc/php5/apache2/php.ini 
RUN sed -i "s/error_reporting = .*$/error_reporting = E_ALL \& ~E_NOTICE \& ~E_STRICT \& ~E_DEPRECATED/" /etc/php5/apache2/php.ini 

RUN echo "alias zf=/home/ZendFramework-1.12.7/bin/zf.sh" >> /root/.bashrc

VOLUME "/home/app"
WORKDIR "/home/app"