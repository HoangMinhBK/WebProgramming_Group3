from fastapi import FastAPI, Depends
from sqlalchemy.orm import Session

from fastapi import FastAPI

from database import SessionLocal, engine
import models
from models import Authors, Comic, Tags

models.Base.metadata.create_all(bind=engine)

def get_database_session():
    try:
        db = SessionLocal()
        yield db
    finally:
        db.close()

app = FastAPI()

@app.get("/authors")
async def read_authors( db: Session = Depends(get_database_session)):
    records = db.query(Authors).all()
    return records

@app.get("/comic")
async def read_comic( db: Session = Depends(get_database_session)):
    records = db.query(Comic).all()
    return records

@app.get("/tags")
async def read_tags( db: Session = Depends(get_database_session)):
    records = db.query(Tags).all()
    return records

# The function parameters will be recognized as follows:

# If the parameter is also declared in the path, it will be used as a path parameter.
# If the parameter is of a singular type (like int, float, str, bool, etc) it will be interpreted as a query parameter.
# If the parameter is declared to be of the type of a Pydantic model, it will be interpreted as a request body.