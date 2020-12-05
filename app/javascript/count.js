function count (){
  const itemText = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  itemText.addEventListener("keyup", function(){
    tax.innerHTML = Math.floor(`${itemText.value * 0.1 }`);
    profit.innerHTML = Math.floor(`${itemText.value * 0.9 }`);
  });
}

window.addEventListener('load', count);