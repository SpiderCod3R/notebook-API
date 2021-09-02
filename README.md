# README

**NOTEBOOK**-API  

> Seguindo a Documentação Oficial do ```JSON APi```
> Following the JSON API official documentation

### *SETUP*   
```ruby
  $> rails dev:setup  
  $> foreman start
```

### EXEMPLOS:

- CONTACT
```json
{
  "data": {
    "id": "103",
    "type": "contacts",
    "attributes": {
      "name": "Jack the Code Ripper",
      "email": "coderipper@gmail.com",
      "birthdate": "27/05/1989"
    },
    "relationships": {
      "kind": {
        "data": {
          "id": "2", 
          "type": "kinds"
        }
      }
    }
  }
}
```

- ADDRESS
```json
{
  "data":{
    "id": "69",
    "type": "addresses",
    "attributes":{
      "street": "19912 Avenida Sílvia",
      "city": "Juru"
    }
  }
}
```
