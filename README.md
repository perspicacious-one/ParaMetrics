# README

An analytics service for tracking & visualizing events for users websites linked to the service.

### Created With:
* Rails 5.1.5
* Sass-Rails 5
* Devise
* Slim
* Chartkick

### Getting Started

1. Download or clone the repo. `git clome git@github.com:perspicacious-one/parametrics.git`

2. navigate to the directory `cd parametrics`

3. Run the database migrations `rails db:migrate`

4. (Optional) Seed the database `rails db:seed`

5. Run `rails s`


#### Snippets
**AJAX Request Snippet**

```javascript
var parametrics = {};
parametrics.report = function(eventName){
  var event = {event: { name: eventName }};
  var request = new XMLHttpRequest();

  request.open("POST", "http://localhost:3000/api/events", true);
  request.setRequestHeader('Content-Type', 'application/json');
  request.send(JSON.stringify(event));
};
```
