def count_of_characters(user_ip):
    dict = {}
    for ch in user_ip:
        dict[ch] = dict.get(ch, 0) + 1
    for key, val in sorted(dict.items()):
        print('{} occurred {} times'.format(key, val))


count_of_characters("Ranjan")