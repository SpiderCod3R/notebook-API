# README

**NOTEBOOK**-API  

> Seguindo a Documentação Oficial do ```JSON APi```
> Following the official JSON API documentation

### *SETUP*
```ruby
  $> rails db:drop db:create db:migrate  
```  
##### *Antes de executar a task abaixo comentar o ```validates presence kind e address``` em contact.rb*
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

- PHONES
```json
{
	"data": 
		{
			"id": "191",
			"type": "phones",
			"attributes": {
				"number": "999-888-777"
			}
		}
}
```
