# (account_id, display_name, username, password, email, created_time, account_type) 
from pydantic import BaseModel


class AccoutCreateForm(BaseModel):
    display_name: str
    username: str
    password: str
    email: str
        
    def is_valid(self):
        if not self.display_name:
            return "Name is required"
        if not self.username or not len(self.username) > 3:
            return "Username should be > 3 characters"
        if not self.email or not (self.email.__contains__("@")):
            self.errors.append("Email is required")
        if not self.password or not len(self.password) >= 6:
            self.errors.append("Password must be > 6 characters")
        if not self.errors:
            return True
        return False
        