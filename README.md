#List-r

Make lists. This thing is good at making those lists be for movies you want to watch

http://list-r.herokuapp.com/ 


This is the listr application. r for recursive i guess.




models and relations:
    3 models. *User* has many *list* has many *items*.

    Item
      Title
      Director
      from
      Reccomended by
      year
      language
      genre
      notes 1
      notes 2

      seen



*Api
  OMDB

extra/future features:
    1 - analytics on your list
    2 - importing and exporting to csv
    3 - search
    4 - random pick option
    5 - if its on youtube or netflix
    6 - edit inline
