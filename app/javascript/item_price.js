window.addEventListener('load', () => {
  // **↓価格↓**(input要素全体を取得)
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    // value属性を指定しinput要素から入力金額の値を取得
    const inputValue = priceInput.value;

    // **↓販売手数料↓**
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1);
    
    // **↓販売手数料↓**
    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1 ));
  })
});
