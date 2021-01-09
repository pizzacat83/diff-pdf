FROM alpine

RUN apk --no-cache add poppler-utils
RUN apk --no-cache add poppler-data
RUN apk --no-cache add imagemagick

WORKDIR /app
COPY scripts .
ENTRYPOINT ["./diff-pdf.sh"]
