# README


### Created With:
* Rails 5.1.5
* SQLlite3
* Sass-Rails 5
* Devise
* Slim
* Chartkick

#### Snippets
**AJAX Request Snippet**

```
var blocmetrics = {};
blocmetrics.report = function(eventName){
  var event = {event: { name: eventName }};
  var request = new XMLHttpRequest();

  request.open("POST", "http://localhost:3000/api/events", true);
  request.setRequestHeader('Content-Type', 'application/json');
  request.send(JSON.stringify(event));
};
```
