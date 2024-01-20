FROM python:3.10-slim-bookworm

ENV HOME=/home/user
RUN mkdir -p /home/user/ && chmod 777 /home/user
WORKDIR /home/user

RUN pip install jupyter
EXPOSE 8888

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]