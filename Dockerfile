FROM bash:latest

ARG path=/app/bashscripts_github

WORKDIR $path

COPY . $path


