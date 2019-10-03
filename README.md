# Review Trackers Challenge

## Assignment

1. Please write in ruby or python
2. Use this website: [https://www.lendingtree.com/reviews](https://www.lendingtree.com/reviews)
3. Write a web service that accepts requests of 'lenders' URIs (i.e. [https://www.lendingtree.com/reviews/personal/first-midwest-bank/52903183](https://www.lendingtree.com/reviews/personal/first-midwest-bank/52903183))
4. This service should collect all 'reviews' on the URI defined
5. The response should consist of: title of the review, the content of review, author, star rating, date of review, and any other info you think would be relevant
6. Write tests for your API
7. No need to make a view and datastore is optional
8. Error/bad request handling should be built out

## Setup

`bundle install`

## Turn On Server

`ruby server.rb`

## Example Request To Test API

`curl -X POST http://localhost:2345/ -d 'uri=https://www.lendingtree.com/reviews/personal/first-midwest-bank/52903183'`

## Run Tests With

`ruby tests/tests.rb`
