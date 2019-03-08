FROM python:3
MAINTAINER Johannes le Roux <johannes.leroux@vodacom.co.za>

ENV PYTHONUNBUFFERED=0

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY webchat .

EXPOSE 8080

CMD ["python", "webchat.py"]
