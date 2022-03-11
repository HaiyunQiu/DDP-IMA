#2.Write a function that takes in a string parameter and returns a list and a count
# of the unique letters in the string. (Uppercase and lowercase letters should not
# be counted as different letters and symbols should be ignored.)

def unique_letters(sentence):
    sentence_upper = sentence.upper()
    sentence_upper_list = list(sentence_upper)
    sentence_upper_set = list(set(sentence_upper_list))
    sentence_upper_set.sort(key = sentence_upper.index)
    for letter in sentence_upper_set.copy():
        if not letter.isalpha():
            sentence_upper_set.remove(letter)
    count = len(sentence_upper_set)

    tuple = (sentence_upper_set,count)
    print(tuple)


unique_letters("Hello World")