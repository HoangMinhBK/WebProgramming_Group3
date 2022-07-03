from datetime import date, datetime
from sqlalchemy import DATETIME, Float, ForeignKey
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer, Text
from database import Base

class Authors(Base):
    __tablename__ = "authors"
    author_id = Column(Integer, primary_key=True, index=True)
    name = Column(String(20), unique=True)
    nationality = Column(Text())
    #dob column is a date type
    dob = Column(DATETIME)

class Comic(Base):
    __tablename__ = "comic"
    comic_id = Column(Integer, primary_key=True, index=True)
    name = Column(String(200))
    author_id = Column(Integer, ForeignKey("authors.author_id"))
    status = Column(String(100))
    first_uploaded = Column(DATETIME)
    last_uploaded = Column(DATETIME)
    current_chapter = Column(Integer)
    total_view = Column(Integer)
    rating = Column(Float)

class Tags(Base):
    __tablename__ = "tags"
    tag_id = Column(Integer, primary_key=True, index=True)
    name = Column(String(100), unique=True)
    description = Column(Text())