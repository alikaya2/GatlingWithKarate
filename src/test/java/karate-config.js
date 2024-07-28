function fn() {
  var config = {
    baseUrlForRegresIn: 'https://reqres.in/',
    baseUrlForMagento: 'https://magento.softwaretestingboard.com/',

    headers: {
      'Content-Type': 'application/json'
    }
  };

 karate.configure('logLevel', 'DEBUG');

  return config;
}
