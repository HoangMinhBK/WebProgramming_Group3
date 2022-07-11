from sre_constants import SUCCESS
from fastapi import FastAPI, Depends, HTTPException
from sqlalchemy import Integer
from sqlalchemy.orm import Session
from database import SessionLocal, engine
import models
import jwt
from typing import Union, Any
from datetime import datetime, timedelta
from models import Account, Author, Comic, Tag
from pydantic import BaseModel
from security import validate_token

SECURITY_ALGORITHM = 'HS256'
SECRET_KEY = '123456'

models.Base.metadata.create_all(bind=engine)


def get_database_session():
    try:
        db = SessionLocal()
        yield db
    finally:
        db.close()


app = FastAPI()


def generate_token(username: Union[str, Any]) -> str:
    expire = datetime.utcnow() + timedelta(
        seconds=60 * 60 * 24 * 3  # Expired after 3 days
    )
    to_encode = {
        "exp": expire, "username": username
    }
    encoded_jwt = jwt.encode(to_encode, SECRET_KEY,
                             algorithm=SECURITY_ALGORITHM)
    return encoded_jwt


class LoginRequest(BaseModel):
    username: str
    password: str


@app.post('/login')
def login(request_data: LoginRequest, db: Session = Depends(get_database_session)):
    record = db.query(Account).filter(
        Account.username == request_data.username).first()
    if record is None:
        raise HTTPException(status_code=404, detail="Acount not found")
    if (record.password == request_data.password):
        token = generate_token(request_data.username)
        return {
            'token': token
        }
    else:
        raise HTTPException(status_code=404, detail="User not found")


@app.get("/authors", dependencies=[Depends(validate_token)])
async def read_authors(db: Session = Depends(get_database_session)):
    records = db.query(Author).all()
    return records


@app.get("/comic")
async def read_comic(db: Session = Depends(get_database_session)):
    records = db.query(Comic).all()
    return records


@app.get("/tags")
async def read_tags(db: Session = Depends(get_database_session)):
    records = db.query(Tag).all()
    return records


@app.get("/authors/{author_id}")
def read_single_author(author_id: int, db: Session = Depends(get_database_session)):
    record = db.query(Author).filter(Author.author_id == author_id).first()
    if record is None:
        raise HTTPException(status_code=404, detail="User not found")
    return record


# The function parameters will be recognized as follows:

# If the parameter is also declared in the path, it will be used as a path parameter.
# If the parameter is of a singular type (like int, float, str, bool, etc) it will be interpreted as a query parameter.
# If the parameter is declared to be of the type of a Pydantic model, it will be interpreted as a request body.
