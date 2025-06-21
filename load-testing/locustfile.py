"""
Load-test the Swagger Petstore API with 5 virtual users.

Endpoints under test
  • GET /pet/1
  • GET /pet/findByStatus?status=available
Run with:
    locust -f locustfile.py --host https://petstore.swagger.io/v2 \
           --users 5 --spawn-rate 1
"""
from locust import HttpUser, task, between


class PetstoreUser(HttpUser):
    wait_time = between(1, 2)  # small think-time between requests

    @task(2)        # weighted 2× so it runs ~⅔ of the time
    def get_single_pet(self):
        self.client.get("/pet/1", name="/pet/1")

    @task(1)        # weighted 1× so it runs ~⅓ of the time
    def get_available_pets(self):
        self.client.get(
            "/pet/findByStatus",
            params={"status": "available"},
            name="/pet/findByStatus?status=available",
        )
