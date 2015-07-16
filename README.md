## Shitty.news
A robot pulls headlines from major news organizations around the internet and creates markov chains out of their headlines to create super shitty news.

inspired by:
- [/r/subredditsimulator](https://www.reddit.com/r/SubredditSimulator/)
- And friends on Twitter

## To build
- cd into project directory
- run `vagrant up`
- This will create your environment running Nginx + Unicorn as well as run all rake and bundle tasks needed
- You can view locally @ `192.168.56.102`
- If front end is your thing check out the `frontend` directory for some hotness there. 