(function () {
  Array.prototype.unique = function () {
    let newArray = [...new Set(this)];
    return newArray;
  };
})();
randomKey = function () {
  let key = Date.now() + parseInt(Math.random().toString().slice(2));
  return key.toString(30).repeat(2);
};
