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


def str2num(text):
    raw_code = []
    for s in text:
        num = ord(s)
        raw_code.append(num)
    return raw_code


def shift_code(raw_code, key):
    encrypted_code = []
    for num in raw_code:
        if ord("a") <= num <= ord("z"):
            num += key
            num = loop_char(num, "a", "z")
        elif ord("A") <= num <= ord("Z"):
            num += key
            num = loop_char(num, "A", "Z")
        else:
            pass
        encrypted_code.append(num)
    return encrypted_code


def num2str(code):
    string = []
    for i in range(len(code)):
        new_char = chr(code[i])
        string.append(new_char)
    return string


def ceaser_encrypt(text, key):
    raw_code = str2num(text)
    encrypted_code = shift_code(raw_code, key)
    string = num2str(encrypted_code)
    encrypted_text = joint_text(string)
    return encrypted_text


def ceaser_decrypt(text, key):
    key *= -1
    decrypted_text = ceaser_encrypt(text, key)
    return decrypted_text


original_text = "the quick brown fox jumps over the lazy dog"
print(original_text)

key = 1

translated_text = ceaser_encrypt(original_text, key)
print(translated_text)

decode_text = ceaser_decrypt(translated_text, key)
print(decode_text)
