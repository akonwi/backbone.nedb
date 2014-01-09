backbone.nedb
=============

Use Backbone models with NeDB rather than REST server database. This came out of a need to use Backbone inside of a [node-webkit](http:github.com/rogerwang/node-webkit) app I'm working on and I wanted a simple database management system. NeDB is just the right size.

Currently...
=============

This is a very simplified and alpha setup right now and it is just a replacement Backbone.sync method. Only the basic CRUD operations have been implemented at the moment because I haven't found a need for the extra fixin's and options.

Setup
=============

The module is a function that takes the Backbone object and stuffs it with a new sync method
`require('backbone.nedb')(Backbone)`
