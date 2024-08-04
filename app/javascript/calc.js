const price = () => {

// 金額を入力した数値をpriceInputという変数に格納する
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);

//ブラウザ上に販売手数料計算したものを表示する
const addTaxDom = document.getElementById("add-tax-price");
addTaxDom.innerHTML = inputValue * 0.1
const result = document.getElementById("profit");
result.innerHTML = inputValue * 1.1
})
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);