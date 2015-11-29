calc = require '../../dist/js/calc'

describe "a calc spec", ->
  it "should add 1 and 1 correctly", ->
    expect calc.add 1, 1
      .toBe 2
