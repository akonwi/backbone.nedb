## backbone.nedb

Use Backbone models with NeDB rather than REST server database. This came out of a need to use Backbone inside of a [node-webkit](http:github.com/rogerwang/node-webkit) app I'm working on and I wanted a simple database management system. NeDB is just the right size.

## Currently...

This is a very simplified and alpha setup right now and it is just a replacement Backbone.sync method. Only the basic CRUD operations have been implemented at the moment because I haven't found a need for the extra fixin's and options.

## Setup

The module is a function that takes the Backbone object and stuffs it with a new sync method
`require('backbone.nedb')(Backbone)`

In order to interact with the database, it needs to be in the global scope as `db`. Perhaps in the future that will change and the database won't have to be hard coded as 'db' and allow for multiple datastores and the sync method will determine the correct one to work with.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
