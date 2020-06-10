DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;

PRAGMA foreign_keys = ON;


CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body VARCHAR(255) NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);


CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);


CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  author_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  body TEXT NOT NULL,


  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (author_id) REFERENCES users(id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
);


CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Grizzly', 'Adams'),
  ('Jane', 'Doe');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('Hallmark Card', 'How do you write so many funny cards?', (SELECT id FROM users));

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  ((SELECT id FROM users), (SELECT id FROM questions));

INSERT INTO
  replies (question_id, author_id, parent_reply_id, body)
VALUES
  ((SELECT id FROM questions),(SELECT id FROM users), NULL,
   "body");

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  ((SELECT id FROM users), (SELECT id FROM questions));