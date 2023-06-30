FROM python:3.11-alpine

# Install curl
RUN apk update

RUN apk add curl

# Install poetry
RUN curl -sSL https://install.python-poetry.org | python3 -
# Set env to dev
ENV FLASK_ENV=development

# Set port to dev port
ENV FLASK_RUN_PORT=8000

ENV FLASK_RUN_HOST=0.0.0.0

COPY . /opt/squadpilot

WORKDIR /opt/squadpilot

# Install project venv
RUN /root/.local/bin/poetry install

ENTRYPOINT [ "/root/.local/bin/poetry" ] 

CMD ["run", "flask",  "--app" , "squadpilot/squadpilot.py" , "--debug" , "run" ]