CREATE KEYSPACE twizandra WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

USE twizandra;

CREATE TABLE users (
  username text PRIMARY KEY,
  name text,
  password text
);

CREATE TABLE followers (
  username text PRIMARY KEY,
  users set<text>
);

CREATE TABLE friends (
  username text PRIMARY KEY,
  users set<text>
);

CREATE TABLE tweets (
  tweet_id timeuuid,
  username text,
  body text,
  PRIMARY KEY (tweet_id, username)
);

CREATE TABLE timeline (
  username text,
  when timestamp,
  tweet_id uuid,
  PRIMARY KEY (username, when)
);

CREATE TABLE userline (
  username text,
  when timestamp,
  tweet_id uuid,
  PRIMARY KEY (username, when)
);