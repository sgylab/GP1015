def loop_char(num, start_char, end_char):
    loop_length = ord(end_char) - ord(start_char) + 1
    if num < ord(start_char):
        num += loop_length
    elif num > ord(end_char):
        num -= loop_length
    return num


def caesar(char, key):
    num = ord(char)
    num += key
    if ord("A") <= num <= ord("Z"):
        num += key
        num = loop_char(num, "A", "Z")
        new_char = chr(num)
    elif ord("a") <= num <= ord("z"):
        num += key
        num = loop_char(num, "a", "z")
        new_char = chr(num)
    else:
        new_char = char
    return new_char


key_number = "20180109"
plaintext = "The quick brown fox jumps over the lazy dog"

print(plaintext)

translated = ""
counter = 0
for s in plaintext:
    current_key = int(key_number[counter % len(key_number)])
    counter += 1
    translated += caesar(s, current_key)

print(translated)

decoded = ""
counter = 0
for s in translated:
    current_key = int(key_number[counter % len(key_number)])
    counter += 1
    reversed_key = current_key * -1
    decoded += caesar(s, reversed_key)

print(decoded)
