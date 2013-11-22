Skeleton of Jubatus Client Application in Ruby
===============================================

Requirements
------------

* Jubatus server 0.5.0+
* jubatus gem ( install via `gem install jubatus` )

Usage
-----

To test the client, run:

```
$ jubarecommender --configpath /usr/local/share/jubatus/example/config/recommender/lsh.json &
$ ruby client.rb
```

We assume that Jubatus was installed into /usr/local/. Otherwise, please modify the path.

Now, write your own code in `client.rb`, then run the client again.
