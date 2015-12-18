(function() {
  var httpRequest;
  var response;

  function makeRequest() {
    httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = getResponse;

    httpRequest.open('GET', '/status');
    httpRequest.send();
  }

  function getResponse() {
    if (httpRequest.readyState === XMLHttpRequest.DONE) {
      if (httpRequest.status === 200) {
        response = JSON.parse(httpRequest.responseText);
      }
    }
    render();
  }

  function render() {
    document.getElementById("hostname").innerHTML = response.hostname;
    document.getElementById("percentage").innerHTML = response.percentage;
  }

  response = { percentage: 0, hostname: 'hostname' }
  setInterval(makeRequest, 60000);
  makeRequest();
}());
