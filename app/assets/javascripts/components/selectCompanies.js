$(".select-category").click(function(){
  clearProductList();

  var allCompanies = gon.companies;
  var arrayLength = allCompanies.length;
  for (var i = 0; i < arrayLength; i++) {
    if (allCompanies[i]["category"].toLowerCase() == this.id) {
      console.log(allCompanies[i]);
      // addSelect(`<div>${allCompanies[i]["name"]}</div>`);
      addSelect(`
        <div class="ranking-card" data-company-id="${allCompanies[i]["id"]}">
          <div class='ranking-card-body'>
            <h3><strong>${allCompanies[i]["name"]}</strong></h3>
          </div>
          <div id="select-btn">
            <form novalidate="novalidate" class="simple_form new_user_selection" id="new_user_selection" action="/user_selections" accept-charset="UTF-8" data-remote="true" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden">
            <div class="form-group hidden user_selection_company_id"><input class="form-control hidden" value="${allCompanies[i]["id"]}" type="hidden" name="user_selection[company_id]" id="user_selection_company_id"></div>
              <input type="submit" name="commit" value="select" class="product-link" data-disable-with="select">
              </form>    <p class="hidden-xs hidden-sm" id="product-mail">customer.service@booking.com</p>
          </div>
        </div>
`);
    }
  }
});

    //  <%= simple_form_for([@user_selection], remote: true) do |f| %>
    //     <%= f.input :company_id, :as => :hidden, :input_html => { :value => company.id }  %>
    //     <%= f.submit "select", class: "product-link" %>
    // <% end %>

function addSelect(selectHTML) {
  var user_selection = document.getElementById('product-list');
  user_selection.insertAdjacentHTML('beforeend', selectHTML);
}

function clearProductList() {
  document.getElementById('product-list').innerHTML = "";
}
