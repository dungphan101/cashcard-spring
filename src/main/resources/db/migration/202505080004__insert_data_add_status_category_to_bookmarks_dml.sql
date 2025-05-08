-- Insert categories
INSERT INTO categories (id, name)
VALUES
    (1, 'Programming'),
    (2, 'Documentation'),
    (3, 'Tools'),
    (4, 'Learning'),
    (5, 'Reference');

-- Insert some additional bookmarks with the new schema
INSERT INTO bookmarks (id, title, url, created_at, category_id, status)
VALUES
    (6, 'Java Tutorial', 'https://docs.oracle.com/javase/tutorial/', NOW(), 1, 'ACTIVE'),
    (7, 'Spring Framework', 'https://spring.io/projects/spring-framework', NOW(), 1, 'ACTIVE'),
    (8, 'Bytebase Documentation', 'https://bytebase.com/docs/', NOW(), 2, 'ACTIVE');