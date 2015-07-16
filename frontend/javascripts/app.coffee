###

Copyright (c) 2014 ...

###

# Dependencies
Env = require './env'

class Application

  ###
  *------------------------------------------*
  | constructor:void (-)
  |
  | Construct.
  *----------------------------------------###
  constructor: ->
    console.log('Application Constructor!')

module.exports = Application

$ ->
  # instance
  GR.instance = new Application()