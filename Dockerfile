FROM 589hero/u2net-onnx:latest

COPY . /app
WORKDIR /app
 
RUN pip install -r requirements.txt

FROM geerlingguy/php-apache:latest

RUN rm /var/www/html/index.html
COPY index.html /var/www/html/index.html

COPY ./ports.conf /etc/apache2/ports.conf
COPY ./apache.conf /etc/apache2/sites-enabled/000-default.conf

CMD ["python", "server.py"]
