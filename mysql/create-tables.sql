CREATE TABLE IF NOT EXISTS artist (
  artist_id   INT          NOT NULL,
  artist_name VARCHAR(64)  NOT NULL,
  PRIMARY KEY (artist_id),
  INDEX index_artist (artist_id)
);

CREATE TABLE IF NOT EXISTS album (
  artist_id  INT          REFERENCES artist(artist_id),
  album_id   INT          NOT NULL,
  album_name VARCHAR(64)  NOT NULL,
  PRIMARY KEY (artist_id, album_id),
  FOREIGN KEY (artist_id) REFERENCES artist(artist_id),
  INDEX index_album(artist_id, album_id, album_name)
);

CREATE TABLE IF NOT EXISTS track (
  artist_id  INT          REFERENCES artist(artist_id),
  album_id   INT          REFERENCES album(album_id),
  track_id   INT          NOT NULL,
  track_name VARCHAR(64)  NOT NULL,
  time       DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (artist_id, album_id, track_id),
  FOREIGN KEY (artist_id, album_id) REFERENCES album(artist_id, album_id),
  INDEX index_track(artist_id, album_id, track_id, track_name)
);

CREATE TABLE IF NOT EXISTS played (
  artist_id    INT    NOT NULL,
  album_id     INT    NOT NULL,
  track_id     INT    NOT NULL,
  played    TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (artist_id, album_id, track_id, played),
  FOREIGN KEY (artist_id, album_id, track_id) REFERENCES track(artist_id, album_id, track_id),
  INDEX index_played(artist_id, album_id, track_id, played)
);

CREATE TABLE IF NOT EXISTS compiles (
  artist_name varchar(64) REFERENCES artist(artist_name),
  album_name  varchar(64) REFERENCES album(album_name)
);

CREATE TABLE IF NOT EXISTS contains (
  album_name varchar(64) REFERENCES album(album_name),
  track_name varchar(64) REFERENCES track(track_name)
);
