def loop_char(num, start_char, end_char):
    loop_length = ord(end_char) - ord(start_char) + 1
    if num < ord(start_char):
        num += loop_length
    elif num > ord(end_char):
        num -= loop_length
    else:
        pass
    return num


def joint_text(string):
    text = ""
    for c in range(len(string)):
        text += string[c]
    return text


def string2code(text):
    raw_code = []
    for s in text:
        num = ord(s)
        raw_code.append(num)
    return raw_code


def shift_code_by_key(raw_code, key):
    encrypted_code = []
    for num in raw_code:
        if ord("A") <= num <= ord("Z"):
            num += key
            num = loop_char(num, "A", "Z")
        elif ord("a") <= num <= ord("z"):
            num += key
            num = loop_char(num, "a", "z")
        else:
            pass
        encrypted_code.append(num)
    return encrypted_code


def code2string(code):
    string = []
    for i in range(len(code)):
        new_char = chr(code[i])
        string.append(new_char)
    return string


def ceaser_encrypt(text, key):
    raw_code = string2code(text)
    encrypted_code = shift_code_by_key(raw_code, key)
    string = code2string(encrypted_code)
    encrypted_text = joint_text(string)
    return encrypted_text


def ceaser_decrypt(text, key):
    reversed_key = key * -1
    decrypted_text = ceaser_encrypt(text, reversed_key)
    return decrypted_text


original_text = "the quick brown fox jumps over the lazy dog"
print(original_text)

key = 1

translated_text = ceaser_encrypt(original_text, key)
print(translated_text)

decode_text = ceaser_decrypt(translated_text, key)
print(decode_text)