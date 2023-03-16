#!/bin/python3

### on a given string "s" consist of random digits and smaller letters
# return only missing digits and letters, first are the digits

def missingCharacters(s):
    alphabet_list = [chr(x) for x in range(ord('a'), ord('z') + 1)]
    digit_list = range(0,9+1)
    string_digit_list = [str(x) for x in digit_list]

    string_result = sorted(list(set(alphabet_list)-set(s)))
    print(string_result)

    extract_digits = sorted(list(''.join((x for x in s if x.isdigit()))))
    print(extract_digits)

    print(string_digit_list)

    digit_result = sorted(list(set(string_digit_list)-set(extract_digits)))
    print(digit_result)

    result=''.join(digit_result+string_result)
    print(result)


if __name__ == '__main__':

    s = "8hypotheticall024y6wxz"

    result = missingCharacters(s)

