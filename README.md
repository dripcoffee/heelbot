# Heelbot

[![Join the chat at https://gitter.im/crispgm/heelbot](https://badges.gitter.im/crispgm/heelbot.svg)](https://gitter.im/crispgm/heelbot?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
![](https://img.shields.io/badge/license-MIT-blue.svg)
[![](https://api.travis-ci.org/crispgm/heelbot.svg)](https://travis-ci.org/crispgm/heelbot)
[![Code Climate](https://codeclimate.com/github/crispgm/heelbot/badges/gpa.svg)](https://codeclimate.com/github/crispgm/heelbot)
[![Test Coverage](https://codeclimate.com/github/crispgm/heelbot/badges/coverage.svg)](https://codeclimate.com/github/crispgm/heelbot/coverage)

## Introduction

Heelbot helps us enable work automation, by providing a minimal Ruby framework to build awesome bots. We believe that every duplicated work can be done automatically.

## Installation

```
git clone https://github.com/crispgm/heelbot.git

cd heelbot

bundle install

bundle exec exe/heel --version
```

## Usage

### Web Mode

Start server:

```
bundle exec exe/heels --port=9999
```

Query with URL: http://localhost:9999/heels/status

which returns:

```
{
    "status":"listening",
    "version":"2.0.0",
    "time":1471451121
}
```

Query a bot with msg: http://localhost:9999/heels/query?msg=!hw%20hello,world

which returns:

```
{
    "text":"hello,world"
}

### Console Mode

```
# List All Bots
bundle exec exe/heel bot list

# Help of Bot
bundle exec exe/heel help BOT_NAME

# Info of Bot
bundle exec exe/heel info BOT_NAME

# Run Bot
bundle exec exe/heel run BOT_NAME
```

## In-house Bots

* RIO 2016 Olympic Games Medal List
* Group Members
* Mail Template
* iCiba Online Dictionary
* Air Quality Index
* Hello World (Sample Bot)
* Eurocup 2016 Schedule (deprecated)
* Eurocup 2016 Results (deprecated)

## Build Bots

1. Create a file in ```./heelspec```, e.g. ```hello_world.rb```

    ```
    module Heelspec
      class HelloWorld < Heel::Bot
        def initialize
          @name     = "Hello World"
          @version  = "1.0.0"
          @summary  = "Print Hello World"
          @author   = "David Zhang"
          @license  = "MIT"
          @helptext = ""
          @triggers = ["!hw"]
        end

        def run(cmd)
          @msg = get_param(cmd, 0)
          puts @msg
        end
      end
    end
    ```

2. Add your bot to ```bots.yml```

    ```
    - Name: hello_world
    ```

3. Run the bot

    ```
    bundle exec exe/heel run hello_world "hello, world"
    ```

    The result is:

    ```
    hello, world
    ```