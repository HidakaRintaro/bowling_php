-- データベース作成
CREATE DATABASE bowling 
CHARACTER SET utf8mb4;

------------------------
-- テーブル作成
------------------------

-- 会員
CREATE TABLE user (
  id integer(11) NOT NULL AUTO_INCREMENT, 
  name varchar(30) NOT NULL, 
  created_date datetime NOT NULL DEFAULT current_timestamp, 
  updated_date datetime NOT NULL DEFAULT current_timestamp ON UPDATE current_timestamp, 
  deleted_date date DEFAULT NULL, 
  PRIMARY KEY(id)
);

-- ゲーム
CREATE TABLE game (
  id integer(11) NOT NULL AUTO_INCREMENT, 
  venue varchar(30) COMMENT "会場", 
  game_date date NOT NULL COMMENT "ゲーム日", 
  created_date datetime NOT NULL DEFAULT current_timestamp, 
  updated_date datetime NOT NULL DEFAULT current_timestamp ON UPDATE current_timestamp, 
  PRIMARY KEY(id)
);

-- スコア
CREATE TABLE score (
  user_id integer(11) NOT NULL, 
  game_id integer(11) NOT NULL, 
  game_num integer(3) NOT NULL DEFAULT 1 COMMENT "ゲーム数", 
  f01_1 integer(2) NOT NULL COMMENT "1フレーム目の1投目", 
  f01_2 integer(2) NOT NULL COMMENT "1フレーム目の2投目", 
  f02_1 integer(2) NOT NULL COMMENT "2フレーム目の1投目", 
  f02_2 integer(2) NOT NULL COMMENT "2フレーム目の2投目", 
  f03_1 integer(2) NOT NULL COMMENT "3フレーム目の1投目", 
  f03_2 integer(2) NOT NULL COMMENT "3フレーム目の2投目", 
  f04_1 integer(2) NOT NULL COMMENT "4フレーム目の1投目", 
  f04_2 integer(2) NOT NULL COMMENT "4フレーム目の2投目", 
  f05_1 integer(2) NOT NULL COMMENT "5フレーム目の1投目", 
  f05_2 integer(2) NOT NULL COMMENT "5フレーム目の2投目", 
  f06_1 integer(2) NOT NULL COMMENT "6フレーム目の1投目", 
  f06_2 integer(2) NOT NULL COMMENT "6フレーム目の2投目", 
  f07_1 integer(2) NOT NULL COMMENT "7フレーム目の1投目", 
  f07_2 integer(2) NOT NULL COMMENT "7フレーム目の2投目", 
  f08_1 integer(2) NOT NULL COMMENT "8フレーム目の1投目", 
  f08_2 integer(2) NOT NULL COMMENT "8フレーム目の2投目", 
  f09_1 integer(2) NOT NULL COMMENT "9フレーム目の1投目", 
  f09_2 integer(2) NOT NULL COMMENT "9フレーム目の2投目", 
  f10_1 integer(2) NOT NULL COMMENT "10フレーム目の1投目", 
  f10_2 integer(2) NOT NULL COMMENT "10フレーム目の2投目", 
  f10_3 integer(2) NOT NULL COMMENT "10フレーム目の3投目", 
  created_date datetime NOT NULL DEFAULT current_timestamp, 
  updated_date datetime NOT NULL DEFAULT current_timestamp ON UPDATE current_timestamp, 
  PRIMARY KEY(user_id, game_id), 
  FOREIGN KEY(user_id) REFERENCES user(id), 
  FOREIGN KEY(game_id) REFERENCES game(id)
);