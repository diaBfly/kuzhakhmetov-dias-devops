FROM python:3.12-alpine

WORKDIR /app

COPY . .

RUN chmod +x scripts/Kuzhakhmetov_Dias_system.sh

EXPOSE 8000

CMD ["python", "app/app.py"]

