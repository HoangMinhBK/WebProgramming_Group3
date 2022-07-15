from sre_constants import SUCCESS
from fastapi import FastAPI, Depends, HTTPException
from sqlalchemy import Integer
from sqlalchemy.orm import Session
from database import SessionLocal, engine
import models
import jwt
from account.forms import AccoutCreateForm
from typing import Union, Any
from datetime import timedelta, date, datetime
from models import Account, Author, Comic, Tag, Chapter, Link
from pydantic import BaseModel
from security import validate_token
from sqlalchemy import  and_, or_
from fastapi.middleware.cors import CORSMiddleware

origins = [
   "http://localhost:3000",
   "http://localhost:3000/login",
    "http://localhost:8000",
    "http://localhost:8000/login",
    "http://localhost:8000/register",
]

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
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["GET", "POST", "PUT", "DELETE"],
    allow_headers=["*"],
)


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
    records = db.query(Comic.first_uploaded, Comic.name, Comic.author_id,
                       Author.name.label("author_name"),
#                       Tag.name.label("tag_name"),
                       Comic.current_chapter, Comic.rating, Comic.comic_id, Comic.status,
                       Comic.last_uploaded, Comic.total_view,
                       Comic.des, Comic.thumbnail).limit(10).all()
    if records is None:
        raise HTTPException(status_code=404, detail="No comic to display")
    return records

@app.get("/comic/{comic_id}")
async def read_single_comic(comic_id: int, db: Session = Depends(get_database_session)):
    records = db.query(Comic.first_uploaded, Comic.name, Comic.author_id,
                       Author.name.label("author_name"),
                       Tag.name.label("tag_name"),
                       Comic.current_chapter, Comic.rating, Comic.comic_id, Comic.status,
                       Comic.last_uploaded, Comic.total_view, Comic.thumbnail,
                       Comic.des).filter(Comic.comic_id == comic_id).limit(1).all()
    if records is None:
        raise HTTPException(status_code=404, detail="comic not found")
    return records

@app.get("/comics/{comic_id}/chapters/{chap_num}")
async def read_link(comic_id: int, chap_num: int, db: Session = Depends(get_database_session)):
    records = db.query(Chapter.chapter_id).filter(Chapter.comic_id == comic_id, Chapter.chap_num == chap_num)
    records = db.query(Link.link).filter(Link.linkid.in_(records)).all()
    if records is None:
        raise HTTPException(status_code=404, detail="link not found")
    return records

@app.get("/tags")
async def read_tags(db: Session = Depends(get_database_session)):
    records = db.query(Tag.name).all()
    return records

@app.get("/authors/{author_id}")
def read_single_author(author_id: int, db: Session = Depends(get_database_session)):
    record = db.query(Author).filter(Author.author_id == author_id).first()
    if record is None:
        raise HTTPException(status_code=404, detail="User not found")
    return record

@app.post("/register")
def register(form : AccoutCreateForm, db: Session = Depends(get_database_session)):
    if not form.display_name:
        raise HTTPException(status_code=400, detail="Name is required")
    if not form.username or not len(form.username) > 3:
        raise HTTPException(status_code=400, detail="Username should be > 3 characters") 
    if not form.email or not (form.email.__contains__("@")):
        raise HTTPException(status_code=400, detail="Email is required")
    if not form.password or not len(form.password) >= 6:
        raise HTTPException(status_code=400, detail="Password must be > 6 characters")
    row = db.query(Account).count()
    account = Account(
        account_id = row + 1, 
        display_name = form.display_name, 
        username = form.username, 
        password = form.password, 
        email = form.email, 
        created_time = date.today(), 
        account_type = "normal"
    )
    record = db.query(Account).filter(Account.username == account.username).first()
    if record is not None:
        raise HTTPException(status_code=400, detail="Duplicate username")
    record = db.query(Account).filter(Account.email== account.email).first()
    if record is not None:
        raise HTTPException(status_code=400, detail="Duplicate email")
    db.add(account)
    db.commit()
    db.refresh(account)
    return account
# The function parameters will be recognized as follows:

# If the parameter is also declared in the path, it will be used as a path parameter.
# If the parameter is of a singular type (like int, float, str, bool, etc) it will be interpreted as a query parameter.
# If the parameter is declared to be of the type of a Pydantic model, it will be interpreted as a request body.
