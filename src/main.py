from enum import Enum
from typing import Union

from fastapi import FastAPI, Depends, Request
from sqlalchemy.orm import Session

from fastapi import FastAPI
from pydantic import BaseModel

import schema
from database import SessionLocal, engine
import model
from model import Authors

model.Base.metadata.create_all(bind=engine)

def get_database_session():
    try:
        db = SessionLocal()
        yield db
    finally:
        db.close()

app = FastAPI()

@app.get("/authors")
async def read_movies(request: Request, db: Session = Depends(get_database_session)):
    records = db.query(Authors).all()
    return records

# The function parameters will be recognized as follows:

# If the parameter is also declared in the path, it will be used as a path parameter.
# If the parameter is of a singular type (like int, float, str, bool, etc) it will be interpreted as a query parameter.
# If the parameter is declared to be of the type of a Pydantic model, it will be interpreted as a request body.