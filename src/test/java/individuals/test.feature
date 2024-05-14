Feature: Test

    Scenario Outline: Test <a> + <b> == <c>
        * def a = <a>
        * def b = <b>
        * def c = a + b
        * assert c == <expected>

        Examples:
            | a  | b | expected |
            | 1  | 1 | 2        |
            | 9  | 1 | 10       |
            | -1 | 3 | 2        |