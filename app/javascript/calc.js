const price = () => {
  //変数を指定
const priceInput = document.getElementById("item-price");
const addTaxDom = document.getElementById("add-tax-price");
const result = document.getElementById("profit");

priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  //ブラウザ上に販売手数料計算したものを表示する
  addTaxDom.innerHTML = inputValue * 0.1;
  result.innerHTML = inputValue * 1.1;
});
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
