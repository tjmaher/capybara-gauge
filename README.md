# capybara-gauge
This project is a basic UI testing framework with Capybara + Ruby + Bundler + Gauge testing Dave Haeffner's site, [The-Internet](https://the-internet.herokuapp.com/login). 

Normally, [logs](https://github.com/tjmaher/capybara-gauge/tree/master/logs) and [reports](https://github.com/tjmaher/capybara-gauge/tree/master/reports) are set not to upload in the .gitignore. We have uploaded both for the reader to view. 

Example: The reader can view the HTML Reports: (http://htmlpreview.github.com/?https://github.com/tjmaher/capybara-gauge/blob/master/reports/html-report/index.html) generated. 


## Basic Capybara-Gauge 
_December 2018_

Code walkthoughs are given on the software testing blog, **Adventures in Automation** at http://tjmaher.com/

* **Part One:** [Analyzing The-Internet](http://www.tjmaher.com/2018/12/basic-capybara-gauge-analyzing-internet.html)
* **Part Two:** [Setup Ruby Environment](http://www.tjmaher.com/2018/12/capybara-gauge-2.html)
* **Part Three:** [Setup Capybara to Test Opening Chrome](http://www.tjmaher.com/2018/12/capybara-gauge-3.html)
* **Part Four:** [Add Option For Chrome Headless](http://www.tjmaher.com/2018/12/capybara-gauge-4.html)
* **Part Five:** [Add Test Steps and Spec Implementations](http://www.tjmaher.com/2018/12/basic-capybara-gauge-setting-up-specs.html)
* **Part Six:** [Setup Chrome and ChromeDriver Logging](http://www.tjmaher.com/2018/12/capybara-gauge-6.html)
* **Part Seven:** [Rubocop Code Review](http://www.tjmaher.com/2018/12/capybara-gauge-7.html)
* **Source Code:** https://github.com/tjmaher/capybara-gauge

## Framework

* [Spec](https://github.com/tjmaher/capybara-gauge/tree/master/specs): The test specifications: Human readable documents telling what is being tested and how
* [Step Implementations](https://github.com/tjmaher/capybara-gauge/tree/master/step_implementations): Matches the test steps with the Capybara code that executes the browser tests
* Step Implementations/[Spec_Helper.rb](https://github.com/tjmaher/capybara-gauge/blob/master/step_implementations/spec_helper.rb): Configures Capybara to work with the Gauge framework, sets up Chrome to open in headless and non-headless mode, and sets up Chrome and ChromeDriver logging. 
* [Reports](https://github.com/tjmaher/capybara-gauge/tree/master/reports): See what happens when the browser tests run, in xml, json, or html format. 
* [Logs](https://github.com/tjmaher/capybara-gauge/tree/master/logs): Anything go wrong when running the tests? Check if there are console errors in the chrome.log, or Selenium problems in the chromedriver.log. 


