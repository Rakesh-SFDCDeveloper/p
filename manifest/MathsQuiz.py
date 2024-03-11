counter=0;

#Question 1
answer=input('What is the total of :9+6')
answer=int(answer);
correct_answer=9+6;
print(f'correct_answer {correct_answer}')
if answer==correct_answer:
    print(f'Well done! {answer} is correct answer')
    counter=counter+1;
else:
    print(f'Correct answer is {answer}')


print(f'counrt is {counter}');
#Question 2
answer1=input('What is the multiplication of : 6*3')
answer1=int(answer1)
correct_answer1=6*3;
print(f'correct_answer {correct_answer1}')

if answer==correct_answer:
    print(f'Well done! {answer1} is correct answer')
    counter=counter+1;
else:
    print(f'Correct answer is {correct_answer1}')

print(f'counrt is {counter}');
#Question 3
answer2=input('What is the substract  of : 10-34')
answer2=int(answer2)
correct_answer2=10-34;

if answer==correct_answer2:
    print(f'Well done! {answer2} is correct answer')
    counter=counter+1;
else:
    print(f'Correct answer is {answer2}')


    print('Thanks for taking the quiz');
    print(f'Your correct answers are {counter}')



    