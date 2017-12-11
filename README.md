# NGINX New Relic Agent Docker Container

A docker container for the [NGINX New Relic Agent](https://www.nginx.com/blog/nginx-plugin-for-new-relic/) Docker Container

## Getting Started

These instructions will cover usage information and for the docker container 

### Prerequisities

In order to run this container you'll need [docker](https://www.docker.com/) installed.


### Usage

#### Environment Variables

* `NEW_RELIC_APP_NAME` - The App name in New Relic
* `NEW_RELIC_LICENSE_KEY` - Your New Relic license key
* `NGINX_STATUS_URL` - Status page for Rew Relic plugin on NGINX.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the 
[tags on this repository](https://github.com/PurpleBooth/nginx-nr-agent/tags). 

## License

This project is licensed under the GPL v3 License - see the [LICENSE.md](LICENSE.md) file for details.
