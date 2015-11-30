calculator = require '../../src/scripts/calculator'

describe 'calculator', ->
  it 'should add correctly', ->
    expect calculator.add 1, 1
      .toBe 2