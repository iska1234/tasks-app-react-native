CREATE DATABASE tareas_react;

USE tareas_react;

CREATE TABLE users(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    name VARCHAR(255),
    password VARCHAR(255)
);

CREATE TABLE todos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    completed BOOLEAN DEFAULT false,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE shared_todos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    todo_id INT,
    user_id INT,
    FOREIGN KEY (todo_id) REFERENCES todos(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO users (name, email, password) VALUES ('Isaac','i1@gmail.com','123');
INSERT INTO users (name, email, password) VALUES ('Sadhu','s1@gmail.com','456');


INSERT INTO todos(title,user_id)
VALUES
("🏃‍♂️ Go for morning run",1),
("☕ Prepare my breakfast",1),
("⌨ Work on my projects presentation",1),
("🎮 Play some videogames",1),
("👨‍🍳 Prepare my dinner",1),
("📱 Watch some anime or youtube videos",1),
("🍱 Eat my dinner",1),
("👨‍💻 I attend my code classes",1),
("⌨ Work on projects",1);


INSERT INTO shared_todos(todo_id, user_id, shared_with_id)
VALUES (1,1,2);

SELECT todos.*, shared_todos.shared_with_id
FROM todos
LEFT JOIN shared_todos ON todos.id = shared_todos.todo_id
WHERE todos.user_id = [user_id] OR shared_todos.shared_with_id = [user_id] 