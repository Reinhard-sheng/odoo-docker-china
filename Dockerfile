FROM elicocorp/odoo:8.0
MAINTAINER Elico-Corp <contact@elico-corp.com>

# Ubuntu CN mirror
RUN sed -i 's/archive\.ubuntu\.com/mirrors.sohu.com/g' /etc/apt/sources.list

# pip CN mirror
RUN mkdir -p ~/pip && \
  echo "[global]" > ~/pip/pip.conf && \
  echo "index-url = https://pypi.mirrors.ustc.edu.cn/simple" >> ~/pip/pip.conf

# CN fonts
RUN apt-get update && \
  apt-get -y install ttf-wqy-zenhei

# Google links CN mirror
# Also replace "http://" with "//" to fix mixed-content issue on HTTPS pages
RUN sed -i "s/http:\/\/fonts\.googleapis\.com/\/\/fonts.lug.ustc.edu.cn/g" `grep 'fonts\.googleapis\.com' -rl /opt/odoo/sources/odoo/addons`
RUN sed -i "s/http:\/\/ajax\.googleapis\.com/\/\/ajax.lug.ustc.edu.cn/g" `grep 'ajax\.googleapis\.com' -rl /opt/odoo/sources/odoo/addons`
