chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

Helper = require('hubot-test-helper')
# helper loads all scripts passed a directory
scriptHelper = new Helper('../src/agenda.coffee')

describe 'agenda', ->
  beforeEach ->
    @room = scriptHelper.createRoom()

  afterEach ->
    @room.destroy()

  #  it 'registers cal:add listener', ->
  #    expect(@room.robot.respond).to.have.been.calledWith(/cal:add (.+)/)
  #
  #  it 'registers cal:list listener', ->
  #    expect(@robot.respond).to.have.been.calledWith(/cal:list/)
  #
  #  it 'registers cal:clear listener', ->
  #    expect(@robot.respond).to.have.been.calledWith(/cal:clear/)
  #
  #  it 'registers cal:delete listener', ->
  #    expect(@robot.respond).to.have.been.calledWith(/cal:delete (.+)/)


  describe 'delete', ->
    beforeEach ->
      @room.robot.brain.set 'calendars', ['cal1', 'cal2', 'cal3']
      @room.user.say 'user1', 'hubot cal:delete cal2'

    it 'remove calendar from brain', ->
      expect(@room.robot.brain.get 'calendars').to.eql ['cal1', 'cal3']
