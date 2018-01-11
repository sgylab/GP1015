key_number = "20180109"
key_length = len(key_number)

plaintext = "The quick brown fox jumps over the lazy dog"


def caesar(text, key, mode):
    if mode == 0:  # decrypt
        key = -key
    elif mode == 1:  # encrypt
        key = key
    else:
        print("mode: 0 = decrypt, 1 = encrypt")
    if text.isalpha():
        num = ord(text)
        num += key

        if num > ord('Z'):
            num -= 26
        elif num < ord('A'):
            num += 26
        new_text = chr(num)
    else:
        new_text = text

    return new_text


print(plaintext)

translated = ""
counter = 0
for s in plaintext.upper():
    current_key = int(key_number[counter % key_length])
    counter += 1
    translated += caesar(s, current_key, 1)

print(translated)

decoded = ""
counter = 0
for s in translated.upper():
    current_key = int(key_number[counter % key_length])
    counter += 1
    decoded += caesar(s, current_key, 0)

print(decoded)
