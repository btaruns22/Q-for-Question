# MySQL + Flask Boilerplate Project

This repo contains a boilerplate setup for spinning up 2 docker containers: 
1. A MySQL 8 container for obvious reasons
1. A Python Flask container to implement a REST API

## How to setup and start the containers
**Important** - you need Docker Desktop installed

1. Clone this repository.  
1. Create a file named `db_root_password.txt` in the `secrets/` folder and put inside of it the root password for MySQL. 
1. Create a file named `db_password.txt` in the `secrets/` folder and put inside of it the password you want to use for the `webapp` user. 
1. In a terminal or command prompt, navigate to the folder with the `docker-compose.yml` file.  
1. Build the images with `docker compose build`
1. Start the containers with `docker compose up`.  To run in detached mode, run `docker compose up -d`. 

## For setting up a Conda Web-Dev environment:

1. `conda create -n webdev python=3.9`
1. `conda activate webdev`
1. `pip install flask flask-mysql flask-restful cryptography flask-login`


# Q for Question Overview

[![Q for Question Overview Video Link Here!](https://img.youtube.com/vi/ISZbOyt18_k/default.jpg)](https://www.youtube.com/watch?v=ISZbOyt18_k&ab_channel=TarunBadarvada)

# What is Q for Question?

Question.io is a tool that aims to facilitate communication between students and teachers in the classroom. It provides a platform for students to ask questions during class and for teachers to answer them. The tool allows teachers to start a session at the beginning of each class and moderate the questions asked by students. Students can login to the session and ask their questions anonymously or not. The goal of this tool is to create a more open and engaging learning environment in the classroom.


