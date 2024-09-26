# Homeserver Config Generator

Setting up a home server to run basic self-hosted applications shouldn't take 3 servers and a kubernetes cluster. That stuff is great to play and learn with, but sometimes you just want to set up some applications with a minimum of fuss :-).

That's where this repo comes in!

## How to use this

Clone the repo and `cd` into the directory.

The simplest way to get started is to simply use all containers. Run the generate script to generate a docker compose file that contains all snippets.

```
./generate.sh --all
```

Now start your containers to test the config!

```
docker-compose up
```

You'll see logs for all containers scroll by, to run them in the background just add the `-d` flag.

### TODO 

- instructions on using alternate config/data locations.
- how to use just some apps, not all of them


## General design

- everything is controlled by a docker-compose file
- each container has its own config directory (and media directory, if applicable). These are both mounted appropriately into each container. This way, we can keep our configs and our data separate.

## TODO
- *arr: use the configs from my other real config to double check
- separate config and data directories/volumes mounted into containers (add mounts)
- add prowlarr to sync indexer between *arr apps
- add some first-setup instructions for included apps (link to existing instructions, don't replicate them here. I don't want to have to keep things in sync)



