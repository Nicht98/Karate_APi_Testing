Feature: Create product

  Background:
    * url base_url
    * path '/product/create'
    * header Authorization = 'Bearer ' + authInfo.token

  @TEST_OF-719
  Scenario Outline: Test the create product api call with invalid parameters
    * def productRq =
    """
      {
        name: "<name>",
        description: "<description>",
        image: <image>,
        price: <price>,
      }
    """
    Given request productRq
    And header content-type = 'application/JSON'
    When method POST
    And print response
    Then match karate.range(400, 499) contains responseStatus

    Examples:
      |name                       |description                                                                                    |image              |price |category_id |
      |Samsung                    |This is a description for the smartphone samsung galaxy S8+ worth more than hundred characters |https://image.jpeg |300   |            |
      |house of clotches Cameroon |Description of house                                                                           |https://image.jpeg |15.39 |            |
      |house of clotches Cameroon |This is a description for the smartphone samsung galaxy S8+ worth more than hundred characters |https://image      |-150  |            |
      |Samsung                    |This is a description for the smartphone samsung galaxy S8+ worth more than hundred characters |https://image      |-200  |            |

  @TEST_OF-720
  Scenario: Test the create product api call with valid parameters
    * def bodyRq =
    """
   {
   "name":"#('Smartphone samsung galaxy S9+' +  Date.now())",
   "description":"This is a description for the smartphone samsung galaxy S8+ worth more than hundred characters, Smartphone samsung galaxy S8+",
   "image":[
      "https://image.png",
      "https://image.png",
      "https://image.png"
   ],
   "price":300,
   "isActive":false,
   "category":"6267bd9864a9f9ca3bc737cd",
   "promotion":"62a6fe4693a5a5b98ad33aee",
   "attributs":{
      "colors":["green"],
      "height":["M","L"]
   }
}
    """
    Given request bodyRq
    When method POST
    And  print catInfo
    Then status 201
    And print response



#  Method : POST
#  URL : "https://ztrain-shop.herokuapp.com/product/create"
#  Headers: {
#  "Content-Type": "application/json",
#  "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYxZWZjNGIxNDVmOWIxZWY5YzZhMzZmMiIsImlhdCI6MTY0MzI3NDEzMCwiZXhwIjoxNjQzMzYwNTMwfQ.x5TxNZ-ffPhjy79Uwj7uVTuQkd-cffDZl7xqaY6xvRM"
#  }
#  Request : {
#  "name": "Samsung Note 9jlsjsdqsdcaaabbb",
#  "description": " Samsung Note 9 description, Samsung Note 9 description Samsung Note 9 description Samsung Note 9 description",
#  "image":["https://image.png", "https://image.png", "https://image.png"],
#  "price": 10,
#  "isActive": false,
#  "category": "625d70ef3f538325fe268e56",
#  "promotion": "6283b33d0effaba5dd6a94fc",
#  "attributs": {
#  "colors": ["green"],
#  "height": ["M", "L"]
#  }
#  }
#  Reponse: status 201
#  {
#  "name": "Samsung Note 9jlsjsdqsdcaaabbb",
#  "description": " Samsung Note 9 description, Samsung Note 9 description Samsung Note 9 description Samsung Note 9 description",
#  "image": [
#  "https://image.png",
#  "https://image.png",
#  "https://image.png"
#  ],
#  "price": 10,
#  "comments": [],
#  "isActive": false,
#  "category": "625d70ef3f538325fe268e56",
#  "promotion": "6283b33d0effaba5dd6a94fc",
#  "attributs": {
#  "colors": [
#  "green"
#  ],
#  "height": [
#  "M",
#  "L"
#  ],
#  "_id": "628b65fca140eee8ddc868fd"
#  },
#  "createAt": "2022-05-23T10:24:09.063Z",
#  "_id": "628b65fca140eee8ddc868fc",
#  "__v": 0,
#  "id": "628b65fca140eee8ddc868fc"
#  }
