# Rails Pacman webapp
Ruby on rails webapp to play pacman in single player and multiplayer mode. Currently in development.

![Landing Page](./app/assets/images/landing-page.png)

## Table of contents
* [Description](#description)
* [Features](#features)
* [Prerequisites](#prerequisites)
* [Setup](#setup)
* [Status](#status)
* [Credits](#credits)

## Description
A webapp to play Pacman in single player and multiplayer mode, maintain statistics of games played, view leaderboards etc. This project was developed out of love for the classic game pacman and to understand the concepts of real-time multiplayer gameplaying.

### Technologies used
* Backend - Ruby on Rails 
* Frontend - Bulma CSS framework
* Redis, for a real time gameplaying experience.

## Features

Following features have been implemented:
* Play single player mode Pacman as guest (without user account).
* Play Multiplayer Mode, where two players can race with each other to finish all the pellets first :D
* Create user account and save your games.
* Maintain user game statistics - high score, no of wins total games played etc.
* View Leaderboards (Based on no of total wins, high score and total score).

Following features are currently in development:
* A multiplayer mode where 2-4 players will play in the same maze. Players will receive power pellets randomly which will enable them to eat other players. The one with the highest score wins! 
* Adding supercool sound effects to the game.

## Prerequisites
* Ruby >=2.7.2
* Rails 6.1.3.1
* Redis >=3.0

Check your version using ```ruby -v ``` and ```rails -v```

## Setup

### Using Docker

Build a docker image and run it using docker-compose. This is especially useful if your system does not meet above dependencies.
```
docker-compose build
docker-compose up
```
The project is now hosted on ```http://127.0.0.1:3000```

### Step by Step

Clone the repository:
```
https://github.com/squarebat/pacman.git
cd pacman
```

Install required gems and webpacker to precompile js files:
```
bundle install
rails webpacker:install
```
If bundler is not installed, you can install it using ```gem install bundler```

Run all database migrations:
```
rails db:migrate
```

Run the server
```
rails server
```

It can now be accessed on ```http://127.0.0.1:3000```

Alternatively, you can host it on a different port using the command ```rails server -p <port_no>```

To use the multiplayer game feature, you'll have to start up a redis server on port `6379`. If you'd like to use redis on a different port, change the port number in `/app/config/cable.yml`

## Status
Project is currently in development. Feel free to create an issue and contribute :D

## Credits

[ziw/Javascript-Pacman](https://github.com/ziw/Javascript-Pacman) - The javascript files for the pacman gameplay obtained from this repo, were developed by Zi Wang (ziw), Bingying Xia (bxia). The files were further modified for this project.
