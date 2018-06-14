

def shift_char(num, key):
    if ord("a") <= num <= ord("z"):
        num += key
        num = loop_char(num, 26, "a", "z")
    elif ord("A") <= num <= ord("Z"):
        num += key
        num = loop_char(num, 26, "A", "Z")
    else:
        pass
    return num


def loop_char(num, loop_length, start_char, end_char):
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


def str2num(text, key):
    code = []
    for s in text:
        num = ord(s)
        new_num = shift_char(num, key)
        code.append(new_num)
    return code


def num2str(code):
    string = []
    for i in range(len(code)):
        new_char = chr(code[i])
        string.append(new_char)
    return string


def ceaser_encrypt(text, key):
    code = str2num(text, key)
    string = num2str(code)
    encrypted_text = joint_text(string)
    return encrypted_text


def ceaser_decrypt(text, key):
    key *= -1
    decrypted_text = ceaser_encrypt(text, key)
    return decrypted_text


original_text = "the quick brown fox jumps over the lazy dog"
print(original_text)

key = 13

translated_text = ceaser_encrypt(original_text, key)
print(translated_text)

decode_text = ceaser_decrypt(translated_text, key)
print(decode_text)
