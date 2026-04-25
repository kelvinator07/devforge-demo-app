"""devforge-demo-app: tiny FastAPI service used by DevForge agents as a test target."""
from fastapi import FastAPI

app = FastAPI(title="devforge-demo-app")

USERS = [
    {"id": 1, "name": "Ada"},
    {"id": 2, "name": "Linus"},
    {"id": 3, "name": "Grace"},
]


@app.get("/health")
def health():
    return {"status": "ok"}


@app.get("/users")
def list_users():
    return USERS


@app.get("/stats")
def stats():
    return {"user_count": len(USERS)}


@app.get("/users/{user_id}")
def get_user(user_id: int):
    for u in USERS:
        if u["id"] == user_id:
            return u
    from fastapi import HTTPException
    raise HTTPException(status_code=404, detail="user not found")
