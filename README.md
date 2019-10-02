# Review Trackers Challenge

## Assignment

1. Please write in ruby or python
2. Use this website: [https://www.lendingtree.com/reviews](https://www.lendingtree.com/reviews)
3. Write a web service that accepts requests of 'lenders' URLs (i.e. [https://www.lendingtree.com/reviews/personal/first-midwest-bank/52903183](https://www.lendingtree.com/reviews/personal/first-midwest-bank/52903183))
4. This service should collect all 'reviews' on the URL defined
5. The response should consist of: title of the review, the content of review, author, star rating, date of review, and any other info you think would be relevant
6. Write tests for your API
7. No need to make a view and datastore is optional
8. Error/bad request handling should be built out

## Example Request

```curl -X POST http://localhost:2345/ -d 'url=https://www.lendingtree.com/content/mu-plugins/lt-review-api/review-api-proxy.php?RequestType=&productType=&brandId=27085'```
