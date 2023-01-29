addEventListener('load', () => {
  const commission = document.getElementById("item-price");
  commission.addEventListener("input", () => {
  const inputValue = commission.value;
  const addTaxDom = document.getElementById("add-tax-price");
  const ProfitDom = document.getElementById("profit");
  // 販売手数料を計算する処理
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
  // 販売手数料を引く処理(販売利益)
  ProfitDom.innerHTML = inputValue - addTaxDom.innerHTML;
  })
});