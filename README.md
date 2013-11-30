# Prodder

> To jab or poke, as with a pointed object.

Or

> To goad to action; incite.


## Purpose

This test suite contains a collection of very opinionated
security-related tests, intended for general usage against most types
of web application. You can run the tests out-of-the-box or use them as
a starting point for more domain specific tests.

Currently the tests cover:

* security-minded HTTP headers
* checking for open ports
* issues with SSL configuration


## Installation

Most of the test suite is a Ruby application. I'm going to assume you're
familiar with Ruby and have [bundler installed](http://bundler.io/).

    bundle install

SSLyze is used for the SSL functionality and needs to be available on
your path when running the test suite. SSLyze is a python application
and can be installed via [pip](http://www.pip-installer.org/) with:

    pip install -r requirements.txt

Note that I'm currenly using a slighly older version of SSLyze as it is
available in pure Python, which makes installation a little easier. 


## Usage

    HOST=yourwebsitehere bundle exec rake

Note that environment variable for HOST, set this to the site you want
to test. This should run through the test suite and output results which
will look something like:

    Scenario: Check certificate renegotiations
      When we test certificate renegotiation
      Then the output should contain "Client-initiated Renegotiations: Rejected"
      And the output should contain "Secure Renegotiation: Supported"

Here is a very short [video on asciinema](http://asciinema.org/a/6565)
of some of the tests in action.

As for what all the tests are doing, I'd recommend reading the test
output or the features in the `features` directory.


## Advanced usage

If you only want to run part of the test suite you can, either by using
cucumber directly or using the following rake tasks. Rake will let you list
the available commands like so:

    bundle exec rake -T

Which should return something like:    

    rake prod:all      # Run all probes
    rake prod:headers  # Only run the headers probes
    rake prod:ports    # Only run the ports probes
    rake prod:ssl      # Only run the ssl probes


## Reuse

The steps used as part of this test suite are now part of a gem, called
[prodder-steps](https://github.com/garethr/prodder-steps).

In order to use these in your own cucumber features you can simply
include the following in `features/support/env.rb` or similar:

    require 'prodder-steps/cucumber'

In order to use this you'll first need to include prodder-steps in your
Gemfile:

    gem "prodder-steps"


## Opinions?

As noted above this specific test suite is pretty opinionated. I'm
interested in pull requests to challenge those opinions – it would
be nice if as a broad community we could agree on some best practices.


## Thanks

Thanks to [nabla-c0d3](https://github.com/nabla-c0d3) for
[SSLyze](https://github.com/iSECPartners/sslyze) which does most of the
work for the SSL tests.

Thanks also to the folks behind [Gauntlt](http://gauntlt.org/). I've
borrowed some of the ideas but found myself wanting to start smaller.
This project is all about strong options, whereas Gauntlt takes much
more of an integrated framework approach. If you've not used Gauntlt
already you should check it out.
