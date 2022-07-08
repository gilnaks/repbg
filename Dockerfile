FROM 589hero/u2net-onnx:latest

COPY . /app
WORKDIR /app
 
RUN pip install -r requirements.txt

FROM geerlingguy/php-apache:latest


COPY ./ports.conf /etc/apache2/ports.conf
COPY ./apache.conf /etc/apache2/sites-enabled/000-default.conf

CMD ["python", "server.py"]
