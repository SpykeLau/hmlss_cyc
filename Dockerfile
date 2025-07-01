# syntax=docker/dockerfile:1

############################
# 1️⃣  先建「依賴」階段
############################
FROM python:3.12-slim AS builder
WORKDIR /install

# 保留原本的子目錄結構
COPY crawler/requirements.txt     crawler/
COPY summarizer/requirements.txt  summarizer/
COPY push_service/requirements.txt push_service/

# 一次安裝三份需求
RUN pip install --prefix=/usr/local --no-cache-dir \
      -r crawler/requirements.txt \
      -r summarizer/requirements.txt \
      -r push_service/requirements.txt

############################
# 2️⃣  建最終執行映像
############################
FROM python:3.12-slim
WORKDIR /app

# 複製已安裝好的 Python 套件
COPY --from=builder /usr/local /usr/local

# 把整個程式碼複進來
COPY . /app

CMD ["python", "push_service/push.py"]
