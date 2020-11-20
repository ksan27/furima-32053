window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitNumber = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    value_result = inputValue * 0.1
    addTaxDom.innerHTML = Math.floor(value_result);

    profit = inputValue - value_result
    profitNumber.innerHTML = Math.floor(profit);
  })
});

