-- Insert sample data into bookmarks table
INSERT INTO bookmarks (id, title, url, created_at)
VALUES
    (1, 'Spring Boot Documentation', 'https://docs.spring.io/spring-boot/docs/current/reference/html/', NOW()),
    (2, 'MySQL Documentation', 'https://dev.mysql.com/doc/', NOW()),
    (3, 'Flyway Migration', 'https://flywaydb.org/documentation/', NOW()),
    (4, 'GitHub', 'https://github.com/', NOW()),
    (5, 'Stack Overflow', 'https://stackoverflow.com/', NOW());

-- Insert sample data into cash_card table
INSERT INTO cash_card (amount, owner)
VALUES
    (123.45, 'sarah1'),
    (1.00, 'sarah1'),
    (150.00, 'kumar2'),
    (200.00, 'kumar2'),
    (300.00, 'john_doe'),
    (500.00, 'jane_smith'),
    (1000.00, 'admin_user');