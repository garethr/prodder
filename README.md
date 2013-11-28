# Prodder

> To jab or poke, as with a pointed object.

Or

> To goad to action; incite.


## Purpose

This test suite contains a collection of very opinionated security
related tests, intended for general usage against most types of
web application. You can run the tests out-of-the-box or use them as
a starting point for more domain specific tests.

Currently the tests cover:

* Security minded HTTP headers
* Checking for open ports
* Issues with SSL configuration


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


## Opinions?

As noted above this specific test suite is pretty opinionated. I'm
interested in two things:

* Pull requests to challenge those opinions. It would be nice if as a
  broad community we could aggree on some best practices.
* Identiying areas where more flexibility is a good thing. At the moment
  that means maintaining your own fork but if areas like that emerge
  I'll look at baking in more options based on usage.


## Thanks

Thanks to [nabla-c0d3](https://github.com/nabla-c0d3) for
[SSLyze](https://github.com/iSECPartners/sslyze) which does most of the
work for the SSL tests.

Thanks also to the folks behind [Gauntlt](http://gauntlt.org/). I've
borrewed some of the ideas but found myself wanting to start smaller.
This project is all about strong options, whereas Gauntlt takes much
more of an integrated framework approach. If you've not used Gauntlt
aleady you should check it out.
