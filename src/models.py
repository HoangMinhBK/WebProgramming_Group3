from certifi import where
from sqlalchemy import DATETIME, Float, ForeignKey
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer, Text
from sqlalchemy.orm import relationship
from database import Base
from database import SessionLocal, engine

class Account(Base):
    __tablename__ = "accounts"
    account_id = Column(Integer, primary_key=True, index=True)
    display_name = Column(String(50))
    username = Column(String(50), unique=True)
    password = Column(String(50))
    email = Column(String(50), unique=True)
    created_time = Column(DATETIME)
    account_type = Column(String(20))

class Comic(Base):
    __tablename__ = "comic"
    comic_id = Column(Integer, primary_key=True, index=True)
    name = Column(String(200))
    author_id = Column(Integer, ForeignKey("authors.author_id"))
    #author_name induced from author_id)
    status = Column(String(100))
    first_uploaded = Column(DATETIME)
    last_uploaded = Column(DATETIME)
    current_chapter = Column(Integer)
    total_view = Column(Integer)
    rating = Column(Float)
    des = Column(String(50))

class Author(Base):
    __tablename__ = "authors"
    author_id = Column(Integer, primary_key=True, index=True)
    name = Column(String(20), unique=True)
    nationality = Column(Text())
    #dob column is a date type
    dob = Column(DATETIME)
    comic = relationship(Comic)

class Chapter(Base):
    __tablename__ = "chapter"
    chapter_id = Column(Integer, primary_key=True, index=True)
    comic_id = Column(Integer, ForeignKey("comic.comic_id"))
    chap_num = Column(Integer)
    num_pages = Column(Integer)
    update_date = Column(DATETIME)
    views = Column(Integer)
    likes = Column(Integer)
    comments = Column(Integer)
    link = Column(Integer)

class Link(Base):
    __tablename__ = "chapter_link"
    linkid = Column(Integer, ForeignKey("chapter.link"))
    link = Column(String(50), primary_key=True, index=True)

# class Comment(Base):
#     __tablename__ = "comments"
#     comment_id = Column(Integer, primary_key=True, index=True)
#     chapter_id = Column(Integer, ForeignKey("chapter.chapter_id"))
#     account_id = Column(Integer, ForeignKey("accounts.account_id"))
#     date = Column(DATETIME)
#     content = Column(Text())

# class Follow(Base):
#     __tablename__ = "follows"
#     follow_id = Column(Integer, primary_key=True, index=True)
#     author_id = Column(Integer, ForeignKey("authors.author_id"))
#     account_id = Column(Integer, ForeignKey("accounts.account_id"))
#     last_read_day = Column(DATETIME)

# class Like(Base):
#     __tablename__ = "likes"
#     like_id = Column(Integer, primary_key=True, index=True)
#     chapter_id = Column(Integer, ForeignKey("chapter.chapter_id"))
#     account_id = Column(Integer, ForeignKey("accounts.account_id"))
#     date = Column(DATETIME)

class Subscribe(Base):
    __tablename__ = "subscribe"
    subscribe_id = Column(Integer, primary_key=True, index=True)
    account_id = Column(Integer, ForeignKey("accounts.account_id"))
    comic_id = Column(Integer, ForeignKey("comic.comic_id"))

class Tagging(Base):
    __tablename__ = "tagging"
    tagging_id = Column(Integer, primary_key=True, index=True)
    tag_id = Column(Integer, ForeignKey("tags.tag_id"))
    comic_id = Column(Integer, ForeignKey("comic.comic_id"))

class Tag(Base):
    __tablename__ = "tags"
    tag_id = Column(Integer, primary_key=True, index=True)
    name = Column(String(100), unique=True)
    description = Column(Text())

