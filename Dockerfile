FROM python:3.9

RUN apt update -y && apt install build-essential python3-dev -y

WORKDIR /app

RUN pip install --upgrade pip

RUN pip install uwsgi

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

RUN mkdir -p /var/log/uwsgi

RUN chown -R www-data:www-data /app /var/log/uwsgi

USER www-data

CMD ["uwsgi", "--ini", "uwsgi.ini"]
