## Override Backbone.sync for NeDB
#  This will essentially just write to the db directly
Backbone.sync = (method, model, options) ->
  method_map[method](model, options)

method_map =
  ## By Backbone conventions, the sucess and error callback params
  #  are (model, response, options)
  #  so these params will be (model, err)
  create: (model, options) ->
    console.log "creating model..."
    attributes = model.toJSON()
    db.insert attributes, (err, doc) ->
      ## TODO: perhaps doc should be an instance of Backbone.Model when sent
      #        with the 'request' trigger and callbacks
      model.trigger('request', model, err, options) if err?
      model.trigger('request', model, doc, options)

      options.error?(doc, err) if err?
      options.success?(doc, err)

  ## success and error callbacks will be given the number replaced or error
  update: (model, options) ->
    console.log "updating , model"
    attributes = model.toJSON()
    db.update(
      { _id: attributes._id },
      attributes,
      {},
      (err, numReplaced) ->
        ## Somehow in hell, numReplaced which is an integer, magically turns
        #  into a backbone model when I stuff it into the callback
        #  WHAT AM I MISSING HERE?
        options.error?(numReplaced) if err?
        options.success?(numReplaced) if numReplaced?
    )

  ## success and error callbacks will be given an error if it exists
  delete: (model, options) ->
    console.log "deleting model..."
    attributes = model.toJSON()
    db.remove {_id: attributes._id}, (err) ->
      if err? then options.error?(err) else options.success?()

  read: (model, options) ->
    console.log "fetching model from database..."
    db.findOne {_id: model.get('_id')}, (err, doc) ->
      options.error?(doc, err)
      options.success?(doc)
