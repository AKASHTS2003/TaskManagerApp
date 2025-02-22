# TaskManagerApp

A simple and efficient task management web application built with **Ruby on Rails**. It provides **CRUD functionality**, **user authentication**, and an **enhanced UI with Bootstrap**. The application also includes **API integration** and supports external data handling.

---

## 🚀 Features

- User authentication using Devise
- Task creation, editing, updating, and deletion
- Priority-based task styling (high-priority tasks in red, low-priority in green)
- Bootstrap-enhanced UI for better design
- Assign users to tasks via a dropdown
- Calendar view for task scheduling
- API endpoints for task management
- 
---

## 📦 Installation

1. **Clone the repository**  
   ```bash
   git clone https://github.com/AKASHTS2003/task-manager.git
   cd task-manager
   ```

2. **Install dependencies**  
   ```bash
   bundle install
   ```

3. **Setup the database**  
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. **Run the server**  
   ```bash
   rails server
   ```

5. Open **http://localhost:3000** in your browser.

---

## 🛠 Technologies Used

- **Ruby on Rails** - Backend framework
- **PostgreSQL** - Database
- **Bootstrap** - Frontend styling
- **Devise** - User authentication
- **Render** - Deployment platform
- **Postman** - API testing

---

## 🧪 Running Tests

Run the test suite using RSpec:  
```bash
rspec
```

---

## 📡 API Endpoints

| Method | Endpoint          | Description            |
|--------|------------------|------------------------|
| GET    | `/tasks`         | List all tasks        |
| POST   | `/tasks`         | Create a new task     |
| GET    | `/tasks/:id`     | View a specific task  |
| PUT    | `/tasks/:id`     | Update a task         |
| DELETE | `/tasks/:id`     | Delete a task         |

---

## 🚀 Deployment

Deployed on **Render**: [Live Demo](https://mysite-qytx.onrender.com/)  

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. **Fork the repository**  
2. **Create a new branch** (`feature/your-feature-name`)  
3. **Commit your changes**  
4. **Push to your fork and create a pull request**  

---

## 📜 License

This project is open-source and available under the [MIT License](LICENSE).

---

## 📬 Contact

For any queries, feel free to reach out:

- **Email**: [akash.t.shaju@gmail.com](mailto:akash.t.shaju@gmail.com)
- **LinkedIn**: [Akash T S](https://www.linkedin.com/in/akash-t-shaju/)
- **GitHub**: [AKASHTS2003](https://github.com/AKASHTS2003)

---

### ⭐ Show Some Love  
If you find this project helpful, **give it a star 🌟 on GitHub**!
