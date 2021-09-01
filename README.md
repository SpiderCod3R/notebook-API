# README

**NOTEBOOK**-API

### EXEMPLOS:

- CONTACT
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

- ADDRESS
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