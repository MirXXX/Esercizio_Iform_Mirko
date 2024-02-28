CREATE TABLE esercizio_iform.utenti (
    user_id INTEGER NOT NULL AUTO_INCREMENT,
    username VARCHAR(60) NOT NULL,
    passw VARCHAR(60) NOT NULL,
    email VARCHAR(60) DEFAULT FALSE NOT NULL,
    active_ TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    is_admin BOOLEAN DEFAULT 0,
    id_citta INTEGER,
    PRIMARY KEY (user_id)
);

CREATE TABLE esercizio_iform.citta (
    id_citta INTEGER NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100),
    id_regione INTEGER,
    primary key(id_citta)
);
    
CREATE TABLE esercizio_iform.regioni (
    id_regione INTEGER NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100),
    PRIMARY KEY (id_regione)
);

alter table utenti add constraint forkey_utenti_idcitta foreign key(id_citta) references citta(id_citta);
alter table citta add constraint forkey_utenti_idregione foreign key(id_regione) references regioni(id_regione);