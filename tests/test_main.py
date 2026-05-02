from fastapi.testclient import TestClient

from app.main import USERS, app


client = TestClient(app)


def test_health():
    r = client.get("/health")
    assert r.status_code == 200
    assert r.json() == {"status": "ok"}


def test_list_users():
    r = client.get("/users")
    assert r.status_code == 200
    assert len(r.json()) == 3


def test_get_user_ok():
    r = client.get("/users/1")
    assert r.status_code == 200
    assert r.json()["name"] == "Ada"


def test_get_user_404():
    r = client.get("/users/999")
    assert r.status_code == 404


def test_stats():
    r = client.get("/stats")
    assert r.status_code == 200
    payload = r.json()
    assert "user_count" in payload
    assert payload["user_count"] == len(USERS)
