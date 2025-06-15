let add_buttons = document.querySelectorAll("[data-item-slug] button.add-to-cart");
let sub_buttons = document.querySelectorAll("[data-item-slug] button.sub-from-cart");

//  if(!add_buttons || !sub_buttons) {
//         console.log("One or both buttons not found");
//         return;
//     }

console.log(add_buttons, sub_buttons)


add_buttons.forEach((btn) => {
  btn.addEventListener("click", (e) => {
    let item_id = e.target
      .closest("[data-item-slug]")
      .getAttribute("data-item-slug");

    add(item_id);
  });
});

sub_buttons.forEach((btn) => {
  btn.addEventListener("click", (e) => {
    let item_id = e.target
      .closest("[data-item-slug]")
      .getAttribute("data-item-slug");

    sub(item_id);
  });
});

function sub(item_id) {
  console.debug("Substracting item from cart", item_id);
  let basket = load("basket");
  let new_item = { id: item_id, q: -1 };
  let update = basket_has_item(basket, new_item);

if (update !== false) {
    let old_item = basket[update];
    old_item.q += new_item.q;
    basket[update] = old_item;
  } else {
    basket.push(new_item);
  }


  store(basket);
}

function add(item_id) {
  console.debug("adding item to cart", item_id);
  let basket = load("basket");
  let new_item = { id: item_id, q: 1 };
  let update = basket_has_item(basket, new_item);

  if (update !== false) {
    let old_item = basket[update];
    old_item.q += new_item.q;
    basket[update] = old_item;
  } else {
    basket.push(new_item);
  }

  store(basket);
}
function store(basket) {
  basket = JSON.stringify(basket);
  localStorage.setItem("basket", basket);
}

function load(key) {
  let basket = localStorage.getItem(key) ?? "[]";
  basket = JSON.parse(basket);
  return basket;
}

function basket_has_item(basket, new_item) {
  let update = false;
  basket.forEach((line, index) => {
    if (line.id === new_item.id) {
      update = index;
    }
  });
  return update;
}
