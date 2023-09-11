FROM python:3.9

RUN apt build-essential python3-dev -y

WORKDIR /app

RUN pip install --upgrade pip

RUN pip install uwsgi

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
