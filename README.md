<p align="center">
    <a href="https://www.question2answer.org/">
        <img src="https://www.question2answer.org/images/question2answer-logo-350x40.png" alt="Question2Answer" />
    </a>
</p>



## Docker
  ### qa-config.php - customizações - se for usar o docker-compose não precisa alterar
	* Add the following:
		MYSQL_HOST = mysql host url or IP
		MYSQL_USERNAME = mysql user name
		MYSQL_PASSWORD = mysql password
		MYSQL_DB_NAME = mysql DB name

  ### Build
    * docker build -t question2answer .

  ### RUN com banco de dados separado
    * docker run -d -p 80:80 --network question2answer_default -e MYSQL_HOST=mysql_container -e MYSQL_USERNAME=question-user -e         MYSQL_PASSWORD=QuestionAnswer42 -e MYSQL_DB_NAME=question-db question2answer	

## docker-compose
  ### config
    * configure 
      * nome do banco de dados, usuário e senha
      * path para volume do banco de dados e blob

  ### Iniciando 
    * docker-compose up -d

  ### http://localhost

  ### adminer 	
    * http://localhost:8181
