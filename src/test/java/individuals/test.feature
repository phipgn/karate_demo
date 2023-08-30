Feature: Test

    Background:
        * url baseUrl
        * def data = read('classpath:data/test-accounts.json')
        * def accountId = data[karate.env].canonical_account_id
        # * def faker = Java.type('net.datafaker.Faker')
        # * def r = new faker()

    @setup
    Scenario:
        * def suffixes = read('classpath:data/matchmove-suffixes.csv')

    @getNames
    Scenario:
        * def name1 = 'Phi'
        * def name2 = 'Yiwen'

    Scenario: Test
        * def r = call read(`${utilPaths.random}@getNumber`) { length:15 }
        * print r.number
        # * def rd = call read('@getNames')
        # * print rd.name1
        # * def n = r.number().digits(15)
        # * print n

    Scenario: Test get beneficiaries endpoint
        * path `/accounts/${accountId}/beneficiaries`
        * method get
        * status 200
        * match response.data == '#[]'

    Scenario: Test get beneficiaries endpoint (invalid)
        * path `/accounts/123/beneficiaries`
        * method get
        * status 400
        * match response.data == '#notpresent'
        * match response.error_code == 'VALIDATION_ERROR'

    Scenario Outline: Test creating a beneficiary account: <acc_name_suffix>
        # * def accountNumber = r.number().digits(15)
        * def r = call read(`${utilPaths.random}@getNumber`) { length:20 }
        * def accountNumber = r.number
        * set payload
            | path                | value                    |
            | account_holder_name | 'Test <acc_name_suffix>' |
            | account_number      | accountNumber            |
            | account_bank_code   | 'BKCHSGS0XXX'            |
        * path `/accounts/${accountId}/beneficiaries`
        * request payload
        * method post
        * status 201
        * match response.request_id == '#number'
        * match response.canonical_partner_beneficiary_account_id == '#string'
        * match response.account_holder_name == payload.account_holder_name
        * match response.account_number == payload.account_number
        * match response.account_bank_code == payload.account_bank_code
        * match response.partner_beneficiary_account_id == '#string'

        Examples:
            | karate.setup().suffixes |
