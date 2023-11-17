FROM postgres:15.3-alpine

ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres

WORKDIR /scripts

COPY ScriptSQL.sql /docker-entrypoint-initdb.d/
COPY ScriptInsert.sql /docker-entrypoint-initdb.d/

ENTRYPOINT ["docker-entrypoint.sh"]
CMD [ "postgres" ]
