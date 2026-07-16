#!/bin/bash
cd /home/user/app/backend
uvicorn main:app --host 0.0.0.0 --port 8000 &

cd /home/user/app/client
streamlit run app.py --server.port ${PORT:-8501} --server.address 0.0.0.0