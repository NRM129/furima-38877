window.addEventListener('load', () => {
  // **↓価格↓**(input要素全体を取得)
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    // value属性を指定しinput要素から入力金額の値を取得
    const inputValue = priceInput.value;
    // 入力した金額の取得
    console.log(inputValue);

    // **↓販売手数料↓**
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.round(priceInput.value * 0.1);
    console.log(priceInput.innerHTML);
    
    // **↓販売手数料↓**
    const addPofitDom = document.getElementById("profit");
    addPofitDom.innerHTML = Math.round(priceInput.value - Math.round(priceInput.value * 0.1 ));
    console.log(priceInput.innerHTML)
  })
});


  //  const addTaxDom = document.getElementById("販売手数料を表示する場所のid");
  //  addTaxDom.innerHTML = "入力した金額をもとに販売手数料を計算する処理"
