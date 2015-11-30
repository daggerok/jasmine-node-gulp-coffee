calculator = require './../../src/coffee/calculator.coffee'

describe 'calculator', ->
  it 'should add correctly', ->
    expect calculator.add 1, 1
      .toBe 2