# URLockBox

This app is the final assessment for Mod 4 at Turing School in Denver, and can be found on [GitHub](https://github.com/jk1dd/URLockBox) or live on [Heroku](https://stark-meadow-35466.herokuapp.com/). There is an accompanying service application, called Hot Reads, which can be found on [GitHub here](https://github.com/jk1dd/hot_reads), or [live on Heroku](https://fathomless-basin-91014.herokuapp.com/). It is built in Rails 5.0, tested with [Rspec](https://github.com/rspec/rspec-rails) and [Selenium](https://rubygems.org/gems/selenium-webdriver/versions/2.48.1).

A user can add links to store for later, mark links as read or unread, search through her links, and also toggle links by read or unread.

## Getting Started

To get the project up and running, simply:
```
git clone https://github.com/jk1dd/URLockBox.git
cd URLockBox
bundle
rake db:create
rake db:migrate
```
and visit `localhost:3000` to see the app in development


## Authors

Jonathan Kidd

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
