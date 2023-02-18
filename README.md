Blossom Backend Developer Test
==============================

In this test you are asked to build a simple logic based following the best TDD and BDD methodologies.

There are existing behats that covers most of the use cases we are interested in.

Your job is to make sure that all the tests pass successfully and the code is written in the production ready style.

We are more than happy to understand the journey you are going to take to find the final solution, this is why we will appreciate if you share with us the git repository
with the commits history.

###### Extra

- You can add phpunit / phpspec tests if you think this is what would you while shipping your solution on the production.
- On the production you would definitely make a release with the data migrations, use them for this task too. 

# Requirements

- Docker 20.x

Refer to the following links for more information:
- [Getting Started Guide](https://api-platform.com/docs/distribution)
- [Behat](https://docs.behat.org/en/latest/)
- [Behat Extension](https://behat-api-extension.readthedocs.io/en/latest/guide/verify-server-response.html#then-the-response-body-matches-pystringnode)

# Setup

## Build the project

After setting up the docker on your machine and you are running the project first time please do `./make upForce`. Following this
you can use `./make up`.

## Run the tests

The tests can be invoked as simple as `./make qa`. If you decide to run tests individually (that we recommend) please ssh into the container and perform the interested one.

Bare in mind that the tests are not isolated. We have not added any `beforeScenario|Feature` hooks to ensure data isolation for the needs of this coding test. 
Each tests rely on the data that could be modified in the other test so please do not fall into the trap ;)

###### Extra
Feel free to check other `make` targets, you might find them helpful.
