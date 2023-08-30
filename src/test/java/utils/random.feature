Feature: Randomization functions

    Background:
        * def faker = Java.type('net.datafaker.Faker')
        * def r = new faker()
    
    @getNumber
    Scenario: Generate a random number
        * def number = r.number().digits(length)


