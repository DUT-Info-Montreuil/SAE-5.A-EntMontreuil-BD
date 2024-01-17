FROM postgres:15.3-alpine

ENV POSTGRES_DB: postgres
ENV POSTGRES_USER=sae
ENV POSTGRES_PASSWORD=1234

WORKDIR /scripts
EXPOSE 5432
COPY ScriptASQL.sql /docker-entrypoint-initdb.d/
COPY ScriptInsert.sql /docker-entrypoint-initdb.d/

ENTRYPOINT ["docker-entrypoint.sh"]
CMD [ "postgres" ]
