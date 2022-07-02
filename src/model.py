from datetime import date, datetime
from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer, Text
from database import Base

class Authors(Base):
    __tablename__ = "authors"
    author_id = Column(Integer, primary_key=True, index=True)
    name = Column(String(20), unique=True)
    nationality = Column(Text())
    #dob column is a date type
    dob = Column(Text())