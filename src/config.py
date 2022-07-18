class Settings: 
    MYSQL_USER: str ='sql6507226'
    MYSQL_PASSWORD: str = '4VyHbIaj2m'
    MYSQL_SERVER: str = 'sql6.freemysqlhosting.net'
    MYSQL_DB: str = 'sql6507226'
    MYSQL_PORT: str = '3306'
    DATABASE_URL = "mysql+mysqlconnector://%s:%s@%s:%s/%s" % (MYSQL_USER, MYSQL_PASSWORD, MYSQL_SERVER, MYSQL_PORT, MYSQL_DB)

settings = Settings()