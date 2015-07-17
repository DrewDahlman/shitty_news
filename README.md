## Shitty.news
A robot pulls headlines from major news organizations around the internet and creates [markov chains](https://en.wikipedia.org/wiki/Markov_chain) out of their headlines to create super shitty news. This was built in about 24hours so pardon some bits of messy code :P

## Concept
What happens if a robot writes the news? Headlines these days are so over the top and ridiculous at times that I thought it would be interesting to see what happens when you feed a robot all of these sources and let it write the headlines.

Sometimes the headlines are hilarious, sometimes sad, sometimes they make no sense at all. You will notice how the news cycle works in 24 hours periods, stories will sometimes repeate, this is because the selected news sources are posting the same stories over and over again for clicks and attention.

inspired by:
- [/r/subredditsimulator](https://www.reddit.com/r/SubredditSimulator/)
- Friends on Twitter
- Shitty click bait websites all over

## To build
- cd into project directory
- run `vagrant up` ( You will need vagrant installed )
- This will create your environment running Nginx + Unicorn as well as run all rake and bundle tasks needed
- You can view locally @ `192.168.56.102`
- You can read more about using [vagrant + puppet + nginx & unicorn here](https://github.com/DrewDahlman/vagrant-puppet-boilerplate)
- If front end is your thing check out the `frontend` directory for some hotness there. 