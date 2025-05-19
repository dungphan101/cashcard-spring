CREATE TABLE IF NOT EXISTS categories
(
    id   BIGINT       NOT NULL,
    name VARCHAR(255) NULL,
    CONSTRAINT pk_categories PRIMARY KEY (id)
);

# ALTER TABLE bookmarks
#     ADD category_id BIGINT NULL;
#
# ALTER TABLE bookmarks
#     ADD status VARCHAR(255) NULL;
#
# ALTER TABLE bookmarks
#     ADD CONSTRAINT FK_BOOKMARKS_ON_CATEGORY FOREIGN KEY (category_id) REFERENCES categories (id);