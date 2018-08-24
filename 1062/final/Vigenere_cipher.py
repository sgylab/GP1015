def loop_char(num, start_char, end_char):
    loop_length = ord(end_char) - ord(start_char) + 1
    if num < ord(start_char):
        num += loop_length
    elif num > ord(end_char):
        num -= loop_length
    return num


def caesar(char, key):
    num = ord(char)
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


def encrypt(text, keyword):
    translated_text = ""
    keyword = keyword.upper()
    j = 0
    for i in range(len(text)):
        if text[i].isalpha():
            key = ord(keyword[j % len(keyword)])
            key -= ord("A")
            translated_text += caesar(text[i], key)
            j += 1
        else:
            translated_text += text[i]
    return translated_text


def decrypt(text, keyword):
    translated_text = ""
    keyword = keyword.upper()
    j = 0
    for i in range(len(text)):
        if text[i].isalpha():
            key = ord(keyword[j % len(keyword)])
            key -= ord("A")
            reversed_key = key * -1
            translated_text += caesar(text[i], reversed_key)
            j += 1
        else:
            translated_text += text[i]
    return translated_text


original_text = "Hello MotherFucker"

keyword = "YOUSUCK"

print("Original text:")
print(original_text)

translated_text = encrypt(original_text, keyword)
print("Translated text, key = %s:" % keyword)
print(translated_text)

decoded_text = decrypt(translated_text, keyword)
print("Decoded text, key = %s:" % keyword)
print(decoded_text)
