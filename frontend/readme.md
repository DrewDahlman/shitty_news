## Shitty News frontend
This is the frontend of shitty news.

## Run
- cd into project directory
- run `npm install`
- run `bower install`
- run `gulp`

This will start a gulp watcher task that will take all changes made here and place them into the rails pipeline. You can read more about how this works [here](https://github.com/DrewDahlman/gulpRails)

## WTF?
The idea is simple. 
Separate your frontend from your backend and take it a step up by using a build processor like gulp. 

What this is doing is building into the rails asset pipeline which allows us to make use of gem or bower dependencies, it also makes it easier to keep things clean between which side of the app you're working on. Trust me, it might seem weird but it's totally awesome and you should give it a chance.