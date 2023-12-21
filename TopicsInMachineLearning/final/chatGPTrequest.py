from openai import OpenAI
import csv
import random

client = OpenAI()

answers = []
f = open('GPTsolutions.csv', 'w')
writer = csv.writer(f)
writer.writerow(["REQUEST", "RESPONSE"])

for k in range(2500):
    i = random.randint(1000,9999)
    j = random.randint(1000,9999)
    request = f"Compute {i}*{j}"
    print(request)
    completion = client.chat.completions.create(
      model="gpt-3.5-turbo",
      messages=[
        {"role": "user", "content": request}  
      ]
    )

    response = completion.choices[0].message
    writer.writerow([request, response.content])

