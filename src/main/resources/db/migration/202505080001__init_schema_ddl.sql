CREATE TABLE IF NOT EXISTS bookmarks
(
    id         BIGINT                 NOT NULL,
    title      VARCHAR(200)           NOT NULL,
    url        VARCHAR(500)           NOT NULL,
    created_at datetime DEFAULT NOW() NOT NULL,
    updated_at datetime NULL,
    CONSTRAINT pk_bookmarks PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS cash_card
(
    id    BIGINT AUTO_INCREMENT NOT NULL,
    amount DOUBLE NULL,
    owner VARCHAR(255) NULL,
    CONSTRAINT pk_cashcard PRIMARY KEY (id)
);