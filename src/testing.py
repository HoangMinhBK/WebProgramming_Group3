from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
DATABASE_URL = "mysql+mysqlconnector://root@localhost:3306/business_service"
my_conn = create_engine(DATABASE_URL)

rs=my_conn.execute("SELECT * FROM  Biz_categories")
my_data= rs.fetchall() # a list
print(my_data)

SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=my_conn)
Base = declarative_base()

