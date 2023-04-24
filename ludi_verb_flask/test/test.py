from locust import HttpUser, between, task

class User(HttpUser):
    wait_time = between(0.5, 2.5)
    count = 0

    def on_start(self):
        # Incrementar count y asignar a id
        self.id = User.count
        User.count += 1
        
        self.client.post("/create", json={"email": f"user{self.id}@example.com", "password": "password"})
        self.client.post("/login", json={"email": f"user{self.id}@example.com", "password": "password"})

    @task
    def add_word(self):
        self.client.post("/add", json={"word": "coche"})

    @task
    def logout(self):
        self.client.get("/logout")