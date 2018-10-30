FROM alpine:3.5
RUN apk add --update python3 py-pip
COPY requirements.txt /src/requirements.txt
RUN pip3 install -r /src/requirements.txt
COPY app.py /src
COPY buzz /src/buzz
CMD python3 /src/app.py
