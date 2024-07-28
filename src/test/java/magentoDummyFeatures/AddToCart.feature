Feature: Add To Cart An Item From List

  Background:
    * url baseUrlForMagento
    * def email = 'name.sirname34@gmail.com'
    * def password = 'Namesirname1'
    * configure headers = { 'Content-Type': 'application/x-www-form-urlencoded' }
    * configure followRedirects = true

  @Magento
  Scenario: Login and add products to cart
    Given path 'customer/account/loginPost'
    And form field 'login[username]' = email
    And form field 'login[password]' = password
    When method post
    Then status 200

        # Verify successful login by accessing the dashboard
    Given path 'customer/account'
    When method get
    Then status 200
    And match response contains 'customer/account/loginPost/referer'

    # Navigate to the first page of products
    Given path 'catalogsearch/result'
    Given param q = 'tank'
    When method get
    Then status 200
    And match response contains 'catalogsearch/result'

     # Read the json file
   # * def productsData = read ('classpath:src/test/java/magentoDummyFeatures/magentoTankResults.har')
   # * def products = productsData.products

  # Find a product which has under the 20$
    * def firstProduct = karate.filter(products, function(p){ return p.price < 30 })[0]
    * def firstProductId = firstProduct.id

  # Add to cart first product
    Given path 'catalogsearch/result/'
    Given param q = 'tank'
    And request { "cartItem": { "sku": firstProductId, "qty": 1, "quoteId": "cart_quote_id" } }
    When method post
    Then status 200
    And match response contains 'was added to your shopping cart.'

  # navigate second page
    Given path 'catalogsearch/result/'
    And param p = 2
    And param q = 'tank'
    When method get
    Then status 200
    And match response contains 'items'

    # Extract the second product under $20
    * def productsPage2 = $response
    * def secondProduct = karate.filter(productsPage2, function(p){ return p.price < 20 })[0]
    * def secondProductId = secondProduct.id
    * print 'Second Product ID:', secondProductId

    # Add the second product to the cart
    Given path 'checkout/cart/add'
    And request { "product": secondProductId, "qty": 1 }
    When method post
    Then status 200
    And match response contains 'was added to your shopping cart.'

    # Proceed to checkout
    Given path 'checkout'
    When method get
    Then status 200
    And match response contains 'checkout'

    # Fill in the billing and shipping information
#    Given path 'checkout/onepage/saveBilling'
#    And request {
#  "billing": {
#  "address_id": "",
#  "firstname": "Ali",
#  "lastname": "Kaya",
#  "company": "",
#  "email": email,
#  "street": ["Street Address"],
#  "city": "City",
#  "region_id": "12",  # Replace with actual region ID
#  "postcode": "12345",
#  "country_id": "US",
#  "telephone": "1234567890",
#  "fax": "",
#  "save_in_address_book": 1
#  },
#  "use_for_shipping": 1
#  }
    When method post
    Then status 200

    # Select shipping method
    Given path 'checkout/onepage/saveShippingMethod'
    And request { "shipping_method": "flatrate_flatrate" }
    When method post
    Then status 200

    # Place the order
    Given path 'checkout/onepage/saveOrder'
#    And request {
#  "payment": {
#  "method": "checkmo"  # Replace with actual payment method
#  }
#  }
    When method post
    Then status 200
    And match response contains 'Your order # is:'
