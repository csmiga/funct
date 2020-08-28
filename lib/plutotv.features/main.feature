Feature: showing off behave

    Scenario: run a simple test at plutotv
        Given firefox web browser is installed
        When plutotv is reachable
        Then test plutotv main page
