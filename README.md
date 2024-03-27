# Chat Easy

It's an experimental chat application api using ruby on rails. Used many other tools and technologies to make it more efficient and easy to use like: redis, sidekiq, docker, docker-compose, elasticsearch, etc.

## Features

- Users can create new application (new client account)
- User can update application client name
- User can list all applications
- Users can create new chat room
- Users can send messages to chat room
- Users can see messages in chat room
- Users can search messages in chat room

## Installation

### Prerequisites

- Ruby 3.3.0
- Rails 7.0.0
- Redis
- Sidekiq
- MySQL
- Docker
- Docker Compose

### Setup

1. Clone the repository

```bash
git clone REPO_URL
```

2. Install dependencies

```bash
bundle install
```

3. Create database

Note: Make sure you have MySQL installed and running on your machine. and update the database.yml file with your database credentials.

```bash
rails db:create
rails db:migrate
```

4. Start the server

Note: Make sure you have elasticsearch installed and running on your machine so that you can search messages.

```bash
rails s
```

5. Start sidekiq

Note: Make sure you have Redis installed and running on your machine.

```bash
bundle exec sidekiq
```

### Docker

You can also run the application using docker and docker-compose.

```bash
docker compose up --build
```

## API Documentation

### Create Application

[POST] /applications

```json
{
  "name": "Application Name"
}
```

### Update Application

[PUT] /applications/:token

```json
{
  "name": "Application Name"
}
```

### List Applications

[GET] /applications

### Create Chat Room

[POST] /chats

```json
{
  "token": "bdce0a6ebd1506248f77d77aa20c4581"
}
```

### List Chat Rooms

[GET] /chats

### Send Message

[POST] /chats/:chat_id/messages

```json
{
  "token": "bdce0a6ebd1506248f77d77aa20c4581",
  "message": "Hello World",
  "chat_number": 1
}
```

### List Messages

[GET] /applications/:token/:chat_number/messages

### Search Messages

[GET] /applications/:token/:chat_number/messages/search?q=:query


## License

This project is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
