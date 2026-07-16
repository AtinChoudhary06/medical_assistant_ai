FROM python:3.11-slim

RUN useradd -m -u 1000 user
WORKDIR /home/user/app

COPY --chown=user backend/ ./backend/
COPY --chown=user client/ ./client/
COPY --chown=user start.sh ./start.sh

RUN pip install --no-cache-dir -r backend/requirements.txt
RUN pip install --no-cache-dir -r client/requirements.txt

RUN chmod +x start.sh
USER user

EXPOSE 7860
CMD ["./start.sh"]