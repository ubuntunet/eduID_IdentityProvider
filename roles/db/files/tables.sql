<<EOF
CREATE ROLE shibboleth WITH LOGIN;
CREATE DATABASE shibboleth WITH OWNER shibboleth ENCODING 'UTF8' TEMPLATE template0;
\c shibboleth
SET ROLE shibboleth;
CREATE TABLE shibpid (
    localEntity VARCHAR(1024) NOT NULL,
    peerEntity VARCHAR(1024) NOT NULL,
    principalName VARCHAR(255) NOT NULL,
    localId VARCHAR(255) NOT NULL,
    persistentId VARCHAR(36) NOT NULL,
    peerProvidedId VARCHAR(255) NULL,
    creationDate TIMESTAMP NOT NULL DEFAULT LOCALTIMESTAMP,
    deactivationDate TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (localEntity, peerEntity, persistentId)
);
CREATE INDEX shibpid_getbysourcevalue_index ON shibpid(localEntity, peerEntity, localId, deactivationDate);
CREATE TABLE storagerecords (
    context VARCHAR(255) NOT NULL,
    id VARCHAR(255) NOT NULL,
    expires BIGINT DEFAULT NULL,
    value TEXT NOT NULL,
    version BIGINT NOT NULL,
    PRIMARY KEY (context, id)
);
CREATE INDEX storagerecords_expires_index ON storagerecords(expires);
EOF