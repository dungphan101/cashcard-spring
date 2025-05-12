ALTER TABLE bookmarks
    DROP FOREIGN KEY FK_BOOKMARKS_ON_CATEGORY;

ALTER TABLE bookmarks
    ADD CONSTRAINT fk_bookmarks_on_category FOREIGN KEY (category_id) REFERENCES categories (id);