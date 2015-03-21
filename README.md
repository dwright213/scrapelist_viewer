##Scrapelist Viewer
---------------------

##Introduction
---------------------
Scrapelist Viewer is a Craigslist scraping program written in Ruby with Sinatra, and a Postgres database. It was designed to create assist in visualizing relationships between Craigslist data and any other data available (moon phases, census, electricity consumption, etc). It is best run on a server as a cronjob so that one can amass a big fun pile of data to slap around in their Javascript framework of choice!

##Requirements
---------------------
To run this you will require a GNU/Linux or OSX computer running Ruby, Postgres, and Activerecord.

##Instructions
---------------------
Navigate your CLI to the "salon" folder and issue the following commands:  
`bundle`  
`rake db:create`  
`rake db:migrate`  
`rake db:test:prepare`  
At this point you will have gathered the needed gems and created the needed databases in Postgres. Now you can run:  
`ruby app.rb`  
This will fire up the Sinatra server, so you can then open a browser window and go to http://localhost:4567 to view and use the app. Have fun!

##Maintainers
---------------------
Dan Wright  
http://danwright.co  

J Sivakumaran  
https://github.com/jsivakumaran  

Ben Pritchard  
https://github.com/ben-pritchard  

Alex Beeken  
http://www.alexbeeken.com/  

Luke Chinworth  
https://github.com/lukechinworth  


##Copyright
---------------------
2015  


##License
---------------------
GPL V2
