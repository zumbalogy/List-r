#List-r

###Make lists. This thing is good at making those lists be for movies you want to watch

http://list-r.herokuapp.com/ 


This is the listr application. r for recursive i guess.

When enetering into your list, after giving the title, it will auto-fill with info if your title matches a movie in IMDB. This should speed up the list making proccess. You can mark movies as 'seen' and they go to another 'seen' version of the list.

The list is sortable by column.




###Relations
3 models. *User* has many *list* has many *items*.

Item
- Title
- Director
- from
- Reccomended by
- year
- language
- genre
- notes 1
- notes 2
- seen



###Api
 - http://www.omdbapi.com/

###Future features:
 - analytics on your list
 - importing and exporting to csv
 - search results orderable
 - random pick option
 - if its on youtube or netflix
 - magnet links
 - edit inline
