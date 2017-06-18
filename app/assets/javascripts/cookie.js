var CookieHandler = (function() {

  var url = 'http://localhost:3000/contacts/cookie';
  var urlForSendCurretPage = 'http://localhost:3000/contacts/access';
  var cookieName = '_rdtestsite.cookie';

  var init = function() {
    makeRequest();
  };

  var makeRequest = function() {
    httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = onCreateCookieRequestComplete;
    httpRequest.open('POST', url, true);
    httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
    httpRequest.withCredentials = true;
    httpRequest.send();
  };

  var sendAccessPage = function() {
    var currentPage = window.location.href,
        cookie = getCookie(),
        params = "url="+currentPage+"&key="+cookie.key;
    httpRequest = new XMLHttpRequest();
    httpRequest.open('POST', urlForSendCurretPage, true);
    httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
    httpRequest.withCredentials = true;
    httpRequest.send(params);
  };

  var onCreateCookieRequestComplete = function() {
    var COMPLETE = 4
    var OK = 200;
    var CREATED = 201;
    var NO_CONTENT = 204;

    if (this.readyState === COMPLETE && (this.status == OK || this.status == CREATED || this.status == NO_CONTENT)) {
      createCookie(this.response);
      sendAccessPage();
    }
  };

  var createCookie = function(data) {
    document.cookie = cookieName + "=" + encodeURIComponent(data);
  };

  var getCookie = function() {
    var re = new RegExp(cookieName + "=([^;]+)");
    var value = re.exec(document.cookie);
    return (value != null) ? JSON.parse(unescape(value[1])) : null;
  }

  return {
    init : init
  };

})();
