# GameOfScrum

## Requirements

This is a Scrum Poker game that is designed to help make estimation and refinement more fun and engaging.

### Models

- User
- Room
  - name
  - number (GUID?)
  - has_many :players
  - host - user_id of creator
- Team
  - owner :user
  - has_many :players
- Player
 - avatar
 - name
 - bio
 - role
 - team
- Round
  - ticket_url -- load in iframe
- Invite
- Point



This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
