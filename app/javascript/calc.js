const price = () => {
  //変数を指定
const priceInput = document.getElementById("item-price");
const addTaxDom = document.getElementById("add-tax-price");
const result = document.getElementById("profit");

priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  //ブラウザ上に販売手数料計算したものを表示する
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
  result.innerHTML = Math.floor(inputValue) - Math.floor(inputValue * 0.1);
});
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
