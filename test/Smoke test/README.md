# abhhomepage-automation

## What it is?
Sanity check tests for AtlantBH homepage

## Usage

1. Configure environment:
Use environment.yaml to setup url, platform, driver and other specifics for running tests against AtlantBH homepage. PLATFORM can be: mobile_ios, mobile_android and web. For mobile ORIENTATION can be landscape or portrait. To setup execution in specific browser (firefox, chrome or safari), you need to change ```driver``` value in environment.yaml configuration file. To setup execution on specific ios/android devices the ```ios```/```android``` values need to be changed.

2. Run tests:
```
bundle exec rspec spec/*
```