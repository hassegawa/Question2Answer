<p align="center">
    <a href="https://www.question2answer.org/">
        <img src="https://www.question2answer.org/images/question2answer-logo-350x40.png" alt="Question2Answer" />
    </a>
</p>

---
## docker-compose
  [repository](https://github.com/hassegawa/Question2Answer)

  
  ### config [docker-compose.yaml](https://raw.githubusercontent.com/hassegawa/Question2Answer/main/docker-compose.yaml)
    * configure 
      * database name, username and password
      * volumes:
        * path to database files and blob files
      * listener ports

  ### Start docker compose 
    * docker-compose up -d

  ### http://localhost
---
  ### adminer, database magager	
    * http://localhost:8181

---
## Docker
  ### Build
    * docker build -t question2answer .

  ### RUN com banco de dados separado
    * docker run -d -p 80:80 -e MYSQL_HOST=mysql_container -e MYSQL_USERNAME=DATABASE_USERNAME -e MYSQL_PASSWORD=DATABASE_PASSWORD -e MYSQL_DB_NAME=DATABASE_NAME hassegawa/question2answer	
    
    
    
 [![Foo](https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png)](https://www.buymeacoffee.com/hassegawa)
